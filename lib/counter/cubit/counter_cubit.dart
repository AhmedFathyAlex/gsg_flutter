import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/counter/cubit/counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState(currentState: 0));

  // data
  // int counter = 0;

  void increment() {
    emit(CounterIncrementState(currentState: state.currentState + 1));
  }

  void decrement() {
    if (state.currentState <= 0) {
      emit(CounterDecrementState(currentState: state.currentState));
    } else {
      emit(CounterDecrementState(currentState: state.currentState - 1));
    }
  }
}

// enum CounterState {initial, increment, decrement }
