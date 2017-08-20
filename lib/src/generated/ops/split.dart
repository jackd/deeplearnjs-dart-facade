@JS()
library split;

import "package:js/js.dart";
import "op.dart" show Operation;
import "../graph.dart" show Tensor;
import "../math/math.dart" show NDArrayMath;
import "../tensor_array_map.dart" show TensorArrayMap;

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

/// Split ops are used to accumulate backprop derivatives when a node's output
/// tensor is consumed by multiple nodes.
@JS()
class Split extends Operation {
  // @Ignore
  Split.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get input;
  external set input(Tensor v);
  external List<Tensor> get outputs;
  external set outputs(List<Tensor> v);
  external factory Split(Tensor input, List<Tensor> outputs);
  external feedForward(NDArrayMath math, TensorArrayMap inferenceArrays);
  external backProp(NDArrayMath math, TensorArrayMap inferenceArrays,
      TensorArrayMap gradientArrays);
}
