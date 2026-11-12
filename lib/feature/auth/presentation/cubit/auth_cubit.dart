import 'package:bookia_app/core/networking/error_handling.dart';
import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      final response = await AuthRepo.login(email: email, password: password);

      if (response) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(error: 'Login failed'));
      }
    } on DioException catch (e) {
      final error = ErrorHandler.handleDioException(e);
      emit(LoginErrorState(error: error));
    } catch (e) {
      emit(LoginErrorState(error: 'Something went wrong'));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());

    try {
      final response = await AuthRepo.register(
        email: email,
        password: password,
        name: name,
      );

      if (response) {
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState(error: 'Registration failed'));
      }
    } on DioException catch (e) {
      final error = ErrorHandler.handleDioException(e);
      emit(RegisterErrorState(error: error));
    }
  }
}
