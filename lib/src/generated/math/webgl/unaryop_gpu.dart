@JS()
library unaryop_gpu;

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
class UnaryOp {
  external static num get EXP;
  external static num get LOG;
  external static num get NEG;
  external static num get RELU;
  external static num get SIGMOID;
  external static num get STEP;
  external static num get SIN;
  external static num get TANH;
}

@JS()
class UnaryOpProgram implements GPGPUProgram {
  // @Ignore
  UnaryOpProgram.fakeConstructor$();
  external get variableNames;
  external set variableNames(v);
  external List<dynamic /*{}*/ > get params;
  external set params(List<dynamic /*{}*/ > v);
  external String get userCode;
  external set userCode(String v);
  external List<num> get outputShape;
  external set outputShape(List<num> v);
  external factory UnaryOpProgram(List<num> aShape, num /*enum UnaryOp*/ op);
}

@JS()
external getOpSnippet(num /*enum UnaryOp*/ op);
