import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/counter/cubit/counter_bloc.dart';
import 'package:gsg_flutter/counter/cubit/counter_cubit.dart';
import 'package:gsg_flutter/counter/cubit/counter_events.dart';
import 'package:gsg_flutter/counter/cubit/counter_states.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<CounterBloc, CounterStates>(
            listener: (context, state) {
          if (state.currentState == 10) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Counter reached 10')));
          }
        
          if (state.currentState == 0 &&
              state is CounterDecrementState) {
           ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Counter Cant Be Nagative'),
                backgroundColor: Colors.red,));
          }
        },
            builder: (context, state) {
              var bloc = context.read<CounterBloc>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                     bloc.add( DecrementEvent());
                    },
                  ),
                  Text(
                    ' ${state.currentState}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      // context.read<CounterCubit>().increment();
                      bloc.add(IncrementEvent());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
