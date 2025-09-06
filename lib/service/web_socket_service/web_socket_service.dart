// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  final String url;
  WebSocketChannel? _channel;

  WebSocketService({required this.url});

  /// This is the getter you need
  bool get isConnected => _channel != null;

  /// Connect to WebSocket server
  void connect() {
    if (isConnected) return;

    _channel = WebSocketChannel.connect(Uri.parse(url));

    _channel!.stream.listen(
          (message) {
        try {
          final data = jsonDecode(message);
          print('Received from server: $data');
        } catch (e) {
          print('Invalid JSON received: $message');
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket connection closed');
        _channel = null;
      },
    );

    print('WebSocket connected to $url');
  }

  /// Send message to server
  void sendMessage(Map<String, dynamic> data) {
    if (!isConnected) {
      print('WebSocket is not connected. Cannot send message.');
      return;
    }

    _channel!.sink.add(jsonEncode(data));
    print('Sent: ${jsonEncode(data)}');
  }

  /// Disconnect WebSocket
  void disconnect() {
    if (!isConnected) return;
    _channel!.sink.close(status.goingAway);
    _channel = null;
    print('WebSocket disconnected');
  }
}
