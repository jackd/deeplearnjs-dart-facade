@JS('deeplearn')
library graph_runner;

import "package:js/js.dart";
import "package:func/func.dart";
import "math/ndarray.dart" show Scalar, NDArray;
import "session.dart" show FeedEntry, Session;
import "math/math.dart" show NDArrayMath;
import "graph.dart" show Tensor;
import "optimizer.dart" show Optimizer;

/// Copyright 2017 Google Inc. All Rights Reserved.
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
/// http://www.apache.org/licenses/LICENSE-2.0
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
/// ==============================================================================
@JS()
external get DEFAULT_EVAL_INTERVAL_MS;
@JS()
external get DEFAULT_COST_INTERVAL_MS;
@JS()
external get DEFAULT_INFERENCE_EXAMPLE_INTERVAL_MS;

@anonymous
@JS()
abstract class GraphRunnerEventObserver {
  external VoidFunc1<num> get batchesTrainedCallback;
  external set batchesTrainedCallback(VoidFunc1<num> v);
  external VoidFunc1<Scalar> get avgCostCallback;
  external set avgCostCallback(VoidFunc1<Scalar> v);
  external VoidFunc1<NDArray> get metricCallback;
  external set metricCallback(VoidFunc1<NDArray> v);
  external VoidFunc2<List<List<FeedEntry>>, List<NDArray>>
      get inferenceExamplesCallback;
  external set inferenceExamplesCallback(
      VoidFunc2<List<List<FeedEntry>>, List<NDArray>> v);
  external VoidFunc1<num> get inferenceExamplesPerSecCallback;
  external set inferenceExamplesPerSecCallback(VoidFunc1<num> v);
  external VoidFunc1<num> get trainExamplesPerSecCallback;
  external set trainExamplesPerSecCallback(VoidFunc1<num> v);
  external VoidFunc1<num> get totalTimeCallback;
  external set totalTimeCallback(VoidFunc1<num> v);
  external VoidFunc0 get doneTrainingCallback;
  external set doneTrainingCallback(VoidFunc0 v);
  external factory GraphRunnerEventObserver(
      {VoidFunc1<num> batchesTrainedCallback,
      VoidFunc1<Scalar> avgCostCallback,
      VoidFunc1<NDArray> metricCallback,
      VoidFunc2<List<List<FeedEntry>>, List<NDArray>> inferenceExamplesCallback,
      VoidFunc1<num> inferenceExamplesPerSecCallback,
      VoidFunc1<num> trainExamplesPerSecCallback,
      VoidFunc1<num> totalTimeCallback,
      VoidFunc0 doneTrainingCallback});
}

@JS()
class MetricReduction {
  external static num get SUM;
  external static num get MEAN;
}

/// A class that drives the training of a graph model given a dataset. It allows
/// the user to provide a set of callbacks for measurements like cost, accuracy,
/// and speed of training.
@JS()
class GraphRunner {
  // @Ignore
  GraphRunner.fakeConstructor$();
  external NDArrayMath get math;
  external set math(NDArrayMath v);
  external Session get session;
  external set session(Session v);
  external GraphRunnerEventObserver get eventObserver;
  external set eventObserver(GraphRunnerEventObserver v);
  external Tensor get costTensor;
  external set costTensor(Tensor v);
  external List<FeedEntry> get trainFeedEntries;
  external set trainFeedEntries(List<FeedEntry> v);
  external num get batchSize;
  external set batchSize(num v);
  external Optimizer get optimizer;
  external set optimizer(Optimizer v);
  external dynamic /*num|dynamic*/ get currentTrainLoopNumBatches;
  external set currentTrainLoopNumBatches(dynamic /*num|dynamic*/ v);
  external num get costIntervalMs;
  external set costIntervalMs(num v);
  external dynamic /*Tensor|dynamic*/ get metricTensor;
  external set metricTensor(dynamic /*Tensor|dynamic*/ v);
  external dynamic /*List<FeedEntry>|dynamic*/ get metricFeedEntries;
  external set metricFeedEntries(dynamic /*List<FeedEntry>|dynamic*/ v);
  external dynamic /*num|dynamic*/ get metricBatchSize;
  external set metricBatchSize(dynamic /*num|dynamic*/ v);
  external num /*enum MetricReduction*/ get metricReduction;
  external set metricReduction(num /*enum MetricReduction*/ v);
  external num get metricIntervalMs;
  external set metricIntervalMs(num v);
  external Tensor get inferenceTensor;
  external set inferenceTensor(Tensor v);
  external dynamic /*List<FeedEntry>|dynamic*/ get inferenceFeedEntries;
  external set inferenceFeedEntries(dynamic /*List<FeedEntry>|dynamic*/ v);
  external num get inferenceExampleIntervalMs;
  external set inferenceExampleIntervalMs(num v);
  external num get inferenceExampleCount;
  external set inferenceExampleCount(num v);

  /// Runtime information.
  external bool get isTraining;
  external set isTraining(bool v);
  external num get totalBatchesTrained;
  external set totalBatchesTrained(num v);
  external num get batchesTrainedThisRun;
  external set batchesTrainedThisRun(num v);
  external NDArray get lastComputedMetric;
  external set lastComputedMetric(NDArray v);
  external bool get isInferring;
  external set isInferring(bool v);
  external dynamic /*num|dynamic*/ get currentInferenceLoopNumPasses;
  external set currentInferenceLoopNumPasses(dynamic /*num|dynamic*/ v);
  external num get inferencePassesThisRun;
  external set inferencePassesThisRun(num v);
  external num get trainStartTimestamp;
  external set trainStartTimestamp(num v);
  external get lastCostTimestamp;
  external set lastCostTimestamp(v);
  external get lastEvalTimestamp;
  external set lastEvalTimestamp(v);
  external num /*num|Null*/ get lastStopTimestamp;
  external set lastStopTimestamp(num /*num|Null*/ v);
  external get totalIdleTimeMs;
  external set totalIdleTimeMs(v);
  external Scalar get zeroScalar;
  external set zeroScalar(Scalar v);
  external Scalar get metricBatchSizeScalar;
  external set metricBatchSizeScalar(Scalar v);
  external factory GraphRunner(NDArrayMath math, Session session,
      GraphRunnerEventObserver eventObserver);
  external resetStatistics();

  /// Start the training loop with an optional number of batches to train for.
  /// Optionally takes a metric tensor and feed entries to compute periodically.
  /// This can be used for computing accuracy, or a similar metric.
  external train(Tensor costTensor, List<FeedEntry> trainFeedEntries,
      num batchSize, Optimizer optimizer,
      [num numBatches,
      Tensor metricTensor,
      List<FeedEntry> metricFeedEntries,
      num metricBatchSize,
      metricReduction,
      evalIntervalMs,
      costIntervalMs]);
  external stopTraining();
  external resumeTraining();
  external trainNetwork();
  external infer(Tensor inferenceTensor, List<FeedEntry> inferenceFeedEntries,
      [inferenceExampleIntervalMs, inferenceExampleCount, num numPasses]);
  external inferNetwork();
  external stopInferring();
  external bool isInferenceRunning();
  external Scalar computeMetric();
  external num getTotalBatchesTrained();
  external Scalar getLastComputedMetric();
  external setMath(NDArrayMath math);
  external setSession(Session session);
  external setInferenceTensor(Tensor inferenceTensor);
  external setInferenceExampleCount(num inferenceExampleCount);
}
