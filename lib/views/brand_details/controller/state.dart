import '../../../../core/widgets/flash_helper.dart';

class BrandDetailsState {}

class DoneBrandDetailsState extends BrandDetailsState {
  final String msg;

  DoneBrandDetailsState(this.msg) {
    FlashHelper.showToast(msg, type: MessageType.success);
  }
}

class LoadingBrandDetailsState extends BrandDetailsState {}
class InitialBrandDetailsState extends BrandDetailsState {}

class FailedBrandDetailsState extends BrandDetailsState {
  final String msg;

  FailedBrandDetailsState(this.msg) {
    FlashHelper.showToast(msg);
  }
}
