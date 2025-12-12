import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/app_bar.dart';
import '../../core/widgets/app_btn.dart';
import '../../models/RatingFactorsModel.dart';
import 'bloc/rating_bloc.dart';

class RatingViewScreen extends StatefulWidget {
  final String transaction_id;
  final String category_id;

  const RatingViewScreen({
    super.key,
    required this.transaction_id,
    required this.category_id,
  });

  @override
  State<RatingViewScreen> createState() => _RatingViewScreenState();
}

class _RatingViewScreenState extends State<RatingViewScreen> {
  final ratingBloc = sl<RatingBloc>();

  String? _selectedValue = "good";
  final List<String> _options = ["excellent", "good", "not bad"];

  bool? recommend = true;
  Map<int, int> ratings = {}; // factor_id -> star rating
  List<RatingFactorsData> factorsList = [];

  final TextEditingController reviewController = TextEditingController();
  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    ratingBloc.add(GetRatingFactors(category_id: widget.category_id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Rating",
          withBack: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Step 1: Recommend or Not
                  Row(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity: recommend == true ? 1 : 0.5,
                          child: AppBtn(
                            title: "I recommend him",
                            onPressed: () => setState(() => recommend = true),
                            loading: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Opacity(
                          opacity: recommend == false ? 1 : 0.5,
                          child: AppBtn(
                            title: "I don't recommend him",
                            onPressed: () => setState(() => recommend = false),
                            loading: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Step 2: Radio selection
                  if (recommend == true)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _options.map((option) {
                        return Row(
                          children: [
                            Radio<String>(
                              value: option,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() => _selectedValue = value);
                              },
                            ),
                            Text(option.tr()),
                            const SizedBox(width: 8),
                          ],
                        );
                      }).toList(),
                    ),

                  // Step 3: Star ratings from API
                  if (recommend == true)
                    BlocConsumer<RatingBloc, RatingState>(
                      bloc: ratingBloc,
                      listener: (context, state) {
                        if (state is DoneCodeState) {
                          factorsList = ratingBloc.model?.data ?? [];
                          ratings = {
                            for (var factor in factorsList)
                              (int.parse("${factor.ratingFactorsId ?? 0}")): 0
                          };
                          setState(() {});
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingCodeState) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (factorsList.isEmpty) return const SizedBox();

                        return Column(
                          children: factorsList.map((factor) {
                            final int factorId =int.parse("${factor.ratingFactorsId ?? 0}");
                            final currentRating = ratings[factorId] ?? 0;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  factor.factorName ?? '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: List.generate(5, (index) {
                                    return IconButton(
                                      icon: Icon(
                                        index < currentRating
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.amber,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          ratings[factorId] = index + 1;
                                        });
                                      },
                                    );
                                  }),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),

                  const SizedBox(height: 20),

                  // Step 4: Review input
                  TextField(
                    controller: reviewController,
                    maxLines: 3,
                    decoration:  InputDecoration(
                      hintText: "Write your review here...".tr(),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Step 5: Submit
                  AppBtn(
                    title: "Submit",
                    loading: isSubmitting,
                    onPressed: () {
                      setState(() => isSubmitting = true);

                      final recommendationValue =
                      recommend == true ? "recommended" : "not recommended";

                      final List<Map<String, dynamic>> ratingsList = recommendationValue == "recommended"
                          ? ratings.entries.map((e) {
                        return {
                          "factor_id": e.key,
                          "rating": e.value.toDouble(),
                        };
                      }).toList()
                          : [];
                      ratingBloc.add(SmiteRating(
                        transaction_id: widget.transaction_id,
                        recommendation: recommendationValue,
                        rate: _selectedValue ?? "",
                        complaint: "${reviewController.text} .",
                        ratings: ratingsList,
                      ));
                      setState(() => isSubmitting = false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
