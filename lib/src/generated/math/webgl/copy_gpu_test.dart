@JS()
library copy_gpu_test;

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
external Float32List uploadCopyDownload(
    Float32List source,
    List<num> /*Tuple of <num,num>*/ sourceShapeRowCol,
    List<num> /*Tuple of <num,num>*/ sourceStartRowCol,
    List<num> /*Tuple of <num,num>*/ sourceSizeRowCol,
    List<num> /*Tuple of <num,num>*/ destStartRowCol,
    List<num> /*Tuple of <num,num>*/ destSizeRowCol,
    Float32List dest,
    List<num> /*Tuple of <num,num>*/ destShapeRowCol);
