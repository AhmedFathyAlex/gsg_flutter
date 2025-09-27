import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  String counterKey = 'counter';

@override
  void initState() {
    super.initState();
    readCounter();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Device Height : ${size.height}'),
            Text('Device Width : ${size.width}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _counter--;
                      saveCounter(_counter);
                    });
                  },
                ),
                Text(
                  _counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _counter++;
                      saveCounter(_counter);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  saveCounter(int counter)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterKey, counter);
  }
  readCounter()async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(counterKey) ?? 0;
    });
  }
}
