import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/server_gate.dart';
import 'event.dart';
import 'state.dart';

enum StaticPageType { faq, privacy, about }

class StaticPagesBloc extends Bloc<StaticPagesEvents, StaticPagesStates> {
  StaticPagesBloc() : super(StaticPagesInitial()) {
    on<StaticPagesEvent>(_sendData);
  }

  StaticPageType type = StaticPageType.faq;

  void _sendData(StaticPagesEvent event, Emitter<StaticPagesStates> emit) async {

      emit(StaticPagesLoadingState());


    final response = await ServerGate.i.sendToServer(
        url: type == StaticPageType.faq
            ? "client/page/faq"
            : type == StaticPageType.privacy
                ? "client/page/privacy"
                : "client/page/about");

    if (response.success) {
      emit(StaticPagesSuccessState());
    } else {
      emit(StaticPagesFailedState(msg: response.msg));
    }
  }
}
