@JS()
library conv_backprop_gpu;

import "package:js/js.dart";
import "gpgpu_math.dart" show GPGPUProgram;

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
class Conv2DDerWeightsProgram implements GPGPUProgram {
  // @Ignore
  Conv2DDerWeightsProgram.fakeConstructor$();
  external get variableNames;
  external set variableNames(v);
  external List<dynamic /*{}*/ > get params;
  external set params(List<dynamic /*{}*/ > v);
  external List<num> get outputShape;
  external set outputShape(List<num> v);
  external String get userCode;
  external set userCode(String v);
  external factory Conv2DDerWeightsProgram(
      List<num> /*Tuple of <num,num,num>*/ xShape,
      num fSize,
      num outputDepth,
      num stride,
      num zeroPad);
}

@JS()
class Conv2DTransposeProgram implements GPGPUProgram {
  // @Ignore
  Conv2DTransposeProgram.fakeConstructor$();
  external get variableNames;
  external set variableNames(v);
  external List<dynamic /*{}*/ > get params;
  external set params(List<dynamic /*{}*/ > v);
  external List<num> get outputShape;
  external set outputShape(List<num> v);
  external String get userCode;
  external set userCode(String v);
  external factory Conv2DTransposeProgram(
      List<num> /*Tuple of <num,num,num>*/ xShape,
      num fSize,
      num origInputDepth,
      num origStride,
      num origPad,
      bool hasBias);
}

@JS()
class Conv2DDerBiasProgram implements GPGPUProgram {
  // @Ignore
  Conv2DDerBiasProgram.fakeConstructor$();
  external get variableNames;
  external set variableNames(v);
  external List<dynamic /*{}*/ > get params;
  external set params(List<dynamic /*{}*/ > v);
  external List<num> get outputShape;
  external set outputShape(List<num> v);
  external String get userCode;
  external set userCode(String v);
  external factory Conv2DDerBiasProgram(
      List<num> /*Tuple of <num,num,num>*/ yShape);
}
