@JS('deeplearn')
library checkpoint_loader;

import "package:js/js.dart";
import "math/ndarray.dart" show NDArray;
import 'promise.dart';

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

/// @hidden
@anonymous
@JS()
abstract class CheckpointVariable {
  external String get filename;
  external set filename(String v);
  external List<num> get shape;
  external set shape(List<num> v);
  external factory CheckpointVariable({String filename, List<num> shape});
}

/// @hidden
@anonymous
@JS()
abstract class CheckpointManifest {
  /* Index signature is not yet supported by JavaScript interop. */
}

@JS()
external get MANIFEST_FILE;

@JS()
class CheckpointLoader {
  // @Ignore
  CheckpointLoader.fakeConstructor$();
  external String get urlPath;
  external set urlPath(String v);
  external CheckpointManifest get checkpointManifest;
  external set checkpointManifest(CheckpointManifest v);
  external dynamic /*JSMap of <String,NDArray>*/ get variables;
  external set variables(dynamic /*JSMap of <String,NDArray>*/ v);
  external factory CheckpointLoader(String urlPath);
  external Promise<Null> loadManifest();
  external Promise<CheckpointManifest> getCheckpointManifest();
  external Promise<dynamic /*JSMap of <String,NDArray>*/ > getAllVariables();
  external Promise<NDArray> getVariable(String varName);
}
