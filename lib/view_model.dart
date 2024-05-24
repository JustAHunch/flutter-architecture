import 'package:flutter/widgets.dart';

import 'model.dart';

// 2. 모델을 주입 받도록 뷰모델 생성

// Counter 모델을 주입하는 뷰모델
class CounterViewModel {
  final CounterModel _counterModel;

  CounterViewModel(this._counterModel);

  // 뷰에 표시되는 카운터 값을 property 로 생성
  // -> value notifier로 전환하여 뷰에서 실시간으로 값을 변경할 수 있게 수정
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<int> get counter => _counter;

  // 뷰에서 사용자 입력을 받아서 처리 하는 함수 작성
  void increment() {
    _counterModel.increment();
    _update();
  }

  void decrement() {
    _counterModel.decrement();
    _update();
  }

  // 값을 갱신하는 로직은 분리
  void _update() {
    _counter.value = _counterModel.counter;
  }
}

// CounterMode 모델을 주입하는 뷰모델
class CounterModeViewModel {
  final CounterModeModel _counterModeModel;

  CounterModeViewModel(this._counterModeModel);

  final ValueNotifier<CounterMode> _counterMode = ValueNotifier<CounterMode>(CounterMode.plus);
  ValueNotifier<CounterMode> get counterMode => _counterMode;

  void toggleMode() {
    _counterModeModel.toggleMode();
    _update();
  }

  void _update() {
    _counterMode.value = _counterModeModel.counterMode;
  }
}