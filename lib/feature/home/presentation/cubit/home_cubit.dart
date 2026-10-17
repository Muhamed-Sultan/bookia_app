import 'package:bookia_app/feature/home/data/models/book_model.dart';
import 'package:bookia_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getBestSellerBooks() async {
    emit(GetBestsellerBooksLoading());
    final response = await HomeRepo.getBestSellerBooks();

    if (response is BookModel) {
      emit(GetBestsellerBooksSuccess(response.data?.products ?? <Products>[]));
    } else {
      emit(GetBestsellerBooksLoading());
    }
  }
}
