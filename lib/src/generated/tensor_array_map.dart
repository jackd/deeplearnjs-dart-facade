@JS('deeplearn')
library tensor_array_map;

import "package:js/js.dart";
import "graph.dart" show Tensor;
import "math/ndarray.dart" show NDArray;

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

/// TensorArrayMap is an internal map from Tensor IDs to NDArrays. Since NDArrays
/// can be backed by WebGL textures, the TensorArrayMap is only used inside of a
/// Session.
@JS()
class TensorArrayMap {
  // @Ignore
  TensorArrayMap.fakeConstructor$();

  /// Add or replace an entry in the map.
  external JS$set(Tensor tensor, NDArray /*NDArray|Null*/ array);

  /// Returns the NDArray associated with the provided tensor. Will throw an
  /// exception if the tensor is not a key in the map, or if the associated
  /// NDArray is null.
  external NDArray JS$get(Tensor tensor, [skipChecks]);

  /// Removes a tensor/NDArray pair from the map.
  external delete(Tensor tensor);
  external disposeArray(Tensor tensor);
  external num size();

  /// Iterate over all contained NDArray values and dispose them.
  external dispose();

  /// Tests to see if a tensor has a null associated with it. Throws
  /// if the tensor is not a key in the map.
  external bool hasNullArray(Tensor tensor);
  external dynamic /*JSMap of <num,NDArray|Null>*/ get dict;
  external set dict(dynamic /*JSMap of <num,NDArray|Null>*/ v);
}
