import 'package:equatable/equatable.dart';

abstract class HomePageEvents extends Equatable{
  HomePageEvents();
}

class FetchCookListEvent extends HomePageEvents{
  @override
  List<Object> get props => [];
}