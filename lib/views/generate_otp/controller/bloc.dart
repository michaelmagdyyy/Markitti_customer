import 'package:e_commerce/models/info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../core/services/cache_helper.dart';
import '../../../models/code_model.dart';
import 'event.dart';
import 'state.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(CodeState()) {
    on<GetCodeEvent>(_fun);
    on<SocketQrEvent>(socketQr);
    on<AcceptOrCancelEvent>(acceptOrCancel);
  }

  CodeModel? model;
  InfoModel? infoModel;

  Future<void> _fun(GetCodeEvent event, Emitter<CodeState> emit) async {
    emit(LoadingCodeState());

    final response = await ServerGate.i.sendToServer(
      url: 'Purchasing/generate_qr_code',
      body: {
        "card_no": CacheHelper.getValue(AppCached.cardNum) ?? "",
        "device_token": "a2426c2ed5cc2f569664e4abad17e960",
        "brand_id": event.id,
        "csrf_token_name": CacheHelper.getValue(AppCached.tokenName),
        "csrf_token_value": CacheHelper.getValue(AppCached.token),
      },
    );
    if (response.success) {
      model = CodeModel.fromJson(response.data['data']);
      emit(DoneCodeState(response.msg));
    } else {
      emit(FailedCodeState(response.msg));
    }
  }

  Future<void> socketQr(SocketQrEvent event, Emitter<CodeState> emit) async {
    emit(LoadingSocketQrState());

    final response = await ServerGate.i.sendToServer(
      url: 'Purchasing/purchasing_request',
      body: {
        "qr_code": event.qrCode,
      },
    );
    if (response.success) {
      infoModel = InfoModel.fromJson(response.data['data']);
      emit(DoneSocketQrState(response.msg));
    } else {
      emit(FailedSocketQrState(response.msg));
    }
  }

  Future<void> acceptOrCancel(AcceptOrCancelEvent event, Emitter<CodeState> emit) async {
    emit(LoadingAcceptOrCancelState());

    final response = await ServerGate.i.sendToServer(
      url: 'Purchasing/reply_purchasing',
      body: {
        "qr_code": event.qrCode,
        "customer_reply": event.type,
      },
    );
    if (response.success) {
      emit(DoneAcceptOrCancelState(response.msg));
    } else {
      emit(FailedAcceptOrCancelState(response.msg));
    }
  }
}
