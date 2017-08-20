@JS()
library gpgpu_util;

import "package:js/js.dart";
import "dart:web_gl"
    show ContextAttributes, Shader, RenderingContext, Buffer, Texture, Program;
import "dart:html" show CanvasElement, ImageData, ImageElement, VideoElement;
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
// @JS()
// external ContextAttributes getWebGLContextAttributes();
@JS()
external createWebGLContext([CanvasElement canvas]);
@JS()
external Shader createVertexShader(RenderingContext gl);
@JS()
external Buffer createVertexBuffer(RenderingContext gl);
@JS()
external Buffer createIndexBuffer(RenderingContext gl);
@JS()
external num getTextureInternalFormat(RenderingContext gl, num numChannels);
@JS()
external num getTextureFormat(RenderingContext gl, num numChannels);
@JS()
external Texture createAndConfigureTexture(
    RenderingContext gl, num width, num height, num numChannels);
@JS()
external Texture createMatrixTexture(
    RenderingContext gl, num rows, num columns);
@JS()
external Texture createColorMatrixTexture(
    RenderingContext gl, num rows, num columns);
@JS()
external Texture createPackedMatrixTexture(
    RenderingContext gl, num rows, num columns);
@JS()
external bindVertexProgramAttributeStreams(
    RenderingContext gl, Program program, Buffer vertexBuffer);
@JS()
external uploadPixelDataToTexture(RenderingContext gl, Texture texture,
    dynamic /*ImageData|ImageElement|CanvasElement|VideoElement*/ pixels);
@JS()
external uploadDataToTexture(RenderingContext gl, Texture texture, num width,
    num height, Float32List data, num numChannels);
@JS()
external uploadMatrixToTexture(RenderingContext gl, Texture texture, num rows,
    num columns, Float32List matrix, num numChannels);
@JS()
external uploadMatrixToPackedTexture(RenderingContext gl, Texture texture,
    num rows, num columns, Float32List matrix);
@JS()
external Float32List downloadMatrixFromOutputTexture(
    RenderingContext gl, num rows, num columns);
@JS()
external Float32List downloadMatrixFromPackedOutputTexture(
    RenderingContext gl, num rows, num columns);
