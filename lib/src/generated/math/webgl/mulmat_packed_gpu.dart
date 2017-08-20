@JS()
library mulmat_packed_gpu;

import "package:js/js.dart";
import "gpgpu_context.dart" show GPGPUContext;
import "dart:web_gl" show Program, Texture;
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
external String getFragmentShaderSource(
    num sharedDimension,
    num /*enum MatrixOrientation*/ aOrientation,
    num /*enum MatrixOrientation*/ bOrientation);
@JS()
external multiplyMatrixPacked(
    GPGPUContext gpgpu,
    Program multiplyProgram,
    Texture a,
    Texture b,
    Texture result,
    List<num> /*Tuple of <num,num>*/ resultShapeRowCol);
@JS()
external Float32List uploadMultiplyMatrixPackedDownload(
    Float32List a,
    List<num> /*Tuple of <num,num>*/ aShapeRowCol,
    Float32List b,
    List<num> /*Tuple of <num,num>*/ bShapeRowCol,
    [aOrientation,
    bOrientation]);
