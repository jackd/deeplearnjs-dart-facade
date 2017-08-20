@JS('deeplearn')
library activation_functions;

import "package:js/js.dart";
import "ndarray.dart" show NDArray;
import "math.dart" show NDArrayMath;

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

/// A node's activation function and its derivative.
@anonymous
@JS()
abstract class ActivationFunction {
  external dynamic/*=T*/ output/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ input);
  external dynamic/*=T*/ der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ input, dynamic/*=T*/ output);
}

@JS()
class TanHFunc implements ActivationFunction {
  // @Ignore
  TanHFunc.fakeConstructor$();
  external output/*<T extends NDArray>*/(NDArrayMath math, dynamic/*=T*/ x);
  external der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x, dynamic/*=T*/ y);
}

@JS()
class ReLUFunc implements ActivationFunction {
  // @Ignore
  ReLUFunc.fakeConstructor$();
  external output/*<T extends NDArray>*/(NDArrayMath math, dynamic/*=T*/ x);
  external der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x, dynamic/*=T*/ y);
}

@JS()
class SigmoidFunc implements ActivationFunction {
  // @Ignore
  SigmoidFunc.fakeConstructor$();
  external output/*<T extends NDArray>*/(NDArrayMath math, dynamic/*=T*/ x);
  external dynamic/*=T*/ der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x, dynamic/*=T*/ y);
}

@JS()
class SquareFunc implements ActivationFunction {
  // @Ignore
  SquareFunc.fakeConstructor$();
  external output/*<T extends NDArray>*/(NDArrayMath math, dynamic/*=T*/ x);
  external der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x, dynamic/*=T*/ y);
}
