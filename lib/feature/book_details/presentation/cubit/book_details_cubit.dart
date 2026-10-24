import 'package:bloc/bloc.dart';
import 'package:bookia_app/feature/book_details/data/models/book_details_model.dart';
import 'package:bookia_app/feature/book_details/data/repo/book_details_repo.dart';
import 'package:meta/meta.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());

  getDetails(int id) async {
    emit(BookDetailsLoading());
    final response = await BookDetailsRepo.getBookDetails(id);
    if (response is BookDetailsModel) {
      emit(BookDetailsSuccess(response.data));
    } else {
      emit(BookDetailsError());
    }
  }
}
