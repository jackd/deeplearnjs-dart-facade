@JS()
library binaryop_gpu;

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
class BinaryOpProgram implements GPGPUProgram {
  // @Ignore
  BinaryOpProgram.fakeConstructor$();
  external get variableNames;
  external set variableNames(v);
  external List<dynamic /*{}*/ > get params;
  external set params(List<dynamic /*{}*/ > v);
  external List<num> get outputShape;
  external set outputShape(List<num> v);
  external String get userCode;
  external set userCode(String v);
  external get supportsBroadcasting;
  external set supportsBroadcasting(v);
  external factory BinaryOpProgram(
      String /*'+'|'-'|'*'|'/'*/ op, List<num> aShape, List<num> bShape);
}
