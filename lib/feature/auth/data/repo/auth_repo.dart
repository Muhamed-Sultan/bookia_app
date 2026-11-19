import 'package:bookia_app/core/networking/api_endpoint.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/core/networking/error_handling.dart';
import 'package:bookia_app/core/services/locale/shared_local.dart';
import 'package:bookia_app/core/utils/validator/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  static Dio dio = Dio();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final response = await DioFactory.dio?.post(
        ApiEndpoint.login,
        data: {"email": email, "password": password},
      );
      if (response?.statusCode == 200) {
        String? token = response?.data["data"]["token"];
        saveToken(token ?? "");
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      ErrorHandler.handleDioException(e);
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> saveToken(String token) async {
    await SharedLocal.prefs?.setString(AppConstants.Token, token);
  }

  static Future<bool> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final response = await DioFactory.dio?.post(
        ApiEndpoint.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
        },
      );

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException {
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> signInWithGoogle() async {
    try {
      _googleSignIn.initialize(
        serverClientId:
            "378517300207-eqgldc88jcnovc3ssug4od6kcu4nf47c.apps.googleusercontent.com",
      );
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final token = await userCredential.user?.getIdToken();
      if (token != null) {
        await saveToken(token);
      }
      return userCredential.user != null;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return false;
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> registerWithGoogle() => signInWithGoogle();
}
