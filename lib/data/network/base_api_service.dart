
/// Abstract class for defining base API services.
abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url, dynamic data);

  Future<dynamic> putApi(String url, dynamic data);

  Future<dynamic> deleteApi(String url);

  Future<dynamic> patchApi(String url, dynamic data);
}
