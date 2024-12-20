import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  void updateScrolling(bool isAtTop){
    emit(ScrollUpdateState(scroll: isAtTop));
  }
}
