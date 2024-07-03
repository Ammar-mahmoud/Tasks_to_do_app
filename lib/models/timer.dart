import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:taskaty/models/notifi_service.dart';

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  int _minutesRemaining = 0;
  int _secondsRemaining = 0;
  int _loop = 0;
  Color color = Colors.white;
  //final List<String> numbers = ['الاولي', 'التانية', 'التالته'];
  int get minutesRemaining => _minutesRemaining;
  int get secondsRemaining => _secondsRemaining;
  int get loop => _loop;

  bool get isRunning => _timer != null && _timer!.isActive;

  void alert(BuildContext context) {
    Alert(
      type: AlertType.success,
      title: "مبروك",
      desc: "عااش انت قدرت تخلص دورة بومودورو كاملة 🎉",
      buttons: [
        DialogButton(
          child: Text(
            "الي بعدده",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
      context: context,
    ).show();
  }

  void startTimer(BuildContext context) {
    if (_loop == 0) {
      play('opa.mp3');
    }
    else
    {
      play('elebaado.mp3');
    }
    // NotificationService()
    //           .showNotification(title: 'استراحة محارب', body: ' الفترة ${numbers[_loop+ 1] } بدأت');
    _minutesRemaining = 25;
    _secondsRemaining = 0;
    color = const Color.fromARGB(255, 245, 79, 68);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
      } else if (_minutesRemaining > 0) {
        _minutesRemaining--;
        _secondsRemaining = 59;
      } else {
        _timer?.cancel();
        if (_loop != 3) {
          startNewTimer(
              context); // Start a new 5-minute timer after the 25-minute timer
        } else {
          _loop = 0;
          alert(context);
          // NotificationService()
          //     .showNotification(title: 'صحا الاسد اللهم لا حسد', body: '🎉 عااش يا بطل خلصت دورة بومودورو كاملة');
        }
      }
      notifyListeners();
    });
  }

  void startNewTimer(BuildContext context) {
    play('artah.mp3');
    // NotificationService()
              // .showNotification(title: 'استراحة محارب', body: 'استراحة الفترة ${numbers[_loop+ 1] } بدأت');
    _minutesRemaining = 5;
    _secondsRemaining = 0;
    color = const Color.fromARGB(255, 24, 222, 202);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
      } else if (_minutesRemaining > 0) {
        _minutesRemaining--;
        _secondsRemaining = 59;
      } else {
        _timer?.cancel();
        startTimer(context);
      }
      notifyListeners();
    });
    _loop++;
    notifyListeners();
  }

  void play(String link) async {
    final audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource(link));
  }

  void stopTimer() {
    _timer?.cancel();
    _loop = 0;
    notifyListeners();
  }
}
