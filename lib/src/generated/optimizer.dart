@JS('deeplearn')
library optimizer;

import "package:js/js.dart";
import "graph.dart" show VariableNode, Node;
import "math/math.dart" show NDArrayMath;
import "session.dart" show SessionRuntime;
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
@JS()
abstract class Optimizer {
  // @Ignore
  Optimizer.fakeConstructor$();
  external List<VariableNode> get variableNodes;
  external set variableNodes(List<VariableNode> v);
  external List<
      VariableNode> /*List<VariableNode>|Null*/ get specifiedVariableNodes;
  external set specifiedVariableNodes(
      List<VariableNode> /*List<VariableNode>|Null*/ v);
  external factory Optimizer([List<Node> specifiedVariableList]);
  external void beforeBatch(
      NDArrayMath math,
      num batchSize,
      SessionRuntime runtime,
      TensorArrayMap activationArrayMap,
      TensorArrayMap gradientArrayMap);
  external void afterExample(NDArrayMath math, SessionRuntime runtime,
      TensorArrayMap activationArrayMap, TensorArrayMap gradientArrayMap);
  external void afterBatch(
      NDArrayMath math,
      num batchSize,
      SessionRuntime runtime,
      TensorArrayMap activationArrayMap,
      TensorArrayMap gradientArrayMap);
  external void dispose();
}
