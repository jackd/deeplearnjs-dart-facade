@JS()
library batchnorm_gpu;

import "package:js/js.dart";
import "gpgpu_context.dart" show GPGPUContext;
import "dart:web_gl" show Program, Texture;

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
    List<num> /*Tuple of <num,num>*/ xTexShapeRC,
    List<num> /*Tuple of <num,num>*/ meanTexShapeRC,
    List<num> /*Tuple of <num,num>*/ varianceTexShapeRC,
    List<num> /*Tuple of <num,num>|Null*/ offsetTexShapeRC,
    [List<num> /*Tuple of <num,num>|Null*/ scaleTexShapeRC,
    varianceEpsilon]);
@JS()
external batchNormalization(
    GPGPUContext gpgpu,
    Program program,
    Texture x,
    List<num> /*Tuple of <num,num>*/ xShapeRowCol,
    Texture mean,
    List<num> /*Tuple of <num,num>*/ meanShapeRowCol,
    Texture variance,
    List<num> /*Tuple of <num,num>*/ varianceShapeRowCol,
    Texture /*Texture|Null*/ offset,
    List<num> /*Tuple of <num,num>|Null*/ offsetShapeRowCol,
    Texture /*Texture|Null*/ scale,
    List<num> /*Tuple of <num,num>|Null*/ scaleShapeRowCol,
    Texture result,
    List<num> /*Tuple of <num,num>*/ resultShapeRowCol);
