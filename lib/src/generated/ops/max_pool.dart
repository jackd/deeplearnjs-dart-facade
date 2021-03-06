@JS()
library max_pool;

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
class MaxPool extends Operation {
  // @Ignore
  MaxPool.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get xTensor;
  external set xTensor(Tensor v);
  external Tensor get yTensor;
  external set yTensor(Tensor v);
  external num get fieldSize;
  external set fieldSize(num v);
  external get stride;
  external set stride(v);
  external num get pad;
  external set pad(num v);
  external factory MaxPool(Tensor xTensor, Tensor yTensor, num fieldSize,
      [stride, num pad]);
  external feedForward(NDArrayMath math, TensorArrayMap inferenceArrays);
  external backProp(NDArrayMath math, TensorArrayMap inferenceArrays,
      TensorArrayMap gradientArrays);
}
