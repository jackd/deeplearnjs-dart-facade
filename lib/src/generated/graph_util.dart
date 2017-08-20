@JS('deeplearn')
library graph_util;

import "package:js/js.dart";
import "graph.dart" show Node, Tensor;
import "tensor_array_map.dart" show TensorArrayMap;

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

/// Given a target node in a graph, accumulate the set of all nodes that need to
/// be evaluated in order to evaluate the target graph. Traversal stops anywhere
/// a node's values are fed in externally via "feed dicts".
@JS()
external List<Node> getUnorderedEvaluationSet(
    List<Node> nodes, List<Node> terminatingNodes);

/// Given a set of nodes, compute their order such that all dependent nodes are
/// evaluated after their dependees. This is the 'inference order' for nodes in
/// the operation graph.
/// evaluated.
@JS()
external List<Node> getOrderedEvaluationSet(List<Node> unorderedEvaluationSet);
@JS()
external bool isInputNode(Node node);
@JS()
external bool shouldBackProp(Tensor t);
@JS()
external bool isPassthroughNode(Node node, TensorArrayMap map);
