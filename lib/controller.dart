import 'model.dart';
import 'model.dart';
import 'model.dart';
import 'model.dart';

// 2. 모델을 주입 받도록 컨트롤러 생성

// Counter 모델을 주입하는 컨트롤러
class CounterController {
  final CounterModel _counterModel;

  CounterController(this._counterModel);

  // 뷰에 표시되는 카운터 값을 property 로 생성
  int _counter = 0;
  int get counter => _counter;

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
    _counter = _counterModel.counter;
  }
}

// CounterMode 모델을 주입하는 컨트롤러
class CounterModeController {
  final CounterModeModel _counterModeModel;

  CounterModeController(this._counterModeModel);

  CounterMode _counterMode = CounterMode.plus;
  CounterMode get counterMode => _counterMode;

  void toggleMode() {
    _counterModeModel.toggleMode();
    _update();
  }

  void _update() {
    _counterMode = _counterModeModel.counterMode;
  }
}