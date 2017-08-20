@JS('deeplearn')
library math_cpu;

import "package:js/js.dart";
import "math.dart" show NDArrayMath;
import "ndarray.dart" show NDArray, Array2D, Array3D, Scalar, Array4D, Array1D;

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
class NDArrayMathCPU extends NDArrayMath {
  // @Ignore
  NDArrayMathCPU.fakeConstructor$() : super.fakeConstructor$();
  external factory NDArrayMathCPU([safeMode]);
  external dynamic/*=T*/ cloneInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external dynamic/*=T2*/ reshapeInternal/*<T1 extends NDArray, T2 extends NDArray>*/(
      dynamic/*=T1*/ ndarray, List<num> newShape);
  external Array2D slice2DInternal(
      Array2D input,
      List<num> /*Tuple of <num,num>*/ beginRowCol,
      List<num> /*Tuple of <num,num>*/ sizeRowCol);
  external void copy2DInternal(
      Array2D source,
      List<num> /*Tuple of <num,num>*/ sourceBeginRowCol,
      List<num> /*Tuple of <num,num>*/ sourceSizeRowCol,
      Array2D dest,
      List<num> /*Tuple of <num,num>*/ destBeginRowCol,
      List<num> /*Tuple of <num,num>*/ destSizeRowCol);
  external Array3D concat3DInternal(Array3D x1, Array3D x2, num axis);
  external scaledArrayAddInternal/*<T extends NDArray>*/(
      Scalar c1, dynamic/*=T*/ a, Scalar c2, dynamic/*=T*/ b);
  external dynamic/*=T*/ negInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ addInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external dynamic/*=T*/ subInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external Array2D matMulInternal(Array2D a, Array2D b,
      [aOrientation, bOrientation]);
  external dynamic/*=T*/ multiplyInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external dynamic/*=T*/ divideInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external Scalar sumInternal(NDArray ndarray);
  external Scalar argMinInternal(NDArray ndarray);
  external Scalar argMaxInternal(NDArray ndarray);
  external Scalar argMaxEqualsInternal(NDArray x1, NDArray x2);
  external dynamic /*{values: Array1D, indices: Array1D}*/ topKInternal(
      NDArray ndarray, num k);
  external Scalar minInternal(NDArray ndarray);
  external Scalar maxInternal(NDArray ndarray);
  external dynamic/*=T*/ expInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ logInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external Scalar logSumExpInternal(NDArray ndarray);
  external dynamic/*=T*/ reluInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ sigmoidInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ tanhInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ sinInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ stepInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// image is of shape [r, c, d1].
  /// weights is of shape [F, F, d1, d2].
  external Array3D conv2dInternal(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ biases, num stride, num pad);
  external dynamic /*{dx: Array3D, dw: Array4D, db: Array1D}*/ conv2dBackPropInternal(
      Array3D x, Array3D dy, Array4D weights, num stride, num pad);

  /// image is of shape [r, c, d1].
  /// weights is of shape [F, F, d1, d2].
  external Array3D conv2dTransposeInternal(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ biases, num origStride, num origPad);

  /// image is of shape [r, c, d1].
  /// weights is of shape [F, F, d1, d2].
  external Array3D conv2dTransposeShaderLike(
      Array3D x, Array4D origWeights, num origStride, num origPad);
  external Array4D conv2dDerWeights(
      Array3D x, Array3D dY, num fSize, num stride, num zeroPad);
  external Array1D conv2dDerBias(Array3D dY);
  external dynamic/*=T*/ switchDimInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ t, List<num> newDim);
  external pool(Array3D x, num fSize, num stride, num pad,
      String /*'max'|'min'|'avg'*/ poolType);
  external Array3D maxPoolInternal(Array3D x, num fSize, num stride, num pad);
  external maxPoolPositions(Array3D x, num fSize, num stride, num pad);
  external Array3D maxPoolBackpropInternal(
      Array3D dy, Array3D x, num fSize, num origStride, num origPad);
  external Array3D minPoolInternal(Array3D x, num fSize, num stride, num pad);
  external Array3D avgPoolInternal(Array3D x, num fSize, num stride, num pad);
  external Array3D resizeBilinear3DInternal(Array3D x,
      List<num> /*Tuple of <num,num>*/ newShape2D, bool alignCorners);
  external Array3D batchNormalization3DInternal(Array3D x,
      dynamic /*Array3D|Array1D*/ mean, dynamic /*Array3D|Array1D*/ variance,
      [varianceEpsilon,
      dynamic /*Array3D|Array1D*/ scale,
      dynamic /*Array3D|Array1D*/ offset]);
}
