// service/web_socket_service/web_socket_service.dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  final String url;
  WebSocketChannel? _channel;
  void Function(Map<String, dynamic> data)? onMessage;

  WebSocketService({required this.url});

  bool get isConnected => _channel != null;

  Future<void> connect() async {
    if (isConnected) return;
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));

      _channel!.stream.listen(
            (message) {
          try {
            final data = jsonDecode(message);
            if (data is Map<String, dynamic> && onMessage != null) {
              onMessage!(data);
            }
          } catch (_) {}
        },
        onError: (error) => print('WebSocket error: $error'),
        onDone: () => _channel = null,
      );
    } catch (e) {
      print('WebSocket connection failed: $e');
    }
  }

  void sendMessage(Map<String, dynamic> data) {
    if (!isConnected) return;
    _channel!.sink.add(jsonEncode(data));
  }

  void disconnect() {
    if (!isConnected) return;
    _channel!.sink.close(status.goingAway);
    _channel = null;
  }
}
