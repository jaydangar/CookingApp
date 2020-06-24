import 'package:CookingApp/models/cooks.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkCallStates extends Equatable{
  @override
  List<Object> get props => [];
}

class InitialState extends NetworkCallStates{
  final Future<List<Cook>> cookList;
  InitialState(this.cookList):super();

  @override
  List<Object> get props => [cookList];
}

class LoadingState extends NetworkCallStates{
  LoadingState() : super();
}

class LoadedState extends NetworkCallStates{
  final Future<List<Cook>> cookList;
  LoadedState(this.cookList):super();

  @override
  List<Object> get props => [cookList];
}

class OffLineLoadState extends NetworkCallStates{
  final Future<List<Cook>> cookList;
  OffLineLoadState(this.cookList):super();

  @override
  List<Object> get props => [cookList];
}

class ErrorState extends NetworkCallStates{
  final String error;
  ErrorState(this.error) : super();
}