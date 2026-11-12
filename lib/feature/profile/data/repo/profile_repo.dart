import 'package:bookia_app/core/networking/api_endpoint.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/feature/profile/data/models/profile_model.dart';

class ProfileRepo {
  static Future<ProfileResponse?>? getProfileData() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoint.profile);
      if (response?.statusCode == 200) {
        ProfileResponse profileData = ProfileResponse.fromJson(response?.data);
        return profileData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
