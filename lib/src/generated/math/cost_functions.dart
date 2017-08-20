@JS('deeplearn')
library cost_functions;

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

/// An error function and its derivative.
@anonymous
@JS()
abstract class ElementWiseCostFunction {
  external dynamic/*=T*/ cost/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x1, dynamic/*=T*/ x2);
  external dynamic/*=T*/ der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x1, dynamic/*=T*/ x2);
  external void dispose();
}

@JS()
class SquareCostFunc implements ElementWiseCostFunction {
  // @Ignore
  SquareCostFunc.fakeConstructor$();
  external get halfOne;
  external set halfOne(v);
  external dynamic/*=T*/ cost/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x1, dynamic/*=T*/ x2);
  external dynamic/*=T*/ der/*<T extends NDArray>*/(
      NDArrayMath math, dynamic/*=T*/ x1, dynamic/*=T*/ x2);
  external dispose();
}
