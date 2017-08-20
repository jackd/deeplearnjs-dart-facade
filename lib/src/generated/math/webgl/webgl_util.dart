@JS()
library webgl_util;

import "package:js/js.dart";
import "dart:web_gl"
    show
        RenderingContext,
        Shader,
        Program,
        Buffer,
        Texture,
        Framebuffer,
        UniformLocation;
import "dart:html" show CanvasElement;
import "dart:typed_data" show Float32List, Uint16List;

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
external get USE_WEBGL2_WHEN_AVAILABLE;
@JS()
external set USE_WEBGL2_WHEN_AVAILABLE(v);
@JS()
external dynamic /*bool|dynamic*/ get WEBGL2_ENABLED;
@JS()
external set WEBGL2_ENABLED(dynamic /*bool|dynamic*/ v);
@JS()
external num get MAX_TEXTURE_SIZE;
@JS()
external set MAX_TEXTURE_SIZE(num v);

@anonymous
@JS()
abstract class WebGLContextAttributes {
  external bool get alpha;
  external set alpha(bool v);
  external bool get antialias;
  external set antialias(bool v);
  external bool get premultipliedAlpha;
  external set premultipliedAlpha(bool v);
  external bool get preserveDrawingBuffer;
  external set preserveDrawingBuffer(bool v);
  external bool get depth;
  external set depth(bool v);
  external bool get stencil;
  external set stencil(bool v);
  external bool get failIfMajorPerformanceCaveat;
  external set failIfMajorPerformanceCaveat(bool v);
  external factory WebGLContextAttributes(
      {bool alpha,
      bool antialias,
      bool premultipliedAlpha,
      bool preserveDrawingBuffer,
      bool depth,
      bool stencil,
      bool failIfMajorPerformanceCaveat});
}

@anonymous
@JS()
abstract class WebGLLoseContextExtension {
  external void loseContext();
}

@JS()
external RenderingContext createWebGLRenderingContext(
    WebGLContextAttributes attributes);

/// Force the library to prefer WebGL 1.0 instead of WebGL 2.0 even when WebGL
/// 2.0 is available.
@JS()
external preferWebGL1();

/// Prefer WebGL 2.0 to WebGL 1.0. This is the default configuration.
@JS()
external preferWebGL2();
@JS()
external isWebGL2Enabled();
@JS()
external RenderingContext createWebGLRenderingContextFromCanvas(
    CanvasElement canvas, WebGLContextAttributes attributes);
@JS()
external dynamic/*=T*/ callAndCheck/*<T>*/(
    RenderingContext gl, dynamic/*=T*/ func());
@JS()
external get webGLDebugErrorCheckingEnabled;
@JS()
external set webGLDebugErrorCheckingEnabled(v);
@JS()
external enableDebugWebGLErrorChecking(bool enabled);
@JS()
external checkWebGLError(RenderingContext gl);
@JS()
external String getWebGLErrorMessage(RenderingContext gl, num status);
@JS()
external dynamic /*{}*/ getExtensionOrThrow(
    RenderingContext gl, String extensionName);
@JS()
external Shader createVertexShader(
    RenderingContext gl, String vertexShaderSource);
@JS()
external Shader createFragmentShader(
    RenderingContext gl, String fragmentShaderSource);
@JS()
external Program createProgram(RenderingContext gl);
@JS()
external linkProgram(RenderingContext gl, Program program);
@JS()
external validateProgram(RenderingContext gl, Program program);
@JS()
external Buffer createStaticVertexBuffer(RenderingContext gl, Float32List data);
@JS()
external Buffer createStaticIndexBuffer(RenderingContext gl, Uint16List data);
@JS()
external num queryMaxTextureSize(RenderingContext gl);
@JS()
external num getChannelsPerTexture();
@JS()
external Texture createTexture(RenderingContext gl);
@JS()
external validateTextureSize(RenderingContext gl, num width, num height);
@JS()
external Framebuffer createFramebuffer(RenderingContext gl);
@JS()
external bindVertexBufferToProgramAttribute(
    RenderingContext gl,
    Program program,
    String attribute,
    Buffer buffer,
    num arrayEntriesPerItem,
    num itemStrideInBytes,
    num itemOffsetInBytes);
@JS()
external bindTextureUnit(RenderingContext gl, Texture texture, num textureUnit);
@JS()
external unbindTextureUnit(RenderingContext gl, num textureUnit);
@JS()
external UniformLocation getProgramUniformLocationOrThrow(
    RenderingContext gl, Program program, String uniformName);
@JS()
external bindTextureToProgramUniformSampler(
    RenderingContext gl,
    Program program,
    Texture texture,
    String uniformSamplerName,
    num textureUnit);
@JS()
external bindCanvasToFramebuffer(RenderingContext gl);
@JS()
external bindColorTextureToFramebuffer(
    RenderingContext gl, Texture texture, Framebuffer framebuffer);
@JS()
external unbindColorTextureFromFramebuffer(
    RenderingContext gl, Framebuffer framebuffer);
@JS()
external validateFramebuffer(RenderingContext gl);
@JS()
external String getFramebufferErrorMessage(RenderingContext gl, num status);
@JS()
external dynamic/*=T*/ throwIfNull/*<T>*/(RenderingContext gl,
    dynamic /*T|Null*/ returnTOrNull(), String failureMessage);
@JS()
external validateTextureUnit(RenderingContext gl, num textureUnit);
@JS()
external List<num> /*Tuple of <num,num>*/ getTextureShapeFromLogicalShape(
    RenderingContext gl, List<num> logShape,
    [List<num> /*Tuple of <num,num>*/ preferredTexShape]);
