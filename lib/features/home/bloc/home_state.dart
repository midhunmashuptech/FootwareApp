part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<BannerItem> bannerItems;
  final List<String> categories;
  final List<FootwareModel> popularItems;

  HomeLoaded(this.bannerItems, this.categories, this.popularItems);
}

final class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);
}
