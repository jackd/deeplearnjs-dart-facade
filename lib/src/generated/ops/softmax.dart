@JS()
library softmax;

import "package:js/js.dart";
import "op.dart" show Operation;
import "../graph.dart" show Tensor;
import "../math/math.dart" show NDArrayMath;
import "../tensor_array_map.dart" show TensorArrayMap;
import "../math/ndarray.dart" show Scalar, Array1D;

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
class Softmax extends Operation {
  // @Ignore
  Softmax.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get logitsTensor;
  external set logitsTensor(Tensor v);
  external Tensor get output;
  external set output(Tensor v);
  external factory Softmax(Tensor logitsTensor, Tensor output);
  external feedForward(NDArrayMath math, TensorArrayMap inferenceArrays);
  external backProp(
      [NDArrayMath math,
      TensorArrayMap inferenceArrays,
      TensorArrayMap gradientArrays]);
}

@JS()
class SoftmaxCrossEntropyCost extends Operation {
  // @Ignore
  SoftmaxCrossEntropyCost.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get logitsTensor;
  external set logitsTensor(Tensor v);
  external Tensor get labelTensor;
  external set labelTensor(Tensor v);
  external Tensor get yTensor;
  external set yTensor(Tensor v);
  external factory SoftmaxCrossEntropyCost(
      Tensor logitsTensor, Tensor labelTensor, Tensor yTensor);
  external feedForward(NDArrayMath math, TensorArrayMap inferenceArrays);
  external backProp(NDArrayMath math, TensorArrayMap inferenceArrays,
      TensorArrayMap gradientArrays);
  external disposeTransientArrays(
      TensorArrayMap inferenceArrays, TensorArrayMap gradientArrays);
  external dispose();
  external Tensor get softmaxTensor;
  external set softmaxTensor(Tensor v);
  external get epsilon;
  external set epsilon(v);
}

@JS()
external Scalar crossEntropyCost(
    NDArrayMath math, Array1D y, Array1D target, Scalar epsilon);
