@JS('deeplearn')
library graph;

import "package:js/js.dart";
import "graph_layers.dart" show GraphLayers;
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

/// Graph is the primary container structure for deeplearn.js operations. Graph
/// holds the topology of operation nodes and the connectivity between them.
@JS()
class Graph {
  // @Ignore
  Graph.fakeConstructor$();
  external GraphLayers get layers;
  external set layers(GraphLayers v);
  external factory Graph();

  /// Creates a named variable. Variables are tensors that maintain state across
  /// session calls and whose values are adjusted during backpropagation
  /// training.
  external Tensor variable(String name, NDArray data);

  /// Inserts a placeholder for a tensor that will be always fed. Placeholders
  /// are input tensors whose values are provided by the client via feed
  /// dictionaries. Placeholders are not updated as part of training; they are
  /// only used as immutable input.
  external Tensor placeholder(String name, List<num> shape);

  /// Constant value that persists across session calls.
  external Tensor constant(
      dynamic /*NDArray|num|List<num>|List<List<num>>|List<List<List<num>>>|List<List<List<List<num>>>>*/ value);

  /// Reshape the input tensor.
  external Tensor reshape(Tensor x, List<num> shape);

  /// Computes a fused linear combination of two tensors.
  external Tensor fusedLinearCombination(
      Tensor x1, Tensor x2, Tensor c1, Tensor c2);

  /// Adds two tensors (elementwise). Broadcasts if one of the tensors is scalar.
  external Tensor add(Tensor x1, Tensor x2);

  /// Subtracts two tensors (elementwise). Broadcasts if one of the tensors is
  /// scalar.
  external Tensor subtract(Tensor x1, Tensor x2);

  /// Multiply two tensors (elementwise). Broadcasts if one of the tensors is
  /// scalar.
  external Tensor multiply(Tensor x1, Tensor x2);

  /// Divide two tensors (elementwise). Broadcasts if one of the tensors is
  /// scalar.
  external Tensor divide(Tensor x1, Tensor x2);

  /// Computes the sum of elements in the tensor.
  external Tensor reduceSum(Tensor x);

  /// Concats two 3D tensors along a given axis.
  external Tensor concat3d(Tensor x1, Tensor x2, num axis);

  /// Computes the dot product between two matrices.
  external Tensor matmul(Tensor x1, Tensor x2);

  /// Computes a 2D convolution.
  external Tensor conv2d(
      Tensor x, Tensor w, Tensor b, num fieldSize, num outputDepth,
      [stride, num zeroPad]);

  /// Computes a 2D max pool of x.
  external Tensor maxPool(Tensor x, num fieldSize, [stride, num zeroPad]);

  /// Computes exponential of x element-wise.
  external Tensor exp(Tensor x);

  /// Computes log of x element-wise.
  external Tensor log(Tensor x);

  /// Computes ReLU of x element-wise.
  external Tensor relu(Tensor x);

  /// Computes TanH of x element-wise.
  external Tensor tanh(Tensor x);

  /// Computes Sigmoid of x element-wise.
  external Tensor sigmoid(Tensor x);

  /// Computes square of x element-wise.
  external Tensor square(Tensor x);

  /// Computes softmax probabilities from logits.
  external Tensor softmax(Tensor x);

  /// Creates a softmax cross-entropy cost operation in the graph.
  external Tensor softmaxCrossEntropyCost(Tensor x, Tensor target);

  /// Creates a mean-squared cost operation in the graph.
  external meanSquaredCost(Tensor label, Tensor prediction);

  /// Returns the flattened index of the maximum entry in the tensor.
  external Tensor argmax(Tensor x);

  /// Creates an argmax equals operation in the graph.
  external Tensor argmaxEquals(Tensor x1, Tensor x2);
  external Tensor addNodeAndReturnOutput(Node node);
  external List<Node> getNodes();
  external List<Node> get nodes;
  external set nodes(List<Node> v);
}

/// Tensor represents the output of an operation node in the graph.
/// Tensors have no data associated with them, but maintain a shape array
/// to determine operation compatibility. All graph methods that create graph
/// operations return Tensor objects, which can be thought of as 'handles' to
/// operations.
@JS()
class Tensor {
  // @Ignore
  Tensor.fakeConstructor$();
  external List<num> get shape;
  external set shape(List<num> v);
  external Node get node;
  external set node(Node v);
  external num get id;
  external set id(num v);
  external factory Tensor(List<num> shape);
  external static get nextID;
  external static set nextID(v);
}

/// Node is the concrete base class for all operations in the graph.
/// Users generally don't need to interact directly with Node instances, but they
/// are provided for informational and introspection purposes.
/// @hidden
@JS()
abstract class Node {
  // @Ignore
  Node.fakeConstructor$();
  external Graph get graph;
  external set graph(Graph v);
  external String get name;
  external set name(String v);
  external dynamic /*JSMap of <String,Tensor>*/ get inputs;
  external set inputs(dynamic /*JSMap of <String,Tensor>*/ v);
  external Tensor get output;
  external set output(Tensor v);

  /// inputs.
  external factory Node(Graph graph, String name,
      dynamic /*JSMap of <String,Tensor>*/ inputs, Tensor output);
  external void validate();
  external num get id;
  external set id(num v);
  external static get nextID;
  external static set nextID(v);
}

/// VariableNode represents a variable, a user-provided NDArray that's
/// adjusted during backpropagation training.
/// @hidden
@JS()
class VariableNode extends Node {
  // @Ignore
  VariableNode.fakeConstructor$() : super.fakeConstructor$();
  external NDArray get data;
  external set data(NDArray v);
  external factory VariableNode(Graph graph, String name, NDArray data);
  external validate();
}

/// PlaceholderNode represents a placeholder, a user-provided NDArray
/// that's used as immutable input during inference and training.
/// @hidden
@JS()
class PlaceholderNode extends Node {
  // @Ignore
  PlaceholderNode.fakeConstructor$() : super.fakeConstructor$();
  external factory PlaceholderNode(Graph graph, String name, List<num> shape);
  external validate();
}

/// ConstantNode represents a constant value in the graph.
/// @hidden
@JS()
class ConstantNode extends Node {
  // @Ignore
  ConstantNode.fakeConstructor$() : super.fakeConstructor$();
  external NDArray get data;
  external set data(NDArray v);
  external factory ConstantNode(Graph graph, NDArray data);
  external validate();
}

/// ReshapeNode represents a reshape operation in the graph.
/// @hidden
@JS()
class ReshapeNode extends Node {
  // @Ignore
  ReshapeNode.fakeConstructor$() : super.fakeConstructor$();
  external String get name;
  external set name(String v);
  external Tensor get x;
  external set x(Tensor v);
  external List<num> get shape;
  external set shape(List<num> v);
  external static get X;
  external static set X(v);
  external factory ReshapeNode(
      Graph graph, String name, Tensor x, List<num> shape);
  external validate();
}

/// LinearCombinationNode represents a linear combination of two tensors.
/// @hidden
@JS()
class FusedLinearCombinationNode extends Node {
  // @Ignore
  FusedLinearCombinationNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get t1;
  external set t1(Tensor v);
  external Tensor get t2;
  external set t2(Tensor v);
  external Tensor get c1;
  external set c1(Tensor v);
  external Tensor get c2;
  external set c2(Tensor v);
  external static get T1;
  external static set T1(v);
  external static get T2;
  external static set T2(v);
  external static get C1;
  external static set C1(v);
  external static get C2;
  external static set C2(v);
  external factory FusedLinearCombinationNode(
      Graph graph, Tensor t1, Tensor t2, Tensor c1, Tensor c2);
  external validate();
}

/// @hidden
@JS()
class AddNode extends Node {
  // @Ignore
  AddNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get t1;
  external set t1(Tensor v);
  external Tensor get t2;
  external set t2(Tensor v);
  external static get T1;
  external static set T1(v);
  external static get T2;
  external static set T2(v);
  external factory AddNode(Graph graph, Tensor t1, Tensor t2);
  external validate();
}

/// @hidden
@JS()
class SubtractNode extends Node {
  // @Ignore
  SubtractNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get t1;
  external set t1(Tensor v);
  external Tensor get t2;
  external set t2(Tensor v);
  external static get T1;
  external static set T1(v);
  external static get T2;
  external static set T2(v);
  external factory SubtractNode(Graph graph, Tensor t1, Tensor t2);
  external validate();
}

/// @hidden
@JS()
class MultiplyNode extends Node {
  // @Ignore
  MultiplyNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get t1;
  external set t1(Tensor v);
  external Tensor get t2;
  external set t2(Tensor v);
  external static get T1;
  external static set T1(v);
  external static get T2;
  external static set T2(v);
  external factory MultiplyNode(Graph graph, Tensor t1, Tensor t2);
  external validate();
}

/// @hidden
@JS()
class DivideNode extends Node {
  // @Ignore
  DivideNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get t1;
  external set t1(Tensor v);
  external Tensor get t2;
  external set t2(Tensor v);
  external static get T1;
  external static set T1(v);
  external static get T2;
  external static set T2(v);
  external factory DivideNode(Graph graph, Tensor t1, Tensor t2);
  external validate();
}

/// @hidden
@JS()
class ReduceSumNode extends Node {
  // @Ignore
  ReduceSumNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory ReduceSumNode(Graph graph, Tensor x);
  external validate();
}

/// Concat3DNode represents a 3D concatenation of two tensors along an axis.
/// @hidden
@JS()
class Concat3DNode extends Node {
  // @Ignore
  Concat3DNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x1;
  external set x1(Tensor v);
  external Tensor get x2;
  external set x2(Tensor v);
  external num get axis;
  external set axis(num v);
  external static get X1;
  external static set X1(v);
  external static get X2;
  external static set X2(v);
  external static get AXIS;
  external static set AXIS(v);
  external factory Concat3DNode(Graph graph, Tensor x1, Tensor x2, num axis);
  external validate();
}

@JS()
external List<num> getMatMulOutputShape(List<num> x1Shape, List<num> x2Shape);

/// MatMulNode represents a fully connected layer in the graph.
/// @hidden
@JS()
class MatMulNode extends Node {
  // @Ignore
  MatMulNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x1;
  external set x1(Tensor v);
  external Tensor get x2;
  external set x2(Tensor v);
  external static get X1;
  external static set X1(v);
  external static get X2;
  external static set X2(v);
  external factory MatMulNode(Graph graph, Tensor x1, Tensor x2);
  external validate();
}

/// Convolution2DNode represents a 2d convolution operation in the graph.
/// @hidden
@JS()
class Convolution2DNode extends Node {
  // @Ignore
  Convolution2DNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x;
  external set x(Tensor v);
  external Tensor get w;
  external set w(Tensor v);
  external Tensor get b;
  external set b(Tensor v);
  external num get fieldSize;
  external set fieldSize(num v);
  external num get outputDepth;
  external set outputDepth(num v);
  external get stride;
  external set stride(v);
  external num get zeroPad;
  external set zeroPad(num v);
  external static get X;
  external static set X(v);
  external static get W;
  external static set W(v);
  external static get B;
  external static set B(v);
  external factory Convolution2DNode(
      Graph graph, Tensor x, Tensor w, Tensor b, num fieldSize, num outputDepth,
      [stride, num zeroPad]);
  external validate();
}

/// MaxPoolNode represents a 2d max pool operation in the graph.
/// @hidden
@JS()
class MaxPoolNode extends Node {
  // @Ignore
  MaxPoolNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x;
  external set x(Tensor v);
  external num get fieldSize;
  external set fieldSize(num v);
  external get stride;
  external set stride(v);
  external num get zeroPad;
  external set zeroPad(num v);
  external static get X;
  external static set X(v);
  external factory MaxPoolNode(Graph graph, Tensor x, num fieldSize,
      [stride, num zeroPad]);
  external validate();
}

/// ReLUNode represents a ReLU operation in the graph.
/// @hidden
@JS()
class ReLUNode extends Node {
  // @Ignore
  ReLUNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory ReLUNode(Graph graph, Tensor x);
  external validate();
}

/// ExpNode represents a Exponentiation operation in the graph.
/// @hidden
@JS()
class ExpNode extends Node {
  // @Ignore
  ExpNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory ExpNode(Graph graph, Tensor x);
  external validate();
}

/// LogNode represents a Exponentiation operation in the graph.
/// @hidden
@JS()
class LogNode extends Node {
  // @Ignore
  LogNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory LogNode(Graph graph, Tensor x);
  external validate();
}

/// TanHNode represents a tanh operation in the graph.
/// @hidden
@JS()
class TanHNode extends Node {
  // @Ignore
  TanHNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory TanHNode(Graph graph, Tensor x);
  external validate();
}

/// SigmoidNode represents a sigmoid operation in the graph.
/// @hidden
@JS()
class SigmoidNode extends Node {
  // @Ignore
  SigmoidNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory SigmoidNode(Graph graph, Tensor x);
  external validate();
}

/// Square node represents an element-wise square operation in the graph.
/// @hidden
@JS()
class SquareNode extends Node {
  // @Ignore
  SquareNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external factory SquareNode(Graph graph, Tensor x);
  external validate();
}

/// SoftmaxCrossEntropyCostNode represents a softmax cross-entropy cost operation
/// in the graph.
/// @hidden
@JS()
class SoftmaxCrossEntropyCostNode extends Node {
  // @Ignore
  SoftmaxCrossEntropyCostNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x;
  external set x(Tensor v);
  external Tensor get target;
  external set target(Tensor v);
  external static get X;
  external static set X(v);
  external static get TARGET;
  external static set TARGET(v);
  external factory SoftmaxCrossEntropyCostNode(
      Graph graph, Tensor x, Tensor target);
  external validate();
}

/// @hidden
@JS()
class SoftmaxNode extends Node {
  // @Ignore
  SoftmaxNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x;
  external set x(Tensor v);
  external static get X;
  external static set X(v);
  external factory SoftmaxNode(Graph graph, Tensor x);
  external validate();
}

/// MeanSquaredCostNode represents a mean squared cost operation
/// in the graph.
/// @hidden
@JS()
class MeanSquaredCostNode extends Node {
  // @Ignore
  MeanSquaredCostNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get label;
  external set label(Tensor v);
  external Tensor get prediction;
  external set prediction(Tensor v);
  external static get LABEL;
  external static set LABEL(v);
  external static get PREDICTION;
  external static set PREDICTION(v);
  external factory MeanSquaredCostNode(
      Graph graph, Tensor label, Tensor prediction);
  external validate();
}

/// ArgMaxNode represents an argmax operation in the graph.
/// @hidden
@JS()
class ArgMaxNode extends Node {
  // @Ignore
  ArgMaxNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x;
  external set x(Tensor v);
  external static get X;
  external static set X(v);
  external factory ArgMaxNode(Graph graph, Tensor x);
  external validate();
}

/// ArgMaxEqualsNode represents a argmax equals operation in the graph.
/// @hidden
@JS()
class ArgMaxEqualsNode extends Node {
  // @Ignore
  ArgMaxEqualsNode.fakeConstructor$() : super.fakeConstructor$();
  external Tensor get x1;
  external set x1(Tensor v);
  external Tensor get x2;
  external set x2(Tensor v);
  external static get X1;
  external static set X1(v);
  external static get X2;
  external static set X2(v);
  external factory ArgMaxEqualsNode(Graph graph, Tensor x1, Tensor x2);
  external validate();
}

/// Split nodes are used to accumulate backprop derivatives when a node's output
/// tensor is consumed by multiple nodes.
/// @hidden
@JS()
class SplitNode extends Node {
  // @Ignore
  SplitNode.fakeConstructor$() : super.fakeConstructor$();
  external static get X;
  external static set X(v);
  external List<Tensor> get outputs;
  external set outputs(List<Tensor> v);
  external factory SplitNode(Graph graph, Tensor x);

  /// Registers a new consumer of this split node, i.e. a new node that uses the
  /// node's output tensor.
  external Tensor getNewOutputTensor();
  external validate();
}

/// @hidden
/*export type ArrayData =
    NDArray|number|number[]|number[][]|number[][][]|number[][][][];*/
