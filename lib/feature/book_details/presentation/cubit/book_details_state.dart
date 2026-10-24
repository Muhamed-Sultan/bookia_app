part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLoading extends BookDetailsState {}

final class BookDetailsSuccess extends BookDetailsState {
  final BookDataModel? data;
  BookDetailsSuccess(this.data);
}

final class BookDetailsError extends BookDetailsState {}
