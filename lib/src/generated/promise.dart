@JS('deeplearn')
library promise;

import 'package:js/js.dart';

@JS()
class Promise<T> {
  external void then(void onFulfilled(T value), void onRejected(T value));
  external Promise resolve(dynamic value);
}
