import 'package:bloc/bloc.dart';
import 'package:bookia_app/feature/profile/data/models/profile_model.dart';
import 'package:bookia_app/feature/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(GetProfileLoading());
    final response = await ProfileRepo.getProfileData();
    if (response is ProfileResponse) {
      emit(GetProfileSuccess(response));
    } else {
      emit(GetProfileError());
    }
  }
}
