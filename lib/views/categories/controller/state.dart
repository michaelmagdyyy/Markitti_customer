import '../../../../core/widgets/flash_helper.dart';

class CategoriesState {}

class DoneCategoriesState extends CategoriesState {
  final String msg;

  DoneCategoriesState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingCategoriesState extends CategoriesState {}

class FailedCategoriesState extends CategoriesState {
  final String msg;

  FailedCategoriesState(this.msg) {
    FlashHelper.showToast(msg);
  }
}
