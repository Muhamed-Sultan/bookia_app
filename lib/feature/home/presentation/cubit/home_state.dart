part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetBestsellerBooksLoading extends HomeState {}

final class GetBestsellerBooksError extends HomeState {
  final String error;
  GetBestsellerBooksError({required this.error});
}

final class GetBestsellerBooksSuccess extends HomeState {
  final List<Products> product;

  GetBestsellerBooksSuccess(this.product);
}

final class SearchError extends HomeState {
  final String error;
  SearchError({required this.error});
}

final class SearchLoading extends HomeState {}

final class SearchSuccess extends HomeState {
  final List<Products> product;

  SearchSuccess(this.product);
}
