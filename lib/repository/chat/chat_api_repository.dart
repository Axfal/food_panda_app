abstract class ChatApiRepository {
  Future<dynamic> sendMessage(dynamic data);
  Future<dynamic> getMessage(dynamic data);
  Future<dynamic> getConservation(dynamic data);
}
