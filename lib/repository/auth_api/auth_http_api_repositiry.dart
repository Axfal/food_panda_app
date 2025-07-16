
import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../model/user/user_model.dart';
import '../../utils/constants/app_urls.dart';
import 'auth_api_repository.dart';

/// Implementation of [AuthApiRepository] for making HTTP requests to the authentication API.
class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  /// Sends a login request to the authentication API with the provided [data].
  ///
  /// Returns a [UserModel] representing the user data if the login is successful.
  @override
  Future<UserModel> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.signIn, data);
    return UserModel.fromJson(response);
  }
}