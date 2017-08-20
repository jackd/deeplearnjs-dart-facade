@JS('deeplearn')
library conv_util;

import "package:js/js.dart";

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
external List<num> /*Tuple of <num,num,num>*/ computeOutputShape3D(
    List<num> /*Tuple of <num,num,num>*/ inputShapeRowColDepth,
    num fieldSize,
    num depth,
    num stride,
    [num zeroPad]);
@JS()
external num computeDefaultPad(
    List<num> /*Tuple of <num,num,num>*/ inputShape, num fieldSize, num stride);
@JS()
external List<num> /*Tuple of <num,num>*/ computeTexShapeFrom3D(
    List<num> /*Tuple of <num,num,num>*/ shapeRowColDepth);
@JS()
external List<num> /*Tuple of <num,num,num,num>*/ computeWeightsShape4D(
    num inputDepth, num outputDepth, num fSize);
@JS()
external List<num> /*Tuple of <num,num>*/ computeDilatedRC(
    List<num> /*Tuple of <num,num>*/ rc, num origStride);
