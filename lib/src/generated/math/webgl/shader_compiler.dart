@JS()
library shader_compiler;

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
@anonymous
@JS()
abstract class ShapeInfo {
  external List<num> get logicalShape;
  external set logicalShape(List<num> v);
  external List<num> /*Tuple of <num,num>*/ get texShape;
  external set texShape(List<num> /*Tuple of <num,num>*/ v);
  external factory ShapeInfo(
      {List<num> logicalShape, List<num> /*Tuple of <num,num>*/ texShape});
}

@anonymous
@JS()
abstract class InputInfo {
  external String get name;
  external set name(String v);
  external ShapeInfo get shapeInfo;
  external set shapeInfo(ShapeInfo v);
  external factory InputInfo({String name, ShapeInfo shapeInfo});
}

@JS()
external String makeShader(List<InputInfo> inputsInfo, ShapeInfo outputShape,
    String userCode, bool broadcast);
@JS()
external getInputSamplingSnippet(
    InputInfo inInfo, ShapeInfo outShapeInfo, bool broadcast);
@JS()
external String getOutputSamplingSnippet(
    List<num> outShape, List<num> /*Tuple of <num,num>*/ outTexShape);
@JS()
external get SAMPLE_1D_SNIPPET;
@JS()
external get SAMPLE_2D_SNIPPET;
@JS()
external get SAMPLE_3D_SNIPPET;
@JS()
external get SAMPLE_4D_SNIPPET;
@JS()
external get SHADER_PREFIX;
@JS()
external String getOutput1DCoords(List<num> /*Tuple of <num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getOutput3DCoords(List<num> /*Tuple of <num,num,num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getOutput4DCoords(
    List<num> /*Tuple of <num,num,num,num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getOutput2DCoords(List<num> /*Tuple of <num,num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getSamplerScalar(String texName);
@JS()
external String getSampler1D(
    String texName, List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getSampler3D(
    String texName,
    List<num> /*Tuple of <num,num,num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getSampler4D(
    String texName,
    List<num> /*Tuple of <num,num,num,num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getSampler2D(
    String texName,
    List<num> /*Tuple of <num,num>*/ shape,
    List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external String getSamplerFlat(
    String texName, List<num> /*Tuple of <num,num>*/ texShape);
@JS()
external getSamplerAtOutputCoords(
    String texName,
    List<num> /*Tuple of <num,num>*/ inTexShape,
    List<num> /*Tuple of <num,num>*/ outTexShape,
    bool broadcast);
