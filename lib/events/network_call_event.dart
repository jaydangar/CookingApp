import 'package:equatable/equatable.dart';

abstract class NetworkCallEvents extends Equatable{
  NetworkCallEvents();
}

class FetchDataEvent extends NetworkCallEvents{
  @override
  List<Object> get props => [];
}

class FetchDataEventOffline extends NetworkCallEvents{
  @override
  List<Object> get props => [];
}