@JS()
library gpgpu_context;

import "package:js/js.dart";
import "dart:web_gl"
    show
        RenderingContext,
        Buffer,
        Framebuffer,
        Texture,
        Program,
        UniformLocation;
import "webgl_util.dart" show WebGLLoseContextExtension;
import "dart:html" show ImageData, ImageElement, CanvasElement, VideoElement;
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
class GPGPUContext {
  // @Ignore
  GPGPUContext.fakeConstructor$();
  external RenderingContext get gl;
  external set gl(RenderingContext v);
  external dynamic /*{}*/ get textureFloatExtension;
  external set textureFloatExtension(dynamic /*{}*/ v);
  external dynamic /*{}*/ get colorBufferFloatExtension;
  external set colorBufferFloatExtension(dynamic /*{}*/ v);
  external WebGLLoseContextExtension get loseContextExtension;
  external set loseContextExtension(WebGLLoseContextExtension v);
  external Buffer get vertexBuffer;
  external set vertexBuffer(Buffer v);
  external Buffer get indexBuffer;
  external set indexBuffer(Buffer v);
  external Framebuffer get framebuffer;
  external set framebuffer(Framebuffer v);
  external Texture /*Texture|Null*/ get outputTexture;
  external set outputTexture(Texture /*Texture|Null*/ v);
  external Program /*Program|Null*/ get program;
  external set program(Program /*Program|Null*/ v);
  external get disposed;
  external set disposed(v);
  external get autoDebugValidate;
  external set autoDebugValidate(v);
  external factory GPGPUContext([RenderingContext gl]);
  external dispose();
  external enableAutomaticDebugValidation(bool enabled);
  external Texture createMatrixTexture(num rows, num columns);
  external uploadPixelDataToTexture(Texture texture,
      dynamic /*ImageData|ImageElement|CanvasElement|VideoElement*/ pixels);
  external Texture createPackedMatrixTexture(num rows, num columns);
  external deleteMatrixTexture(Texture texture);
  external uploadMatrixToTexture(
      Texture texture, num rows, num columns, Float32List matrix);
  external uploadMatrixToPackedTexture(
      Texture texture, num rows, num columns, Float32List matrix);
  external Float32List downloadMatrixFromTexture(
      Texture texture, num rows, num columns);
  external Float32List downloadMatrixFromPackedTexture(
      Texture texture, num rows, num columns);
  external Program createProgram(String fragmentShaderSource);
  external deleteProgram(Program program);
  external setProgram(Program /*Program|Null*/ program);
  external UniformLocation getUniformLocation(String uniformName);
  external setInputMatrixTexture(
      Texture inputMatrixTexture, String uniformName, num textureUnit);
  external setOutputMatrixTexture(
      Texture outputMatrixTexture, num rows, num columns);
  external setOutputPackedMatrixTexture(
      Texture outputPackedMatrixTexture, num rows, num columns);
  external setOutputMatrixWriteRegion(
      num startRow, num numRows, num startColumn, num numColumns);
  external setOutputPackedMatrixWriteRegion(
      num startRow, num numRows, num startColumn, num numColumns);
  external debugValidate();
  external executeProgram();
  external blockUntilAllProgramsCompleted();
  external Float32List downloadMatrixDriver(
      Texture texture, Float32List downloadAndDecode());
  external setOutputMatrixTextureDriver(
      Texture outputMatrixTextureMaybePacked, num width, num height);
  external setOutputMatrixWriteRegionDriver(
      num x, num y, num width, num height);
  external throwIfDisposed();
  external throwIfNoProgram();
}
