part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState extends Equatable {}

class Initial extends HomePageState {
  @override
  List<Object> get props => [];
}

class GetSettingSuccess extends HomePageState {
  final String resTest;

  GetSettingSuccess(this.resTest,);
  @override
  List<Object> get props => [resTest];
}

class GetSettingError extends HomePageState {
  @override
  List<Object> get props => [];
}