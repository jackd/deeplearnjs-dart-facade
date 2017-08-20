@JS('deeplearn')
library graph_layers;

import "package:js/js.dart";
import "graph.dart" show Graph, Tensor;
import "package:func/func.dart";
import "initializers.dart" show Initializer;

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

/// A layers sugar class around the graph that initializes variables
/// automatically for layers.
@JS()
class GraphLayers {
  // @Ignore
  GraphLayers.fakeConstructor$();
  external Graph get g;
  external set g(Graph v);
  external factory GraphLayers(Graph g);
  external dense(String name, Tensor x, num units,
      [Func1<Tensor, Tensor> /*Func1<Tensor, Tensor>|Null*/ activation,
      useBias,
      Initializer kernelInitializer,
      Initializer biasInitializer]);
}
