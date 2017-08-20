@JS('deeplearn')
library util;

import "package:js/js.dart";
import "dart:typed_data"
    show Uint32List, Int32List, Float32List, Float64List, Int8List, Int16List;

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
/*export type Vector = number[] | Float64Array | Float32Array | Int32Array |
    Int8Array | Int16Array;*/

/// Shuffles the array using Fisher-Yates algorithm.
/// tslint:disable-next-line:no-any
@JS()
external void shuffle(
    dynamic /*List<dynamic>|Uint32List|Int32List|Float32List*/ array);

/// Clamps a value to a specified range.
@JS()
external num clamp(num min, num x, num max);

/// Returns a sample from a uniform [a, b] distribution.
@JS()
external randUniform(num a, num b);

/// Samples from a gaussian distribution.
@JS()
external num randGauss([mean, stdDev, truncated]);

/// Returns squared eucledian distance between two vectors.
@JS()
external num distSquared(
    dynamic /*List<num>|Float64List|Float32List|Int32List|Int8List|Int16List*/ a,
    dynamic /*List<num>|Float64List|Float32List|Int32List|Int8List|Int16List*/ b);
@JS()
external JS$assert(bool expr, String msg);
@JS()
external void assertShapesMatch(List<num> shapeA, List<num> shapeB,
    [errorMessagePrefix]);

/// tslint:disable-next-line:no-any
@JS()
external List<num> flatten(List<dynamic> arr,
    [List<
        num> ret]); /*export type ArrayData = number|number[]|number[][]|number[][][]|number[][][][];*/
@JS()
external List<num> inferShape(
    dynamic /*num|List<num>|List<List<num>>|List<List<List<num>>>|List<List<List<List<num>>>>*/ arr);
@JS()
external num sizeFromShape(List<num> shape);
@JS()
external bool isScalarShape(List<num> shape);

/// tslint:disable-next-line:no-any
@JS()
external arraysEqual(dynamic /*List<dynamic>|Float32List*/ n1,
    dynamic /*List<dynamic>|Float32List*/ n2);
@JS()
external bool isInt(num a);
@JS()
external num tanh(num x);
@JS()
external List<num> /*Tuple of <num,num>*/ sizeToSquarishShape(num size);
@JS()
external Uint32List createShuffledIndices(num n);
@JS()
external List<num> assertAndGetBroadcastedShape(
    List<num> shapeA, List<num> shapeB);
