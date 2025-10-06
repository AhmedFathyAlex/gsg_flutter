import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/counter/cubit/counter_events.dart';
import 'package:gsg_flutter/counter/cubit/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents,CounterStates>{

  CounterBloc() : super(CounterInitialState(currentState: 0)){
    
    on<IncrementEvent>((event, emit) {
      emit(CounterIncrementState(currentState: state.currentState + 1));
    });

    on<DecrementEvent>((event, emit) {
      if (state.currentState <= 0) {
        emit(CounterDecrementState(currentState: state.currentState));
      } else {
        emit(CounterDecrementState(currentState: state.currentState - 1));
      }
    });
  }
}