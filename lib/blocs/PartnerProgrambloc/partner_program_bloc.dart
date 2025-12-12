import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/services/my_functions.dart';
import '../../core/services/server_gate.dart';
import '../../models/PartnerProgramModel.dart';

part 'partner_program_event.dart';
part 'partner_program_state.dart';

class PartnerProgramBloc extends Bloc<PartnerProgramEvent, PartnerProgramState> {
  PartnerProgramBloc() : super(PartnerProgramInitial()) {
    on<GetPartnerProgramEvent>(_sendData);
  }
  void _sendData(GetPartnerProgramEvent event, Emitter<PartnerProgramState> emit) async {
    emit(PartnerProgramLoading());
    final response = await ServerGate.i.sendToServer( url: "Partner_program",
        body: {
          "device_token" : "${await MyFunctions.getToken()}",
        });
    if (response.success) {
      PartnerProgramModel model = PartnerProgramModel.fromJson(response.data);
      emit(PartnerProgramLoaded(model: model));
    } else {
      emit(PartnerProgramError(msg: response.msg));
    }
  }
}
