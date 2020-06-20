import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkCallStates extends Equatable{
  @override
  List<Object> get props => [];
}

class LoadingState extends NetworkCallStates{
  LoadingState() : super();
}

class LoadedState extends NetworkCallStates{
  final Response cookResponse;
  LoadedState(this.cookResponse):super();

  @override
  List<Object> get props => [cookResponse];
}

class ErrorState extends NetworkCallStates{
  final String error;
  ErrorState(this.error) : super();
}