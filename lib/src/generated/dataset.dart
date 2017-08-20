@JS('deeplearn')
library dataset;

import "package:js/js.dart";
import "dart:typed_data" show Float32List;
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
@JS()
external get STATS_SAMPLE_PERCENTAGE;

@anonymous
@JS()
abstract class DataStats {
  external num get exampleCount;
  external set exampleCount(num v);
  external num get inputMin;
  external set inputMin(num v);
  external num get inputMax;
  external set inputMax(num v);
  external List<num> get shape;
  external set shape(List<num> v);
  external factory DataStats(
      {num exampleCount, num inputMin, num inputMax, List<num> shape});
}

@anonymous
@JS()
abstract class NormalizationInfo {
  external bool get isNormalized;
  external set isNormalized(bool v);

  /// Bounds of the normalization if normalized.
  external num get lowerBound;
  external set lowerBound(num v);
  external num get upperBound;
  external set upperBound(num v);

  /// Minimum and maximum values for each dimension of the original data. These
  /// are the same size as an input example. These are computed lazily, only if
  /// normalization is requested. If the data is un-normalized, these are kept
  /// around so they don't have to be recomputed.
  external Float32List get minValues;
  external set minValues(Float32List v);
  external Float32List get maxValues;
  external set maxValues(Float32List v);
  external factory NormalizationInfo(
      {bool isNormalized,
      num lowerBound,
      num upperBound,
      Float32List minValues,
      Float32List maxValues});
}

@JS()
abstract class InMemoryDataset {
  // @Ignore
  InMemoryDataset.fakeConstructor$();
  external List<List<num>> get dataShapes;
  external set dataShapes(List<List<num>> v);
  external List<List<NDArray>> /*List<List<NDArray>>|Null*/ get dataset;
  external set dataset(List<List<NDArray>> /*List<List<NDArray>>|Null*/ v);

  /// Contains information necessary for reconstruction of the original data
  /// after normalization.
  external dynamic /*JSMap of <num,NormalizationInfo>*/ get normalizationInfo;
  external set normalizationInfo(
      dynamic /*JSMap of <num,NormalizationInfo>*/ v);
  external factory InMemoryDataset(List<List<num>> dataShapes);
  external List<num> getDataShape(num dataIndex);
  external Promise<Null> fetchData();
  external List<List<NDArray>> /*List<List<NDArray>>|Null*/ getData();
  external List<DataStats> getStats();

  /// Computes stats across a sampled portion of the data.
  external DataStats getStatsForData(List<NDArray> data);

  /// dimension or a fixed minimum value.
  /// dimension or a fixed maximum value.
  /// dimension, or a fixed minumum value to normalize the data to.
  /// dimension, or a fixed maximum value to normalize the data to.
  external List<NDArray> normalizeExamplesToRange(
      List<NDArray> examples,
      dynamic /*Float32List|num*/ curLowerBounds,
      dynamic /*Float32List|num*/ curUpperBounds,
      dynamic /*Float32List|num*/ newLowerBounds,
      dynamic /*Float32List|num*/ newUpperBounds);
  external computeBounds(num dataIndex);
  external normalizeWithinBounds(num dataIndex, num lowerBound, num upperBound);
  external bool isNormalized(num dataIndex);
  external removeNormalization(num dataIndex);
  external List<NDArray> unnormalizeExamples(
      List<NDArray> examples, num dataIndex);
  external dispose();
}
