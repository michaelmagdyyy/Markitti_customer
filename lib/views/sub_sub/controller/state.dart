import '../../../../core/widgets/flash_helper.dart';

class SubSubCategoriesState {}

class DoneSubSubCategoriesState extends SubSubCategoriesState {
  final String msg;

  DoneSubSubCategoriesState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingSubSubCategoriesState extends SubSubCategoriesState {}

class FailedSubSubCategoriesState extends SubSubCategoriesState {
  final String msg;

  FailedSubSubCategoriesState(this.msg) {
    FlashHelper.showToast(msg);
  }
}
class DoneSubSubCategoriesBrandState extends SubSubCategoriesState {
  final String msg;

  DoneSubSubCategoriesBrandState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingSubSubCategoriesBrandState extends SubSubCategoriesState {}

class FailedSubSubCategoriesBrandState extends SubSubCategoriesState {
  final String msg;

  FailedSubSubCategoriesBrandState(this.msg) {
    FlashHelper.showToast(msg);
  }
}
