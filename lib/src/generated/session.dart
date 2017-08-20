@JS('deeplearn')
library session;

import "package:js/js.dart";
import "graph.dart" show Tensor, Graph, Node;
import "math/ndarray.dart" show NDArray, Scalar;
import "input_provider.dart" show InputProvider;
import "math/math.dart" show NDArrayMath;
import "optimizer.dart" show Optimizer;
import "ops/op.dart" show Operation;

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

/// FeedEntry associates a tensor with user-provided NDArray data.
@anonymous
@JS()
abstract class FeedEntry {
  external Tensor get tensor;
  external set tensor(Tensor v);
  external dynamic /*NDArray|InputProvider*/ get data;
  external set data(dynamic /*NDArray|InputProvider*/ v);
  external factory FeedEntry(
      {Tensor tensor, dynamic /*NDArray|InputProvider*/ data});
}

/// A FeedDictionary holds a map from tensors to user-provided NDArrays. Feed
/// dictionaries represent the 'entry points' of evaluation, since graph nodes
/// that are replaced by feeds don't need to have their input nodes evaluated.
/// Feed dictionaries usually provide NDArray data for Placeholder nodes, but any
/// node in the graph can be replaced by a feed dictionary entry.
/// @hidden
@JS()
class FeedDictionary {
  // @Ignore
  FeedDictionary.fakeConstructor$();
  external dynamic /*JSMap of <num,FeedEntry>*/ get dict;
  external set dict(dynamic /*JSMap of <num,FeedEntry>*/ v);

  /// Optionally construct a FeedDictionary from an array of entries.
  external factory FeedDictionary([List<FeedEntry> feedEntries]);
}

@JS()
class CostReduction {
  external static num get NONE;
  external static num get SUM;
  external static num get MEAN;
}

/// A Session maintains the runtime state required to efficiently evaluate nodes.
/// On their own, graph objects are very lightweight logical topologies; they
/// have no relationship with the GPU. Sessions encapsulate the evaluation of
/// nodes, the management of GPU resources, the caching of evaluation paths, and
/// anything else required to evaluate or train a network.
@JS()
class Session {
  // @Ignore
  Session.fakeConstructor$();
  external NDArrayMath get math;
  external set math(NDArrayMath v);
  external factory Session(Graph graph, NDArrayMath math);

  /// Release all system resources associated with this Session.
  external dispose();

  /// Evaluate a list of tensors, using the provided feed entries to provide
  /// upstream NDArray input.
  /// When using a `NDArrayMath` object in safe mode this must be used in a
  /// math.scope().
  /// tensors with NDArrays.
  external List<NDArray> evalAll(
      List<Tensor> tensors, List<FeedEntry> feedEntries);

  /// Evaluate a tensor, using the provided feed entries to provide
  /// upstream NDArray input.
  /// tensors with NDArrays.
  external NDArray eval(Tensor tensor, List<FeedEntry> feedEntries);

  /// Trains a batch.
  /// Returns a reduced cost if the costReduction parameter is set.
  /// When using a `NDArrayMath` object in safe mode this must be used in a
  /// math.scope().
  /// scalar.
  /// or no cost back.
  /// responsible for disposing the cost NDArray between train loops.
  external Scalar train(Tensor costTensor, List<FeedEntry> feedEntries,
      num batchSize, Optimizer optimizer,
      [costReduction]);
  external Scalar updateCostForExample(Scalar totalCost, Scalar currCost,
      num /*enum CostReduction*/ costReduction);
  external Scalar updateCostForBatch(
      Scalar totalCost, num /*enum CostReduction*/ costReduction);
  external SessionRuntime getOrCreateRuntime(
      List<Tensor> tensors, FeedDictionary feed);
  external String makeRuntimeCacheKey(
      List<Tensor> tensors, FeedDictionary feed);

  /// Maps each output tensor of the graph to its activation value.
  external get activationArrayMap;
  external set activationArrayMap(v);

  /// Maps each tensor of the graph to its derivative wrt the cost function.
  external get gradientArrayMap;
  external set gradientArrayMap(v);
  external dynamic /*JSMap of <String,SessionRuntime>*/ get runtimeCache;
  external set runtimeCache(dynamic /*JSMap of <String,SessionRuntime>*/ v);

  /// Batch size of the previous train() call.
  external num get prevBatchSize;
  external set prevBatchSize(num v);
  external Scalar get batchSizeScalar;
  external set batchSizeScalar(Scalar v);
  external get oneScalar;
  external set oneScalar(v);
}

/// @hidden
@anonymous
@JS()
abstract class SessionRuntime {
  external List<Node> get nodes;
  external set nodes(List<Node> v);
  external List<Operation> get operations;
  external set operations(List<Operation> v);
  external factory SessionRuntime(
      {List<Node> nodes, List<Operation> operations});
}
