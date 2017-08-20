@JS()
library linear_combination;

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

/// @hidden
@JS()
class LinearCombination extends Operation {
  // @Ignore
  LinearCombination.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x1Tensor;
  external set x1Tensor(Tensor v);
  external Tensor get x2Tensor;
  external set x2Tensor(Tensor v);
  external Tensor get c1Tensor;
  external set c1Tensor(Tensor v);
  external Tensor get c2Tensor;
  external set c2Tensor(Tensor v);
  external Tensor get outTensor;
  external set outTensor(Tensor v);

  /// A 2-tensor linear combination operation.
  /// Combines tensors x1 and x2 (of the same shape) with weights c1 & c2;
  /// Computes c1*x1 + c2*x2.
  external factory LinearCombination(Tensor x1Tensor, Tensor x2Tensor,
      Tensor c1Tensor, Tensor c2Tensor, Tensor outTensor);
  external feedForward(NDArrayMath math, TensorArrayMap inferenceArrays);
  external backProp(NDArrayMath math, TensorArrayMap inferenceArrays,
      TensorArrayMap gradientArrays);
}
