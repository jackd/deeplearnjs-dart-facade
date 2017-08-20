@JS()
library tex_util;

import "package:js/js.dart";
import "dart:typed_data" show Float32List;

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
external List<num> /*Tuple of <num,num>*/ getUnpackedMatrixTextureShapeWidthHeight(
    num rows, num columns);
@JS()
external num getUnpackedArraySizeFromMatrixSize(
    num matrixSize, num channelsPerTexture);
@JS()
external List<num> /*Tuple of <num,num>*/ getColorMatrixTextureShapeWidthHeight(
    num rows, num columns);
@JS()
external num getMatrixSizeFromUnpackedArraySize(
    num unpackedSize, num channelsPerTexture);
@JS()
external encodeMatrixToUnpackedArray(
    Float32List matrix, Float32List unpackedArray, num channelsPerTexture);
@JS()
external decodeMatrixFromUnpackedArray(
    Float32List unpackedArray, Float32List matrix, num channelsPerTexture);
@JS()
external List<num> /*Tuple of <num,num>*/ getPackedMatrixTextureShapeWidthHeight(
    num rows, num columns);
@JS()
external num getPackedRGBAArraySizeFromMatrixShape(num rows, num columns);
@JS()
external encodeMatrixToPackedRGBA(
    Float32List matrix, num rows, num columns, Float32List packedRGBA);
@JS()
external Float32List decodeMatrixFromPackedRGBA(
    Float32List packedRGBA, num rows, num columns, Float32List matrix);
