import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/services/cache_helper.dart';
import '../../../core/services/my_functions.dart';
import '../../../core/services/server_gate.dart';
import '../../../core/widgets/flash_helper.dart';
import '../../../models/UsageHistoryModel.dart';

part 'usage_history_event.dart';
part 'usage_history_state.dart';

class UsageHistoryBloc extends Bloc<UsageHistoryEvent, UsageHistoryState> {
  UsageHistoryBloc() : super(UsageHistoryInitial()) {
    on<GetUsageHistoryEvent>(_sendData);
  }
  void _sendData(GetUsageHistoryEvent event, Emitter<UsageHistoryState> emit) async {
    emit(UsageHistoryLoading());
    final response = await ServerGate.i.sendToServer( url: "Cards/get_usage_history",
        body: {
          "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
          "device_token" : "${await MyFunctions.getToken()}"
        });
    if (response.success) {
      UsageHistoryModel model = UsageHistoryModel.fromJson(response.data);
      emit(UsageHistoryLoaded(model: model));
    } else {
      emit(UsageHistoryError(msg: response.msg));
    }
  }

}