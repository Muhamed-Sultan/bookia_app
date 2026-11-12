import 'package:bookia_app/core/networking/error_handling.dart';
import 'package:bookia_app/feature/home/data/models/book_model.dart';
import 'package:bookia_app/feature/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getBestSellerBooks() async {
    emit(GetBestsellerBooksLoading());
    final response = await HomeRepo.getBestSellerBooks();

    if (response is BookModel) {
      emit(GetBestsellerBooksSuccess(response.data?.products ?? <Products>[]));
    } else {
      emit(GetBestsellerBooksLoading());
    }
  }

  Future<void> search(String text) async {
    emit(SearchLoading());
    try {
      final data = await HomeRepo.search(text);
      if (data is List<Products>) {
        emit(SearchSuccess(data));
      } else {
        emit(SearchError(error: 'Registration failed'));
      }
    } on DioException catch (e) {
      final error = ErrorHandler.handleDioException(e);
      emit(SearchError(error: error));
    }
  }
}
