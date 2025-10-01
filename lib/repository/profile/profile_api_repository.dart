abstract  class ProfileApiRepository{
  Future<dynamic> getProfile(String id);
  Future<dynamic> updateProfile(dynamic data);
}