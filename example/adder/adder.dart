import 'dart:html';
import 'dart:typed_data';
import 'package:js/js.dart';
import 'package:deeplearnjs_facade/deeplearnjs_facade.dart';

class Adder {
  Tensor inputTensorA;
  Tensor inputTensorB;

  Tensor sum;
  Session session;

  final math = new NDArrayMathGPU();

  void setupSession() {
    final graph = new Graph();
    inputTensorA = graph.placeholder('A', []);
    inputTensorB = graph.placeholder('B', []);
    sum = graph.add(inputTensorA, inputTensorB);
    session = new Session(graph, math);
  }

  num computeSum(num a, num b) {
    final feeds = [
      new FeedEntry(
          tensor: inputTensorA,
          data: new Scalar(new NDArrayData(values: new Float32List.fromList([a.toDouble()])))),
      new FeedEntry(
          tensor: inputTensorB,
          data: new Scalar(new NDArrayData(values: new Float32List.fromList([b.toDouble()])))),
    ];
    num result;
    math.scope(allowInterop((NDArray track(NDArray x), NDArray keep(NDArray x)) {
      result = session.eval(sum, feeds).getValues()[0];
    }));
    return result;
  }
}

void main() {
  final adder = new Adder()
    ..setupSession();

  final outputElement = querySelector('#output');
  if (outputElement == null) {
    throw new StateError('no output element found');
  }

  void printOutput(num result) {
    outputElement.text = result.toString();
  }

  InputElement inA = querySelector('#A');
  if (inA == null) {
    throw new StateError('no A input element found');
  }
  InputElement inB = querySelector('#B');
  if (inB == null) {
    throw new StateError('no B input element found');
  }

  void execute() {
    var a = num.parse(inA.value);
    var b = num.parse(inB.value);
    printOutput(adder.computeSum(a, b));
  }

  inA.onKeyUp.listen((_) => execute());
  inB.onKeyUp.listen((_) => execute());
  execute();
}
