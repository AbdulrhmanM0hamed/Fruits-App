import 'dart:developer'; // استيراد مكتبة log
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      log('${bloc.runtimeType} $transition', name: 'BlocTransition');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      log('${bloc.runtimeType} $change', name: 'BlocChange');
    }
  }
}
