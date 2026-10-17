part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetBestsellerBooksLoading extends HomeState {}

final class GetBestsellerBooksError extends HomeState {}

final class GetBestsellerBooksSuccess extends HomeState {
  final List<Products> product;

  GetBestsellerBooksSuccess(this.product);
}
