@JS()
library graph_runner_test;

import "package:js/js.dart";
import "math/math.dart" show NDArrayMath;
import "session.dart" show FeedEntry;
import "optimizer.dart" show Optimizer;

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
/// tslint:disable-next-line:max-line-length
@JS()
external get FAKE_LEARNING_RATE;
@JS()
external get FAKE_BATCH_SIZE;
@JS()
external fakeTrainBatch(
    NDArrayMath math,
    List<FeedEntry> feedEntries,
    num batchSize,
    Optimizer optimizer,
    num /*enum CostReduction*/ costReduction);
