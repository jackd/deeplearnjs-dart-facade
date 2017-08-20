@JS('deeplearn')
library ndarray;
import "dart:typed_data" show Float32List;
import "dart:web_gl" show Texture;

import "package:js/js.dart";
import "webgl/gpgpu_context.dart" show GPGPUContext;
import "webgl/texture_manager.dart" show TextureManager;

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

/// These global variables need to be initialized to null so that closure knows
/// not to seal them.
/// @hidden
@JS()
external GPGPUContext get GPGPU;
@JS()
external set GPGPU(GPGPUContext v);

/// @hidden
@JS()
external TextureManager get TEXTURE_MANAGER;
@JS()
external set TEXTURE_MANAGER(TextureManager v);

/// @hidden
@anonymous
@JS()
abstract class NDArrayData {
  external Float32List get values;
  external set values(Float32List v);
  external Texture get texture;
  external set texture(Texture v);

  /// [rows, columns] shape of the texture.
  external List<num> /*Tuple of <num,num>*/ get textureShapeRC;
  external set textureShapeRC(List<num> /*Tuple of <num,num>*/ v);
  external factory NDArrayData(
      {Float32List values,
      Texture texture,
      List<num> /*Tuple of <num,num>*/ textureShapeRC});
}

/// @hidden
@JS()
external initializeGPU(GPGPUContext gpgpu, TextureManager textureManager);
@JS()
external throwIfGPUNotInitialized();

@JS()
class NDArray {
  // @Ignore
  NDArray.fakeConstructor$();

  /// The shape of the ndarray.
  external List<num> get shape;
  external set shape(List<num> v);

  /// Number of elements in the ndarray.
  external num get size;
  external set size(num v);

  /// Number of elements to skip in each dimension when indexing. See
  /// https://docs.scipy.org/doc/numpy/reference/generated
  /// /numpy.ndarray.strides.html
  external List<num> get strides;
  external set strides(List<num> v);
  external NDArrayData get data;
  external set data(NDArrayData v);
  external factory NDArray(List<num> shape, NDArrayData data);

  /// Creates a ndarray of zeros with the specified shape.
  external static NDArray zeros(List<num> shape);

  /// Creates a ndarray of zeros with the same shape as the specified ndarray.
  external static dynamic/*=T*/ zerosLike/*<T extends NDArray>*/(
      dynamic/*=T*/ another);

  /// Creates a ndarray with the same values/shape as the specified ndarray.
  external static dynamic/*=T*/ like/*<T extends NDArray>*/(
      dynamic/*=T*/ another);

  /// Makes a new ndarray with the provided shape and values. Values should be in
  /// a flat array.
  external static dynamic/*=T*/ make/*<T extends NDArray>*/(
      List<num> shape, NDArrayData data);

  /// Reshapes the current ndarray into the provided shape.
  external dynamic/*=T*/ reshape/*<T extends NDArray>*/(List<num> newShape);
  external Scalar asScalar();
  external Array1D as1D();
  external Array2D as2D(num rows, num columns);
  external Array3D as3D(num rows, num columns, num depth);
  external Array4D as4D(num rows, num columns, num depth, num depth2);
  external num get rank;
  // external JS$get([num locs1, num locs2, num locs3, num locs4, num locs5]);
  // external add(num value,
  //     [num locs1, num locs2, num locs3, num locs4, num locs5]);
  // external JS$set(num value,
  //     [num locs1, num locs2, num locs3, num locs4, num locs5]);
  external num locToIndex(List<num> locs);
  external List<num> indexToLoc(num index);
  external fill(num value);
  external NDArrayData getData();
  external Float32List getValues();
  external uploadToGPU([List<num> /*Tuple of <num,num>*/ preferredTexShape]);
  external Texture getTexture(
      [List<num> /*Tuple of <num,num>*/ preferredShapeRC]);
  external List<num> /*Tuple of <num,num>*/ getTextureShapeRC(
      [List<num> /*Tuple of <num,num>*/ preferredShapeRC]);
  external void dispose();
  external disposeTexture();
  external bool inGPU();
  external bool equals(NDArray t);
  external static dynamic/*=T*/ rand/*<T extends NDArray>*/(
      List<num> shape, num randFunction());
  external static randNormal/*<T extends NDArray>*/(List<num> shape,
      [mean, stdDev]);
  external static randTruncatedNormal/*<T extends NDArray>*/(List<num> shape,
      [mean, stdDev]);
  external static randUniform/*<T extends NDArray>*/(
      List<num> shape, num a, num b);
}

@JS()
class Scalar extends NDArray {
  // @Ignore
  Scalar.fakeConstructor$() : super.fakeConstructor$();
  external factory Scalar(NDArrayData data);
  external static JS$new(num value);
  external static get ZERO;
  external static set ZERO(v);
  external static get ONE;
  external static set ONE(v);
  external static get TWO;
  external static set TWO(v);
  external static get NEG_ONE;
  external static set NEG_ONE(v);
  external num JS$get();
  external JS$set(num value);
  external add(num value);
}

@JS()
class Array1D extends NDArray {
  // @Ignore
  Array1D.fakeConstructor$() : super.fakeConstructor$();
  external List<num> /*Tuple of <num>*/ get shape;
  external set shape(List<num> /*Tuple of <num>*/ v);
  external factory Array1D(NDArrayData data);
  external static JS$new(dynamic /*Float32List|List<num>*/ values);
  external num JS$get(num i);
  external JS$set(num value, num i);
  external add(num value, num i);
  external num locToIndex(List<num> /*Tuple of <num>*/ loc);
  external List<num> /*Tuple of <num>*/ indexToLoc(num index);
  external static Array1D zeros(List<num> /*Tuple of <num>*/ shape);
}

@JS()
class Array2D extends NDArray {
  // @Ignore
  Array2D.fakeConstructor$() : super.fakeConstructor$();
  external List<num> /*Tuple of <num,num>*/ get shape;
  external set shape(List<num> /*Tuple of <num,num>*/ v);
  external num get stride0;
  external set stride0(num v);
  external factory Array2D(
      List<num> /*Tuple of <num,num>*/ shape, NDArrayData data);
  external static JS$new(List<num> /*Tuple of <num,num>*/ shape,
      dynamic /*Float32List|List<num>|List<List<num>>*/ values);
  external JS$get(num i, num j);
  external JS$set(num value, num i, num j);
  external add(num value, num i, num j);
  external num locToIndex(List<num> /*Tuple of <num,num>*/ locs);
  external List<num> /*Tuple of <num,num>*/ indexToLoc(num index);
  external static Array2D zeros(List<num> /*Tuple of <num,num>*/ shape);
}

@JS()
class Array3D extends NDArray {
  // @Ignore
  Array3D.fakeConstructor$() : super.fakeConstructor$();
  external List<num> /*Tuple of <num,num,num>*/ get shape;
  external set shape(List<num> /*Tuple of <num,num,num>*/ v);
  external num get stride0;
  external set stride0(num v);
  external num get stride1;
  external set stride1(num v);
  external factory Array3D(
      List<num> /*Tuple of <num,num,num>*/ shape, NDArrayData data);
  external static JS$new(List<num> /*Tuple of <num,num,num>*/ shape,
      dynamic /*Float32List|List<num>|List<List<List<num>>>*/ values);
  external JS$get(num i, num j, num k);
  external JS$set(num value, num i, num j, num k);
  external add(num value, num i, num j, num k);
  external num locToIndex(List<num> /*Tuple of <num,num,num>*/ locs);
  external List<num> /*Tuple of <num,num,num>*/ indexToLoc(num index);
  external static Array3D zeros(List<num> /*Tuple of <num,num,num>*/ shape);
}

@JS()
class Array4D extends NDArray {
  // @Ignore
  Array4D.fakeConstructor$() : super.fakeConstructor$();
  external List<num> /*Tuple of <num,num,num,num>*/ get shape;
  external set shape(List<num> /*Tuple of <num,num,num,num>*/ v);
  external num get stride0;
  external set stride0(num v);
  external num get stride1;
  external set stride1(num v);
  external num get stride2;
  external set stride2(num v);
  external factory Array4D(
      List<num> /*Tuple of <num,num,num,num>*/ shape, NDArrayData data);
  external static JS$new(List<num> /*Tuple of <num,num,num,num>*/ shape,
      dynamic /*Float32List|List<num>|List<List<List<List<num>>>>*/ values);
  external JS$get(num i, num j, num k, num l);
  external JS$set(num value, num i, num j, num k, num l);
  external add(num value, num i, num j, num k, num l);
  external num locToIndex(List<num> /*Tuple of <num,num,num,num>*/ locs);
  external List<num> /*Tuple of <num,num,num,num>*/ indexToLoc(num index);
  external static Array4D zeros(List<num> /*Tuple of <num,num,num,num>*/ shape);
}

/*type ArrayData = Float32Array|number[]|number[][]|number[][][]|number[][][][];*/
@JS()
external Float32List toTypedArray(
    dynamic /*Float32List|List<num>|List<List<num>>|List<List<List<num>>>|List<List<List<List<num>>>>*/ a);
