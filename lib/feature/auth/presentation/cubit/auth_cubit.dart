import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final response = await AuthRepo.login(email: email, password: password);

    if (response) {
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());
    final response = await AuthRepo.register(
      email: email,
      password: password,
      name: name,
    );

    if (response) {
      emit(RegisterSuccessState());
    } else {
      emit(RegisterErrorState());
    }
  }
}
