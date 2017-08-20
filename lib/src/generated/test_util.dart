@JS('deeplearn')
library test_util;

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
external expectArraysClose(
    Float32List actual, Float32List expected, num epsilon);
@JS()
external Float32List randomArrayInRange(num n, num minValue, num maxValue);
@JS()
external Float32List makeIdentity(num n);
@JS()
external setValue(
    Float32List m, num mNumRows, num mNumCols, num v, num row, num column);
@JS()
external cpuMultiplyMatrix(
    Float32List a, num aRow, num aCol, Float32List b, num bRow, num bCol);
@JS()
external num cpuDotProduct(Float32List a, Float32List b);
