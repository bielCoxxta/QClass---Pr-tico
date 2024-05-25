import 'dart:async';

import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:flutter/foundation.dart' show ValueNotifier, debugPrint;
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../crash_log.dart';
import 'either.dart';

abstract class CustomController<E, S> extends ValueNotifier<S>
    with EquatableMixin
    implements Disposable {
  CustomController(super.value);

  final _crashLog = Modular.get<CrashLog>();
  final ValueNotifier<E?> _error = ValueNotifier(null);
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  bool _wasDisposed = false;

  bool get wasDisposed => _wasDisposed;

  E? get error => _error.value;
  bool get hasError => _error.value != null;
  setError(E value) {
    if (!_wasDisposed) {
      _loading.value = false;
      _error.value = value;
      notifyListeners();
    }
  }

  void clearError({bool update = false}) {
    _error.value = null;
    if (update) {
      notifyListeners();
    }
  }

  bool get isLoading => _loading.value;
  setLoading(bool value) {
    if (!_wasDisposed) {
      _loading.value = value;
      notifyListeners();
    }
  }

  S get state => value;
  update(S state, {force = false}) {
    if (!_wasDisposed) {
      clearError();
      _loading.value = false;
      if (value != state) {
        value = state;
        notifyListeners();
      } else if (force) {
        value = state;
        notifyListeners();
      }
    }
  }

  Future<void> execute(Future<Either<E, S>> Function() function) async {
    clearError();
    setLoading(true);
    await function().then((value) {
      return value.fold((l) => setError(l), (r) => update(r));
    }).whenComplete(() => setLoading(false));
  }

  @override
  List<Object?> get props {
    return [value, error, isLoading, hashCode, wasDisposed];
  }

  @override
  bool? get stringify => true;

  @override
  void dispose() {
    try {
      if (_wasDisposed) {
        debugPrint('$runtimeType already disposed');
        return;
      }
      debugPrint('$runtimeType has been disposed');
      _error.dispose();
      _loading.dispose();
      _wasDisposed = true;
    } catch (exception, stackTrace) {
      debugPrint('$runtimeType already disposed');
      _crashLog.capture(exception: exception, stackTrace: stackTrace);
    }
    super.dispose();
  }
}
