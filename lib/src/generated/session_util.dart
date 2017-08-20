@JS('deeplearn')
library session_util;

import "package:js/js.dart";
import "graph.dart" show Node, Tensor, VariableNode;
import "session.dart" show FeedDictionary;
import "tensor_array_map.dart" show TensorArrayMap;
import "math/math.dart" show NDArrayMath;
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

/// tslint:disable-next-line:max-line-length

/// Creates an array of graph nodes that stop traversal, based on the contents
/// of the provided FeedDictionary. This is a simple 1:1 extraction of nodes from
/// the FeedDictionary.
/// @hidden
@JS()
external List<Node> getTerminatingNodesFromFeedDictionary(
    FeedDictionary feedDictionary);

/// Given a tensor and a feed dictionary, computes the set of nodes that need to
/// be evaluated to perform inference.
/// @hidden
@JS()
external List<Node> getOrderedEvaluationSetFromEvalTensor(
    List<Tensor> evalTensors, FeedDictionary feedDictionary);

/// Traverses the provided node array and adds all persistent node NDArrays to
/// the provided TensorArrayMap.
/// @hidden
/// nodes.
@JS()
external addPersistentArraysToTensorArrayMap(
    List<Node> evaluationSet, TensorArrayMap tensorArrayMap);

/// @hidden
@JS()
external List<VariableNode> getVariableNodesFromEvaluationSet(
    List<Node> evaluationSet);

/// @hidden
@JS()
external throwIfFeedDictionaryContainsNDArrays(FeedDictionary feedDictionary);

/// @hidden
@JS()
external loadInputsFromFeedDictionaryToTensorArrayMap(
    FeedDictionary batchFeed, TensorArrayMap activations, NDArrayMath math);

/// @hidden
@JS()
external releaseFeedDictionaryInputsFromTensorArrayMap(
    FeedDictionary batchFeed, TensorArrayMap activations, NDArrayMath math);

/// Removes all nodes from the provided Node array whose output tensors exist in
/// the provided feed dictionary. After calling this, the Node array should
/// contain zero Placeholder nodes, or the user has failed to provide a feed for
/// a Placeholder node.
/// @hidden
@JS()
external removeFeedDictionaryNodesFromEvaluationSet(
    FeedDictionary feedDictionary, List<Node> evaluationSet);

/// Disposes any NDArrays on the tensorArrayMap from operation outputs and sets
/// the value to null.
/// @hidden
@JS()
external disposeAndInitializeOperationOutputs(
    List<Node> evaluationSet, TensorArrayMap tensorArrayMap);

/// Disposes any NDArrays on the tensorArrayMap from derivatives of operation
/// inputs and sets the value to null.
/// @hidden
@JS()
external disposeAndInitializeOperationInputGradients(
    List<Node> evaluationSet, TensorArrayMap gradients);

/// Calls underlying operation disposeTransientArrays methods which clean up any
/// NDArrays which operations may have created during a run.
/// @hidden
@JS()
external disposeTransientOperationArrays(List<Operation> operations,
    TensorArrayMap activations, TensorArrayMap gradients);

/// Iterates the provided Node array and throws an exception if there are any
/// Placeholder nodes present. Call after the evaluation set has been pruned with
/// the accompanying FeedDictionary to ensure that all inputs have been resolved.
/// @hidden
@JS()
external throwErrorIfEvaluationSetContainsPlaceholderNodes(
    List<Node> evaluationSet);

/// Injects splits nodes after every node that has multiple consumers.
/// @hidden
@JS()
external List<Node> addSplitNodes(List<Node> nodes);
