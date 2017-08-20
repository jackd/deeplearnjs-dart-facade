@JS('deeplearn')
library priority_queue;

import "package:js/js.dart";

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

/// Default comparison function for the priority queue.
@JS()
external num defaultCompare/*<T>*/(dynamic/*=T*/ a, dynamic/*=T*/ b);

/// A Comparator is a user-provided function that compares two T instances. The
/// convention for defaultCompare is expected to be followed to maintain the
/// binary min-heap integrity.
typedef num Comparator<T>(T a, T b);

/// IndexObserver is a user-provided callback that informs the caller when an
/// element in the priority queue's binary min-heap has been relocated.
typedef void IndexObserver<T>(T t, num newIndex);

/// A priority queue, implemented in terms of a binary min-heap. Lower priority
/// numbers are considered higher priority.
/// enqueue, dequeue, and update are all O(log N) with respect to the number of
/// elements in the queue.
@JS()
class PriorityQueue<T> {
  // @Ignore
  PriorityQueue.fakeConstructor$();
  external Comparator<T> get comparator;
  external set comparator(Comparator<T> v);
  external IndexObserver<T> get indexObserver;
  external set indexObserver(IndexObserver<T> v);
  external List<T> get heap;
  external set heap(List<T> v);

  /// changes the order of elements in its min-heap. Useful for tracking the
  /// positions of elements that need updating.
  external factory PriorityQueue(Comparator<T> comparator,
      [IndexObserver<T> indexObserver]);

  /// Add an element to the priority queue.
  external enqueue(T t);

  /// Remove an element from the priority queue.
  /// (lowest numeric priority value).
  external T dequeue();

  /// Updates an element at the specified index. This can be a full element
  /// replacement, or it can be an in-place update. The priority is assumed to be
  /// changed, and the internal storage is updated. This function is only useful
  /// if the storage index of the updated element is known; construct the
  /// PriorityQueue with an IndexObserver to track element locations.
  external update(T newT, num index);

  /// Predicate for testing whether the PriorityQueue is empty.
  external bool empty();
  external onIndexChanged(T t, num newIndex);

  /// Standard zero-indexed binary heap array layout:
  /// Parent(N) = Floor((N - 1) / 2)
  /// LeftChild(N) = (N * 2) + 1
  /// RightChild(N) = (N * 2) + 2
  external num getParentIndex(num index);
  external num getLeftChildIndex(num index);
  external num getRightChildIndex(num index);
  external num siftUpIndex(num index);
  external siftUp(num index);
  external num siftDownIndex(num index);
  external siftDown(num index);
  external num compare(num aIndex, num bIndex);
  external swap(num a, num b);
}
