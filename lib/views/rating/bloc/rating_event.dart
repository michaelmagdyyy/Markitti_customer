part of 'rating_bloc.dart';

@immutable
sealed class RatingEvent {}
class GetRatingFactors extends RatingEvent{
  final String category_id;
  GetRatingFactors({required this.category_id});
}

class SmiteRating extends RatingEvent{
  final String transaction_id;
  final String recommendation;
  final String rate;
  final String complaint;
  final List<Map<String, dynamic>> ratings;
  SmiteRating({required this.transaction_id,required this.recommendation
    ,required this.rate,required this.complaint,required this.ratings});
}