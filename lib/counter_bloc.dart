import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

TextEditingController controllerIncrease = TextEditingController();
TextEditingController controllerDecrease = TextEditingController();

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(): super(0){
    on<CounterIncrementEvent>(onIncrementSome);
    on<CounterDecrementEvent>(onDecrementSome);
    on<CounterDecrementOneEvent>(onDecrementOne);
    on<CounterIncrementOneEvent>(onIncrementOne);
  }

  onIncrementSome(CounterIncrementEvent event, Emitter<int> emitter){
    if(controllerIncrease.text.isNotEmpty){emitter(state + int.parse(controllerIncrease.text.toString()));}

  }
  onDecrementSome(CounterDecrementEvent event, Emitter<int> emitter){
    if(controllerDecrease.text.isNotEmpty){
    emitter(state - int.parse(controllerDecrease.text.toString()));}
  }
  onDecrementOne(CounterDecrementOneEvent event, Emitter<int> emitter) {
    emitter(state - 1);
  }
  onIncrementOne(CounterIncrementOneEvent event, Emitter<int> emitter) {
    emitter(state + 1);
  }

  }

abstract class CounterEvent {}
class CounterIncrementEvent extends CounterEvent{}
class CounterDecrementEvent extends CounterEvent{}
class CounterDecrementOneEvent extends CounterEvent{}
class CounterIncrementOneEvent extends CounterEvent{}