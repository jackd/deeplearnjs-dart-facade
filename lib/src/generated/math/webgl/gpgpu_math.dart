@JS()
library gpgpu_math;

import "package:js/js.dart";
import "dart:web_gl" show Program;
import "gpgpu_context.dart" show GPGPUContext;
import "shader_compiler.dart" show ShapeInfo;
import "../ndarray.dart" show NDArray;

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
@anonymous
@JS()
abstract class GPGPUProgram {
  external List<String> get variableNames;
  external set variableNames(List<String> v);
  external List<num> get outputShape;
  external set outputShape(List<num> v);
  external List<dynamic /*{}*/ > get params;
  external set params(List<dynamic /*{}*/ > v);
  external String get userCode;
  external set userCode(String v);
  external bool get supportsBroadcasting;
  external set supportsBroadcasting(bool v);
  external factory GPGPUProgram(
      {List<String> variableNames,
      List<num> outputShape,
      List<dynamic /*{}*/ > params,
      String userCode,
      bool supportsBroadcasting});
}

@anonymous
@JS()
abstract class GPGPUBinary {
  external Program get webGLProgram;
  external set webGLProgram(Program v);
  external GPGPUProgram get program;
  external set program(GPGPUProgram v);
  external GPGPUContext get gpgpu;
  external set gpgpu(GPGPUContext v);
  external String get source;
  external set source(String v);
  external List<ShapeInfo> get inShapeInfos;
  external set inShapeInfos(List<ShapeInfo> v);
  external ShapeInfo get outShapeInfo;
  external set outShapeInfo(ShapeInfo v);
  external factory GPGPUBinary(
      {Program webGLProgram,
      GPGPUProgram program,
      GPGPUContext gpgpu,
      String source,
      List<ShapeInfo> inShapeInfos,
      ShapeInfo outShapeInfo});
}

@JS()
external GPGPUBinary compileProgram/*<T extends NDArray, K extends NDArray>*/(
    GPGPUContext gpgpu,
    GPGPUProgram program,
    List<dynamic/*=T*/ > inputs,
    dynamic/*=K*/ output);
@JS()
external validateBinaryAndProgram(
    List<ShapeInfo> shapeInfos, List<NDArray> inputs);
@JS()
external void runProgram/*<T extends NDArray, K extends NDArray>*/(
    GPGPUBinary binary, List<dynamic/*=T*/ > inputs, dynamic/*=K*/ output);
@JS()
external String makeShaderKey(
    GPGPUProgram program, List<NDArray> inputs, NDArray output);
