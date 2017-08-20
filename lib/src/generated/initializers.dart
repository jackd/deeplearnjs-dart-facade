@JS('deeplearn')
library initializers;

import "package:js/js.dart";
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

/// Initializer interface, all initializer implement this interface.
@anonymous
@JS()
abstract class Initializer {
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class VarianceScalingInitializer implements Initializer {
  // @Ignore
  VarianceScalingInitializer.fakeConstructor$();
  external get scale;
  external set scale(v);
  external String /*'fan_in'|'fan_out'|'fan_avg'*/ get mode;
  external set mode(String /*'fan_in'|'fan_out'|'fan_avg'*/ v);
  external String /*'uniform'|'normal'*/ get distribution;
  external set distribution(String /*'uniform'|'normal'*/ v);
  external factory VarianceScalingInitializer(
      [scale,
      String /*'fan_in'|'fan_out'|'fan_avg'*/ mode,
      String /*'uniform'|'normal'*/ distribution]);
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class ZerosInitializer implements Initializer {
  // @Ignore
  ZerosInitializer.fakeConstructor$();
  external factory ZerosInitializer();
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class OnesInitializer implements Initializer {
  // @Ignore
  OnesInitializer.fakeConstructor$();
  external factory OnesInitializer();
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class ConstantInitializer implements Initializer {
  // @Ignore
  ConstantInitializer.fakeConstructor$();
  external get value;
  external set value(v);
  external factory ConstantInitializer([value]);
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class NDArrayInitializer implements Initializer {
  // @Ignore
  NDArrayInitializer.fakeConstructor$();
  external NDArray get ndarray;
  external set ndarray(NDArray v);
  external factory NDArrayInitializer(NDArray ndarray);
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class RandomNormalInitializer implements Initializer {
  // @Ignore
  RandomNormalInitializer.fakeConstructor$();
  external get mean;
  external set mean(v);
  external get stdev;
  external set stdev(v);
  external factory RandomNormalInitializer([mean, stdev]);
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class RandomTruncatedNormalInitializer implements Initializer {
  // @Ignore
  RandomTruncatedNormalInitializer.fakeConstructor$();
  external get mean;
  external set mean(v);
  external get stdev;
  external set stdev(v);
  external factory RandomTruncatedNormalInitializer([mean, stdev]);
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}

@JS()
class RandomUniformInitializer implements Initializer {
  // @Ignore
  RandomUniformInitializer.fakeConstructor$();
  external get minval;
  external set minval(v);
  external get maxval;
  external set maxval(v);
  external factory RandomUniformInitializer([minval, maxval]);
  external NDArray initialize(
      List<num> weightsShape, num inputUnits, num outputUnits);
}
