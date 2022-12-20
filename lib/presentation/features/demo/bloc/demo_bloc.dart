import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(const DemoState()) {
    on<NhapVoTangSoDem>((event, emit) {
      // TODO: implement event handler
      int value = state.so + 1;
      emit(state.copyWith(so: value));
    });

    on<NhapVoDoiMau>((event, emit) {
      bool value = false;
      if (state.isBlue == true) {
        value = false;
      }
      if (state.isBlue == false) {
        value = true;
      }
      emit(state.copyWith(isBlue: value));
    });

    /*     */

    on<DoiChuDoiMau>((event, emit) {
      String newText = 'BBB';
      emit(state.copyWith(text: newText));
    });
  }
}
