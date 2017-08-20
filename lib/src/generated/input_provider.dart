@JS('deeplearn')
library input_provider;

import "package:js/js.dart";
import "math/ndarray.dart" show NDArray;
import "math/math.dart" show NDArrayMath;
import "dart:typed_data" show Uint32List;

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

/// The interface for input providers.
@anonymous
@JS()
abstract class InputProvider {
  /// Get the next input as a copy. This is important because the data might
  /// get uploaded to the GPU and modify the original data.
  external NDArray getNextCopy(NDArrayMath math);

  /// Dispose the input copy.
  external void disposeCopy(NDArrayMath math, NDArray copy);
}

/// A common interface for shuffled input provider builders. This returns
/// InputProviders that are synchronized.
/// @hidden
@anonymous
@JS()
abstract class ShuffledInputProviderBuilder {
  external List<InputProvider> getInputProviders();
}

/// @hidden
@JS()
abstract class InMemoryShuffledInputProviderBuilder
    implements ShuffledInputProviderBuilder {
  // @Ignore
  InMemoryShuffledInputProviderBuilder.fakeConstructor$();
  external List<List<NDArray>> get inputs;
  external set inputs(List<List<NDArray>> v);
  external Uint32List get shuffledIndices;
  external set shuffledIndices(Uint32List v);
  external num get numInputs;
  external set numInputs(num v);
  external get idx;
  external set idx(v);

  /// Counter for how many times the current index has been called. Resets to 0
  /// when it reaches the number of inputs.
  external get inputCounter;
  external set inputCounter(v);
  external get epoch;
  external set epoch(v);

  /// Constructs an `InMemoryShuffledInputProvider`. All of the inputs must be
  /// in memory.
  /// examples].
  external factory InMemoryShuffledInputProviderBuilder(
      List<List<NDArray>> inputs);
  external num getCurrentExampleIndex();
  external NDArray getNextInput(num inputId);
  external getEpoch();

  /// Returns input providers which shuffle the inputs and stay in sync.
  external List<InputProvider> getInputProviders();
  external InputProvider getInputProvider(num inputId);
}

/// An in CPU memory ShuffledInputProviderBuilder that shuffles NDArrays on the
/// CPU and keeps them mutually in sync.
@JS()
class InCPUMemoryShuffledInputProviderBuilder
    extends InMemoryShuffledInputProviderBuilder {
  // @Ignore
  InCPUMemoryShuffledInputProviderBuilder.fakeConstructor$()
      : super.fakeConstructor$();
  external getInputProvider(num inputId);

  external factory InCPUMemoryShuffledInputProviderBuilder(
      List<List<NDArray>> inputs);
}

/// An in GPU memory ShuffledInputProviderBuilder that shuffles NDArrays on the
/// GPU and keeps them mutually in sync. This is more performant than the CPU
/// version as textures will stay in memory, however this is more GPU memory
/// intensive as it keeps textures resident in GPU memory.
@JS()
class InGPUMemoryShuffledInputProviderBuilder
    extends InMemoryShuffledInputProviderBuilder {
  // @Ignore
  InGPUMemoryShuffledInputProviderBuilder.fakeConstructor$()
      : super.fakeConstructor$();
  external getInputProvider(num inputId);
}
