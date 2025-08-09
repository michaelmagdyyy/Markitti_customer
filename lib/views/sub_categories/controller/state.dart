import '../../../../core/widgets/flash_helper.dart';

class SubCategoriesState {}

class DoneSubCategoriesState extends SubCategoriesState {
  final String msg;

  DoneSubCategoriesState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingSubCategoriesState extends SubCategoriesState {}

class FailedSubCategoriesState extends SubCategoriesState {
  final String msg;

  FailedSubCategoriesState(this.msg) {
    FlashHelper.showToast(msg);
  }
}
class DoneSubCategoriesBrandState extends SubCategoriesState {
  final String msg;

  DoneSubCategoriesBrandState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingSubCategoriesBrandState extends SubCategoriesState {}

class FailedSubCategoriesBrandState extends SubCategoriesState {
  final String msg;

  FailedSubCategoriesBrandState(this.msg) {
    FlashHelper.showToast(msg);
  }
}
