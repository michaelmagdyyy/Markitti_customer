import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/RatingFactorsModel.dart';
import 'package:meta/meta.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/server_gate.dart';
import '../../../core/widgets/flash_helper.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(RatingState()) {
    on<GetRatingFactors>(_getRating);
    on<SmiteRating>(_smiteRating);
  }
  RatingFactorsModel? model;

  Future<void> _getRating(GetRatingFactors event, Emitter<RatingState> emit) async {
    emit(LoadingCodeState());

    final response = await ServerGate.i.sendToServer(
      url: 'Rating/get_rating_factors',
      body: {
        "category_id" : 1
      }
    );
    if (response.success) {
      model = RatingFactorsModel.fromJson(response.data);
      // model = RatingFactorsModel.fromJson(response.data['data']);
      emit(DoneCodeState(response.msg));
    } else {
      emit(FailedCodeState(response.msg));
    }
  }

  Future<void> _smiteRating(SmiteRating event, Emitter<RatingState> emit) async {
    emit(LoadingCodeState());

    final response = await ServerGate.i.sendToServer(
        url: 'Rating/submit_ratings',
        body: {
          "transaction_id": event.transaction_id,
          "recommendation": event.recommendation, // must be ['recommended', 'not recommended']
          "rate": event.rate, // if "recommendation" == 'recommended' then "rate" must be ['not bad', 'good', 'excellent']
          "complaint": event.complaint,  // if "recommendation" == 'not recommended' then "complaint" is required
          "ratings":event.ratings
        }
    );
    if (response.success) {
      model = RatingFactorsModel.fromJson(response.data);
      pushAndRemoveUntil(NamedRoutes.navBar,);

      // model = RatingFactorsModel.fromJson(response.data['data']);
      emit(DoneCodeState(response.msg));
    } else {
      emit(FailedCodeState(response.msg));
    }
  }

}
