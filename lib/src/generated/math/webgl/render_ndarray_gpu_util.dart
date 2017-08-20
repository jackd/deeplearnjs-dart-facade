@JS()
library render_ndarray_gpu_util;

import "package:js/js.dart";
import "dart:web_gl" show Program, Texture;
import "gpgpu_context.dart" show GPGPUContext;

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
external Program getRenderRGBShader(GPGPUContext gpgpu, num destinationWidth);
@JS()
external renderToCanvas(
    GPGPUContext gpgpu, Program renderShader, Texture sourceTex);
@JS()
external renderToFramebuffer(
    GPGPUContext gpgpu, Program renderShader, Texture sourceTex);
