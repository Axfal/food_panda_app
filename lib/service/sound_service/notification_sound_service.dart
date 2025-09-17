import 'package:audioplayers/audioplayers.dart';

class NotificationSound {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playNotification() async {
    await _player.stop();
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(1.0);
    await _player.play(
      AssetSource('sounds/notification_sound.mp3'),
    );
  }

  static Future<void> stopNotification() async {
    await _player.stop();
  }
}
