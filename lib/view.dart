import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_starter/view_model.dart';

import 'model.dart';

// TODO: MVVM 패턴을 적용하여 카운터 앱이 동작하도록 변경하세요.
// - 단, View 내에 변수는 없어야 한다. (ex. counter)

// data binding 을 통해 상태를 업데이트하지 않고도 필요한 부분만 UI를 업데이트
class CounterView extends StatelessWidget {
//class CounterView extends StatefulWidget {
  // 주입 받을 컨트롤러를 정의
  final CounterViewModel counterViewModel;
  final CounterModeViewModel counterModeViewModel;

  const CounterView({
    super.key,
    required this.counterViewModel,
    required this.counterModeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MVVM'),
        actions: [
          IconButton(
            onPressed: onChangedMode,
            icon: const Icon(CupertinoIcons.arrow_2_squarepath),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            // value listenable builder 를 사용하여 실시간으로 UI 업데이트
            ValueListenableBuilder(
                valueListenable: counterViewModel.counter,
                builder: (context, counter, child) => Text(
                  counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: execute,
        child: ValueListenableBuilder(
            valueListenable: counterModeViewModel.counterMode,
            builder: (context, counterMode, child) => Icon(counterMode.icon),
        ),
      ),
    );
  }

  void onChangedMode() {
    // data binding 을 통해 상태를 업데이트하지 않고도 필요한 부분만 UI를 업데이트
    // 하고 있기 때문에 setState(() {}) 불필요
    counterModeViewModel.toggleMode();
  }

  void execute() {
    switch (counterModeViewModel.counterMode.value) {
      case CounterMode.plus:
        counterViewModel.increment();
      case CounterMode.minus:
        counterViewModel.decrement();
    }
  }
}

extension on CounterMode {
  IconData get icon {
    switch (this) {
      case CounterMode.plus:
        return CupertinoIcons.add;
      case CounterMode.minus:
        return CupertinoIcons.minus;
    }
  }
}
