class BrandDetailsEvent {}

class StartBrandDetailsEvent extends BrandDetailsEvent {
  final String id;

  StartBrandDetailsEvent({required this.id});
}
