import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/domain/home/usecases/home_usecases.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeUseCase homeUseCase;
  HomeCubit({this.homeUseCase}) : super(HomeInitial());
}
