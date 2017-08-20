import 'dart:async';
import 'dart:typed_data';
import 'package:deeplearnjs_facade/deeplearnjs_facade.dart';
import 'package:js/js.dart';

void arrayMathGpuTutorial() {
  final math = new NDArrayMathGPU();

  NDArray scopeFn(NDArray keep(NDArray a), NDArray track(NDArray b)) {
    final a = track(new Array2D(
        [2, 2],
        new NDArrayData(
            values: new Float32List.fromList([1.0, 2.0, 3.0, 4.0]))));
    final b = track(new Array2D(
        [2, 2],
        new NDArrayData(
            values: new Float32List.fromList([0.0, 2.0, 4.0, 6.0]))));

    final diff = math.sub(a, b);
    final squaredDiff = math.elementWiseMul(diff, diff);
    final sum = math.sum(squaredDiff);
    final size =
        new Scalar(new NDArrayData(values: new Float32List.fromList([a.size])));
    final average = math.divide(sum, size);
    print('Mean squared difference: ${average.getValues()}');
    return null;
  }

  math.scope<NDArray, NDArray, NDArray>(allowInterop(scopeFn));
}

void graphsAndTensorsTutorial() {
  final g = new Graph();

  // Placeholders are input containers. This is the container for where we will
  // feed an input NDArray when we execute the graph.
  final inputShape = [3];
  final inputTensor = g.placeholder('input', inputShape);
  final labelShape = [1];
  final labelTensor = g.placeholder('label', labelShape);

  // Variables are containers that hold a value that can be updated from
  // training.
  // Here we initialize the multiplier variable randomly.
  final multiplier = g.variable('multiplier', NDArray.randNormal([1, 3]));

  // Top level graph methods take Tensors and return Tensors.
  final outputTensor = g.matmul(multiplier, inputTensor);
  final costTensor = g.meanSquaredCost(outputTensor, labelTensor);

  // Tensors, like NDArrays, have a shape attribute.
  print(outputTensor.shape);

  /**
   * 'Session and FeedEntry' section of the tutorial.
   */
  final learningRate = 0.00001;
  final batchSize = 3;
  final math = new NDArrayMathGPU();

  final session = new Session(g, math);
  final optimizer = new SGDOptimizer(learningRate);

  final inputs = <Array1D>[
    new Array1D(
        new NDArrayData(values: new Float32List.fromList([1.0, 2.0, 3.0]))),
    new Array1D(
        new NDArrayData(values: new Float32List.fromList([10.0, 20.0, 30.0]))),
    new Array1D(new NDArrayData(
        values: new Float32List.fromList([100.0, 200.0, 300.0]))),
  ];

  final labels = <Array1D>[
    new Array1D(new NDArrayData(values: new Float32List.fromList([4.0]))),
    new Array1D(new NDArrayData(values: new Float32List.fromList([40.0]))),
    new Array1D(new NDArrayData(values: new Float32List.fromList([400.0]))),
  ];

  // Shuffles inputs and labels and keeps them mutually in sync.
  final shuffledInputProviderBuilder =
      new InCPUMemoryShuffledInputProviderBuilder([inputs, labels]);
  final providers = shuffledInputProviderBuilder.getInputProviders();
  final inputProvider = providers[0];
  final labelProvider = providers[1];

  // Maps tensors to InputProviders.
  final feedEntries = [
    new FeedEntry(tensor: inputTensor, data: inputProvider),
    new FeedEntry(tensor: labelTensor, data: labelProvider)
  ];

  const numBatches = 10;

  for (var i = 0; i < numBatches; ++i) {
    // Wrap session.train in a scope so the cost gets cleaned up automatically.
    math.scope(
        allowInterop((NDArray track(NDArray a), NDArray keen(NDArray b)) {
      // Train takes a cost tensor to minimize. Trains one batch. Returns the
      // average cost as a Scalar.
      var cost = session.train(
          costTensor, feedEntries, batchSize, optimizer, CostReduction.MEAN);
      print('Last average cost ($i): ${cost.getValues()}');
    }));
  }

  // Wrap session.eval in a scope so the intermediate values get cleaned up
  // automatically.
  math.scope(allowInterop((NDArray track(NDArray a), NDArray keen(NDArray b)) {
    final testInput = track(new Array1D(
        new NDArrayData(values: new Float32List.fromList([0.1, 0.2, 0.3]))));
    final testFeedEntries = [
      new FeedEntry(tensor: inputTensor, data: testInput)
    ];

    final testOutput = session.eval(outputTensor, testFeedEntries);
    print('---inference output---');
    print('shape: ${testOutput.shape}');
    print('value: ${testOutput.getValues()[0]}');
  }));

  inputs.forEach((input) => input.dispose());
  labels.forEach((label) => label.dispose());
}

void main() {
  new Future.delayed(new Duration(seconds: 2))
      .then((_) => arrayMathGpuTutorial())
      .then((_) => graphsAndTensorsTutorial());
}
