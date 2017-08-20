@JS()
library texture_manager;

import "package:js/js.dart";
import "gpgpu_context.dart" show GPGPUContext;
import "dart:web_gl" show Texture;

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
class TextureManager {
  // @Ignore
  TextureManager.fakeConstructor$();
  external GPGPUContext get gpgpu;
  external set gpgpu(GPGPUContext v);
  external get numUsedTextures;
  external set numUsedTextures(v);
  external get numFreeTextures;
  external set numFreeTextures(v);
  external dynamic /*JSMap of <String,List<Texture>>*/ get freeTextures;
  external set freeTextures(dynamic /*JSMap of <String,List<Texture>>*/ v);
  external get logEnabled;
  external set logEnabled(v);
  external dynamic /*JSMap of <String,num>*/ get usedTextureCount;
  external set usedTextureCount(dynamic /*JSMap of <String,num>*/ v);
  external factory TextureManager(GPGPUContext gpgpu);
  external Texture acquireTexture(List<num> /*Tuple of <num,num>*/ shapeRC);
  external void releaseTexture(
      Texture texture, List<num> /*Tuple of <num,num>*/ shape);
  external log();
  external num getNumUsedTextures();
  external num getNumFreeTextures();
  external dispose();
}

@JS()
external String getKeyFromTextureShape(
    List<num> /*Tuple of <num,num>*/ shapeRowsCol);
