import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder : (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('w'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context).add(CounterIncrementOneEvent());
                          },
                          child: const Text(
                            'Увеличить на 1',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context).add(CounterDecrementOneEvent());
                          },
                          child: const Text(
                            'Уменьшить на 1',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  )
                ],
              ),
              Text(
                '$state',
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent());
                          },
                          child: const Text(
                            'Увеличить на',
                            style: TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                          width: 50,
                          child: TextField(
                              controller: controllerIncrease,
                              keyboardType: TextInputType.number))
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context).add(CounterDecrementEvent());
                          },
                          child: const Text(
                            'Уменьшить на',
                            style: TextStyle(fontSize: 16),
                          )),
                      SizedBox(
                          width: 50,
                          child: TextField(
                              controller: controllerDecrease,
                              keyboardType: TextInputType.number))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
