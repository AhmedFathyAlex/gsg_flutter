abstract class CounterStates {
  final int currentState;
  CounterStates({this.currentState = 0});
}

class CounterInitialState extends CounterStates {
  CounterInitialState({ required int currentState}) :
   super(currentState: currentState);
}

class CounterIncrementState extends CounterStates {
  CounterIncrementState({ required int currentState}) :
   super(currentState: currentState);
}

class CounterDecrementState extends CounterStates {
  CounterDecrementState({ required int currentState}) :
   super(currentState: currentState);
}