import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable{
  @override
  List<Object> get props => [];
}

class HomePageLoading extends HomePageState{
  HomePageLoading() : super();
}

class HomePageLoaded extends HomePageState{
  final Response cookResponse;
  HomePageLoaded(this.cookResponse):super();

  @override
  List<Object> get props => [cookResponse];
}

class HomePageError extends HomePageState{
  final String error;
  HomePageError(this.error) : super();
}