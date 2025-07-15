import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

extension FlushBarMessages on BuildContext {
  void _showFlushBar({
    required String message,
    required Icon icon,
    required Color backgroundColor,
  }) {
    showFlushbar(
      context: this,
      flushbar: Flushbar(
        message: message,
        icon: icon,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
      )..show(this),
    );
  }

  /// Show error message
  void flushBarErrorMessage({required String message}) {
    _showFlushBar(
      message: message,
      icon: const Icon(Icons.error, size: 28, color: Colors.white),
      backgroundColor: Colors.redAccent,
    );
  }

  /// Show success message
  void flushBarSuccessMessage({required String message}) {
    _showFlushBar(
      message: message,
      icon: const Icon(Icons.check_circle, size: 28, color: Colors.white),
      backgroundColor: Colors.green,
    );
  }

  /// Show alert/warning message
  void flushBarAlertMessage({required String message}) {
    _showFlushBar(
      message: message,
      icon: const Icon(Icons.warning_amber_rounded, size: 28, color: Colors.white),
      backgroundColor: Colors.orange,
    );
  }
}
