@JS()
library element_wise_activation;

import "package:js/js.dart";
import "op.dart" show Operation;
import "../graph.dart" show Tensor;
import "../math/activation_functions.dart" show ActivationFunction;
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
/// tslint:disable-next-line:max-line-length

/// @hidden
@JS()
class ElementWiseActivation extends Operation {
  // @Ignore
  ElementWiseActivation.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get xTensor;
  external set xTensor(Tensor v);
  external Tensor get yTensor;
  external set yTensor(Tensor v);
  external ActivationFunction get func;
  external set func(ActivationFunction v);
  external factory ElementWiseActivation(
      Tensor xTensor, Tensor yTensor, ActivationFunction func);
  external feedForward(NDArrayMath math, TensorArrayMap inferenceArrays);
  external backProp(NDArrayMath math, TensorArrayMap inferenceArrays,
      TensorArrayMap gradientArrays);
}

/// @hidden
@JS()
class ReLU extends ElementWiseActivation {
  // @Ignore
  ReLU.fakeConstructor$() : super.fakeConstructor$();
  external factory ReLU(Tensor xTensor, Tensor yTensor);
}

/// @hidden
@JS()
class TanH extends ElementWiseActivation {
  // @Ignore
  TanH.fakeConstructor$() : super.fakeConstructor$();
  external factory TanH(Tensor xTensor, Tensor yTensor);
}

/// @hidden
@JS()
class Sigmoid extends ElementWiseActivation {
  // @Ignore
  Sigmoid.fakeConstructor$() : super.fakeConstructor$();
  external factory Sigmoid(Tensor xTensor, Tensor yTensor);
}

/// @hidden
@JS()
class Square extends ElementWiseActivation {
  // @Ignore
  Square.fakeConstructor$() : super.fakeConstructor$();
  external factory Square(Tensor xTensor, Tensor yTensor);
}
