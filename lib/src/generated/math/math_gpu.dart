@JS('deeplearn')
library math_gpu;

import "package:js/js.dart";
import "math.dart" show NDArrayMath;
import "webgl/gpgpu_context.dart" show GPGPUContext;
import "webgl/texture_manager.dart" show TextureManager;
import "dart:web_gl" show Program;
import "webgl/gpgpu_math.dart" show GPGPUBinary, GPGPUProgram;
import "ndarray.dart" show NDArray, Array2D, Array3D, Scalar, Array1D, Array4D;

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
@JS()
external get BATCHNORM_PROG;
@JS()
external get COPY_PROG;
@JS()
external get CONCAT_PROG;
@JS()
external get RESHAPE_PROG;
@JS()
external get RESIZE_BILINEAR_PROG;
@JS()
external String makeCopyProgramName(
    List<num> /*Tuple of <num,num>*/ sourceShapeRowCol,
    List<num> /*Tuple of <num,num>*/ sourceSizeRowCol,
    List<num> /*Tuple of <num,num>*/ destSizeRowCol);

@JS()
class NDArrayMathGPU extends NDArrayMath {
  // @Ignore
  NDArrayMathGPU.fakeConstructor$() : super.fakeConstructor$();
  external GPGPUContext get gpgpu;
  external set gpgpu(GPGPUContext v);
  external TextureManager get textureManager;
  external set textureManager(TextureManager v);
  external dynamic /*JSMap of <String,Program>*/ get programCache;
  external set programCache(dynamic /*JSMap of <String,Program>*/ v);
  external dynamic /*JSMap of <String,GPGPUBinary>*/ get binaryCache;
  external set binaryCache(dynamic /*JSMap of <String,GPGPUBinary>*/ v);
  external bool get gpgpuCreatedLocally;
  external set gpgpuCreatedLocally(bool v);
  external factory NDArrayMathGPU([GPGPUContext gpgpu, safeMode]);
  external GPGPUContext getGPGPUContext();
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
  external dynamic/*=T*/ makeOutputArray/*<T extends NDArray>*/(
      List<num> shape);
  external dynamic/*=K*/ compileAndRun/*<T extends NDArray, K extends NDArray>*/(
      GPGPUProgram program, List<dynamic/*=T*/ > inputs);
  external dynamic/*=T*/ reshapeTexture/*<T extends NDArray>*/(
      dynamic/*=T*/ a, List<num> /*Tuple of <num,num>*/ newTextureShape);
  external Array2D matMulInternal(
      Array2D a,
      Array2D b,
      num /*enum MatrixOrientation*/ aOrientation,
      num /*enum MatrixOrientation*/ bOrientation);
  external dynamic/*=T*/ multiplyInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external Array3D batchNormalization3DInternal(
      Array3D x,
      dynamic /*Array3D|Array1D*/ mean,
      dynamic /*Array3D|Array1D*/ variance,
      num varianceEpsilon,
      [dynamic /*Array3D|Array1D*/ scale,
      dynamic /*Array3D|Array1D*/ offset]);
  external dynamic/*=T*/ switchDimInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, List<num> newDim);
  external Scalar sumInternal(NDArray a);
  external Scalar argMinInternal(NDArray a);
  external Scalar argMaxInternal(NDArray a);
  external Scalar argMaxEqualsInternal(NDArray x1, NDArray x2);
  external dynamic /*{values: Array1D, indices: Array1D}*/ topKInternal(
      NDArray ndarray, num k);
  external Scalar minInternal(NDArray a);
  external Scalar maxInternal(NDArray a);
  external dynamic/*=T*/ divideInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external dynamic/*=T*/ addInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external dynamic/*=T*/ subInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);
  external Scalar logSumExpInternal(NDArray a);
  external dynamic/*=T*/ expInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ logInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ reluInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ sigmoidInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a);
  external dynamic/*=T*/ tanhInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ sinInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ stepInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external Array3D conv2dInternal(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ bias, num stride, num zeroPad);
  external dynamic /*{dx: Array3D, dw: Array4D, db: Array1D}*/ conv2dBackPropInternal(
      Array3D x, Array3D dy, Array4D weights, num stride, num pad);
  external Array3D conv2dTransposeInternal(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ bias, num origStride, num origPad);
  external Array4D conv2dDerWeights(
      Array3D x, Array3D dY, num fSize, num stride, num zeroPad);
  external Array1D conv2dDerBias(Array3D dY);
  external Array3D maxPoolInternal(Array3D x, num fSize, num stride, num pad);
  external Array3D minPoolInternal(Array3D x, num fSize, num stride, num pad);
  external Array3D avgPoolInternal(Array3D x, num fSize, num stride, num pad);
  external Array3D maxPoolBackpropInternal(
      Array3D dy, Array3D x, num fSize, num origStride, num origPad);
  external Array3D resizeBilinear3DInternal(Array3D x,
      List<num> /*Tuple of <num,num>*/ newShape2D, bool alignCorners);
  external GPGPUBinary getAndSaveBinary(String key, GPGPUBinary getBinary());
  external Program getAndSaveProgram(
      String programKey, String getShaderSource());
  external TextureManager getTextureManager();
  external dispose();
}
