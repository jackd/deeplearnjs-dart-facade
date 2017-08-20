@JS('deeplearn')
library math;

import "package:js/js.dart";
import "ndarray.dart" show Array2D, NDArray, Array1D, Scalar, Array3D, Array4D;

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
/*export type ScopeResult = NDArray[]|NDArray|void;*/
typedef List<Array2D> /*Tuple of <Array2D,Array2D>*/ LSTMCell(
    Array2D data, Array2D c, Array2D h);

@JS()
abstract class NDArrayMath {
  // @Ignore
  NDArrayMath.fakeConstructor$();
  external bool get safeMode;
  external set safeMode(bool v);
  external List<List<NDArray>> get ndarrayScopes;
  external set ndarrayScopes(List<List<NDArray>> v);
  external List<NDArray> get activeScope;
  external set activeScope(List<NDArray> v);
  external List<List<NDArray>> get ndarraysToKeep;
  external set ndarraysToKeep(List<List<NDArray>> v);
  external List<NDArray> get activeScopeNDArraysToKeep;
  external set activeScopeNDArraysToKeep(List<NDArray> v);
  external get debugMode;
  external set debugMode(v);

  /// a math.scope() which will automatically clean up intermediate NDArrays.
  external factory NDArrayMath(bool safeMode);

  /// Create a new math scope. Put chained math operations inside a scope
  /// function closure so that the library automatically cleans up NDArrays
  /// from intermediate math operations. You must create a scope in safe mode
  /// to call math operations. If a result is returned from the scope, it will
  /// also be tracked, which means there must be yet another wrapping scope.
  external scope/*<T extends NDArray, T1 extends NDArray, T2 extends NDArray>*/(
      dynamic/*=T*/ scopeFn(dynamic/*=T1*/ keep(dynamic/*=T1*/ ndarray),
          dynamic/*=T2*/ track(dynamic/*=T2*/ ndarray)));

  /// In debug mode, the output of every math call will be downloaded to the CPU
  /// and checked for NaNs. This significantly impacts performance.
  external enableDebugMode();

  /// Start a scope. Use this with endScope() to achieve the same functionality
  /// as scope() without the need for a function closure.
  external startScope();

  /// End a scope. Use this with startScope() to achieve the same functionality
  /// as scope() without the need for a function closure.
  external endScope(dynamic /*List<NDArray>|NDArray|Null*/ result);
  external isNDArrayDataInList(NDArray ndarray, List<NDArray> ndarrayList);

  /// Keeps an NDArray in the current scope from being disposed automatically.
  external dynamic/*=T*/ keep/*<T extends NDArray>*/(dynamic/*=T*/ result);
  external void checkForNaN(NDArray arr);

  /// Tracks an NDArray in the current scope to be automatically cleaned up when
  /// the current scope ends, and returns the value.
  external dynamic/*=T*/ track/*<T extends NDArray>*/(dynamic/*=T*/ result);

  /// Computes the dot product of two matrices, A * B. These must be matrices,
  /// use matrixTimesVector and vectorTimesMatrix, dotProduct, and outerProduct
  /// in other cases.
  /// compute A^T * B.
  /// compute A * B^T.
  external Array2D matMul(Array2D a, Array2D b, [aOrientation, bOrientation]);
  external Array2D matMulInternal(
      Array2D a,
      Array2D b,
      num /*enum MatrixOrientation*/ aOrientation,
      num /*enum MatrixOrientation*/ bOrientation);

  /// Computes the dot product of a vector and a matrix, v * B.
  external Array1D vectorTimesMatrix(Array1D v, Array2D matrix);

  /// Computes the dot product of a matrix and vector, A * v.
  external Array1D matrixTimesVector(Array2D matrix, Array1D v);

  /// Computes the dot product of two vectors, v1 * v2.
  external Scalar dotProduct(Array1D v1, Array1D v2);

  /// Computes the outer product of two vectors, v1 and v2.
  external Array2D outerProduct(Array1D v1, Array1D v2);

  /// ////////////
  /// Shape ops //
  /// ////////////
  /// Clones an NDArray of any shape.
  external dynamic/*=T*/ clone/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ cloneInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Reshapes an NDArray to a new shape. The size of the input NDArray must
  /// match the size of the requested shape.
  /// size as the NDArray.
  external dynamic/*=T2*/ reshape/*<T1 extends NDArray, T2 extends NDArray>*/(
      dynamic/*=T1*/ ndarray, List<num> newShape);
  external dynamic/*=T2*/ reshapeInternal/*<T1 extends NDArray, T2 extends NDArray>*/(
      dynamic/*=T1*/ ndarray, List<num> newShape);

  /// Extracts a slice from a matrix. The operation extraces a slice from input
  /// that starts at coordinates `begin` and is of size `size`.
  /// from.
  external Array2D slice2D(
      Array2D input,
      List<num> /*Tuple of <num,num>*/ begin,
      List<num> /*Tuple of <num,num>*/ size);
  external Array2D slice2DInternal(
      Array2D input,
      List<num> /*Tuple of <num,num>*/ begin,
      List<num> /*Tuple of <num,num>*/ size);

  /// Copies a window from the `source` matrix starting at `sourceBegin` and is
  /// of size `sourceSize` to a window in the `dest` matrix starting at
  /// `destBegin` and is of size `destSize`/
  external copy2D(
      Array2D source,
      List<num> /*Tuple of <num,num>*/ sourceBegin,
      List<num> /*Tuple of <num,num>*/ sourceSize,
      Array2D dest,
      List<num> /*Tuple of <num,num>*/ destBegin,
      List<num> /*Tuple of <num,num>*/ destSize);
  external void copy2DInternal(
      Array2D source,
      List<num> /*Tuple of <num,num>*/ sourceBegin,
      List<num> /*Tuple of <num,num>*/ sourceSize,
      Array2D dest,
      List<num> /*Tuple of <num,num>*/ destBegin,
      List<num> /*Tuple of <num,num>*/ destSize);

  /// Concatenates two 3D ndarrays along a given axis.
  /// For example, if:
  /// A: shape(2, 1, 3) = | r1, g1, b1 |
  /// | r2, g2, b2 |
  /// B: shape(2, 1, 3) = | r3, g3, b3 |
  /// | r4, g4, b4 |
  /// C = concat3D(A, B, axis)
  /// if axis = 0:
  /// C: shape(4, 1, 3) = | r1, g1, b1 |
  /// | r2, g2, b2 |
  /// | r3, g3, b3 |
  /// | r4, g4, b4 |
  /// if axis = 1:
  /// C: shape(2, 2, 3) = | r1, g1, b1, r3, g3, b3 |
  /// | r2, g2, b2, r4, g4, b4 |
  /// if axis = 2:
  /// C = shape(2, 1, 6) = | r1, g1, b1, r3, g3, b3 |
  /// | r2, g2, b2, r4, g4, b4 |
  external Array3D concat3D(Array3D ndarray1, Array3D ndarray2, num axis);
  external Array3D concat3DInternal(
      Array3D ndarray1, Array3D ndarray2, num axis);

  /// ////////////////
  /// Reduction ops //
  /// ////////////////
  /// Computes the the log(sum(e ^ x)) for each x in the input ndarray.
  external Scalar logSumExp(NDArray ndarray);
  external Scalar logSumExpInternal(NDArray ndarray);

  /// Computes the sum of all the entries in the input NDArray.
  external Scalar sum(NDArray ndarray);
  external Scalar sumInternal(NDArray ndarray);

  /// Computes the flattened index of the minimum element in the ndarray.
  external Scalar argMin(NDArray ndarray);
  external Scalar argMinInternal(NDArray ndarray);

  /// Computes the flattened index of the maximum element in the ndarray.
  external Scalar argMax(NDArray ndarray);
  external Scalar argMaxInternal(NDArray ndarray);

  /// Returns a 1 if the argMax of x1 and x2 are the same, otherwise 0.
  external Scalar argMaxEquals(NDArray x1, NDArray x2);
  external Scalar argMaxEqualsInternal(NDArray x1, NDArray x2);

  /// Computes the top K values and flattened indices.
  external dynamic /*{values: Array1D, indices: Array1D}*/ topK(
      NDArray ndarray, num k);
  external dynamic /*{values: Array1D, indices: Array1D}*/ topKInternal(
      NDArray ndarray, num k);

  /// Computes the minimum value from the input.
  external Scalar min(NDArray ndarray);
  external Scalar minInternal(NDArray ndarray);

  /// Computes the maximum value from the input.
  external Scalar max(NDArray ndarray);
  external Scalar maxInternal(NDArray ndarray);

  /// Computes the softmax normalized vector from the input vector.
  external Array1D softmax(Array1D x);

  /// ///////////////////
  /// Element-wise ops //
  /// ///////////////////
  /// Switches dimensions of the input NDArray.
  external dynamic/*=T*/ switchDim/*<T extends NDArray>*/(
      dynamic/*=T*/ a, List<num> newDim);
  external dynamic/*=T*/ switchDimInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, List<num> newDim);

  /// Computes a scalar plus NDArray, c + A.
  external dynamic/*=T*/ scalarPlusArray/*<T extends NDArray>*/(
      Scalar c, dynamic/*=T*/ a);

  /// Computes a scalar minus NDArray, c - A.
  external dynamic/*=T*/ scalarMinusArray/*<T extends NDArray>*/(
      Scalar c, dynamic/*=T*/ a);

  /// Computes A - c. A is NDArray, c is Scalar.
  external dynamic/*=T*/ arrayMinusScalar/*<T extends NDArray>*/(
      dynamic/*=T*/ a, Scalar c);

  /// Computes -1 * A element-wise.
  external dynamic/*=T*/ neg/*<T extends NDArray>*/(dynamic/*=T*/ a);
  external dynamic/*=T*/ negInternal/*<T extends NDArray>*/(dynamic/*=T*/ a);

  /// Adds two NDArrays element-wise, A + B. Supports broadcasting.
  /// For a stricter version without broadcasting use math.addStrict().
  external NDArray add(NDArray a, NDArray b);
  external dynamic/*=T*/ addInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Adds two NDArrays element-wise, A + B. Inputs must
  /// be the same shape. For broadcasting support, use math.add() instead.
  external dynamic/*=T*/ addStrict/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Subtracts two NDArrays element-wise, A - B. Supports broadcasting.
  /// For a stricter version without broadcasting use math.subStrict().
  external NDArray sub(NDArray a, NDArray b);
  external dynamic/*=T*/ subInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Subtracts two NDArrays element-wise, A - B. Inputs must
  /// be the same shape. For broadcasting support, use math.sub() instead.
  external dynamic/*=T*/ subStrict/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Multiplies two NDArrays element-wise, A * B. Supports broadcasting.
  /// For a stricter version without broadcasting use math.multiplyStrict().
  external NDArray multiply(NDArray a, NDArray b);
  external dynamic/*=T*/ multiplyInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Use math.multiplyStrict() instead.
  external dynamic/*=T*/ elementWiseMul/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Multiplies two NDArrays element-wise, A * B. Inputs must
  /// be the same shape. For broadcasting support, use math.multiply() instead.
  external dynamic/*=T*/ multiplyStrict/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Divides two NDArrays element-wise, A / B. Supports broadcasting.
  /// For a stricter version without broadcasting use math.divideStrict().
  external NDArray divide(NDArray a, NDArray b);
  external dynamic/*=T*/ divideInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Divides two NDArrays element-wise, A / B. Inputs must
  /// be the same shape. For broadcasting support, use math.divide() instead.
  external dynamic/*=T*/ divideStrict/*<T extends NDArray>*/(
      dynamic/*=T*/ a, dynamic/*=T*/ b);

  /// Computes a scalar divided by an NDArray, broadcasted over the NDArray, c /
  /// A.
  external dynamic/*=T*/ scalarDividedByArray/*<T extends NDArray>*/(
      Scalar c, dynamic/*=T*/ a);

  /// Computes an NDArray divided by a scalar, broadcasted over the NDArray, A /
  /// c.
  external dynamic/*=T*/ arrayDividedByScalar/*<T extends NDArray>*/(
      dynamic/*=T*/ a, Scalar c);

  /// Computes exponential of the input NDArray element-wise. y = e ^ x
  external dynamic/*=T*/ exp/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ expInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes natural logarithm of the input NDArray element-wise. y = ln(x)
  external dynamic/*=T*/ log/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ logInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes rectified linear element-wise, max(x, 0).
  external dynamic/*=T*/ relu/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ reluInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes sigmoid element-wise, y = 1 / (1 + exp(-x)).
  external dynamic/*=T*/ sigmoid/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ sigmoidInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes hyperbolic tangent of the input NDArray element-wise.
  external dynamic/*=T*/ tanh/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ tanhInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes sin of the input NDArray element-wise, y = sin(x).
  external dynamic/*=T*/ sin/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ sinInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes step of the input NDArray element-wise, y = 1 if x > 0 | 0 if x <=
  /// 0
  external dynamic/*=T*/ step/*<T extends NDArray>*/(dynamic/*=T*/ ndarray);
  external dynamic/*=T*/ stepInternal/*<T extends NDArray>*/(
      dynamic/*=T*/ ndarray);

  /// Computes a scaled array add operation, c1 * A + c2 * B.
  external dynamic/*=T*/ scaledArrayAdd/*<T extends NDArray>*/(
      Scalar c1, dynamic/*=T*/ a, Scalar c2, dynamic/*=T*/ b);
  external dynamic/*=T*/ scaledArrayAddInternal/*<T extends NDArray>*/(
      Scalar c1, dynamic/*=T*/ a, Scalar c2, dynamic/*=T*/ b);

  /// Computes a scalar times array operation broadcasted over the NDArray, c *
  /// A.
  external dynamic/*=T*/ scalarTimesArray/*<T extends NDArray>*/(
      Scalar c, dynamic/*=T*/ a);

  /// Use math.multiply() instead.
  external Array2D elementWiseMulBroadcast(Array2D a, Array2D b);

  /// //////////////////
  /// Convolution ops //
  /// //////////////////
  /// Computes a 2D convolution over the input x.
  /// depth2].
  /// equally on all sides.
  external Array3D conv2d(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ biases, num stride, num zeroPad);
  external Array3D conv2dInternal(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ biases, num stride, num zeroPad);

  /// Computes the backprop of a 2D convolution.
  /// depth2].
  external dynamic /*{dx: Array3D, dw: Array4D, db: Array1D}*/ conv2dBackProp(
      Array3D x, Array3D dy, Array4D weights, num stride, num pad);
  external dynamic /*{dx: Array3D, dw: Array4D, db: Array1D}*/ conv2dBackPropInternal(
      Array3D x, Array3D dy, Array4D weights, num stride, num pad);

  /// Computes the transposed 2D convolution of an image, also known as a
  /// deconvolution.
  /// depth2].
  /// on all sides.
  external Array3D conv2dTranspose(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ biases, num stride, num pad);
  external Array3D conv2dTransposeInternal(Array3D x, Array4D weights,
      Array1D /*Array1D|Null*/ biases, num stride, num pad);

  /// Computes the 2D max pooling of an image.
  /// on all sides.
  external Array3D maxPool(Array3D x, num fSize, num stride, num pad);
  external Array3D maxPoolInternal(Array3D x, num fSize, num stride, num pad);

  /// Computes the backprop of a max pool.
  /// on all sides.
  external Array3D maxPoolBackprop(
      Array3D dy, Array3D x, num fSize, num stride, num pad);
  external Array3D maxPoolBackpropInternal(
      Array3D dy, Array3D x, num fSize, num stride, num pad);

  /// Computes the 2D min pooling of an image.
  /// on all sides.
  external Array3D minPool(Array3D x, num fSize, num stride, num pad);
  external Array3D minPoolInternal(Array3D x, num fSize, num stride, num pad);

  /// Computes the 2D average pooling of an image.
  /// on all sides.
  external Array3D avgPool(Array3D x, num fSize, num stride, num pad);
  external Array3D avgPoolInternal(Array3D x, num fSize, num stride, num pad);

  /// Bilinear resize a 3D array per each channel to a new 2D shape.
  /// resized individually.
  /// input by (new_height - 1) / (height - 1), which exactly aligns the 4
  /// corners of images and resized images. If false, rescale by new_height /
  /// height. Treat similarly the width dimension.
  external Array3D resizeBilinear3D(
      Array3D x, List<num> /*Tuple of <num,num>*/ newShape2D,
      [alignCorners]);
  external Array3D resizeBilinear3DInternal(Array3D x,
      List<num> /*Tuple of <num,num>*/ newShape2D, bool alignCorners);

  /// Batch normalization 3D. Mean, variance, scale, and offset can be of two
  /// shapes: 1) The same shape as the input: an Array3D. 2) In the common case,
  /// the depth dimension is the last dimension of x, so the values would be an
  /// Array1D of shape [depth].
  external Array3D batchNormalization3D(Array3D x,
      dynamic /*Array3D|Array1D*/ mean, dynamic /*Array3D|Array1D*/ variance,
      [varianceEpsilon,
      dynamic /*Array3D|Array1D*/ scale,
      dynamic /*Array3D|Array1D*/ offset]);
  external Array3D batchNormalization3DInternal(
      Array3D x,
      dynamic /*Array3D|Array1D*/ mean,
      dynamic /*Array3D|Array1D*/ variance,
      num varianceEpsilon,
      [dynamic /*Array3D|Array1D*/ scale,
      dynamic /*Array3D|Array1D*/ offset]);

  /// ///////////
  /// LSTM ops //
  /// ///////////
  /// Computes the next states and outputs of a stack of LSTMCells.
  /// Each cell output is used as input to the next cell.
  /// This is only the forward mode.
  /// Derived from tf.contrib.rn.MultiRNNCell.
  external List<
      List<
          Array2D>> /*Tuple of <List<Array2D>,List<Array2D>>*/ multiRNNCell(
      List<LSTMCell> lstmCells, Array2D data, List<Array2D> c, List<Array2D> h);

  /// Computes the next state and output of a BasicLSTMCell.
  /// This is only the forward mode.
  /// Derived from tf.contrib.rnn.BasicLSTMCell.
  external List<Array2D> /*Tuple of <Array2D,Array2D>*/ basicLSTMCell(
      Scalar forgetBias,
      Array2D lstmKernel,
      Array1D lstmBias,
      Array2D data,
      Array2D c,
      Array2D h);
}

@JS()
class MatrixOrientation {
  external static num get REGULAR;
  external static num get TRANSPOSED;
}
