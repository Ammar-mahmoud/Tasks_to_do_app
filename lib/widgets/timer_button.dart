import 'package:flutter/material.dart';
import 'package:taskaty/models/Timer.dart';
import 'package:taskaty/widgets/show_dialog_timer.dart';
import 'package:provider/provider.dart';


class TimerButton extends StatelessWidget {
  const TimerButton({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${timerProvider.loop}/4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.teal),),
        FloatingActionButton(
          onPressed: () {
            if (!timerProvider.isRunning) {
              showDialogTimer(
                  context,
                  'طريقة البومودورو',
                  ' طريقة مستخدمة لإدارة الوقت\n اضغظ ابدء لبداية الدورة',
                  Colors.teal,
                  'مش دلوقتي',
                  'ابدأ',
                  () {}, () {
                timerProvider.startTimer(context);
              });
            } else {
              showDialogTimer(context, 'وقف الفترة',
                  'هل تريد ايقاف الدورة', Colors.red, 'وقف', 'متوقفش', () {
                timerProvider.stopTimer();
              }, () {});
            }
          },
          backgroundColor: Colors.indigo[300],
          child: Column(
            children: [
              timerProvider.isRunning
                  ? Icon(
                      Icons.stop,
                      size: 28,
                      color: timerProvider.color,
                    )
                  : Icon(
                      Icons.play_arrow,
                      size: 28,
                      color: Colors.teal[500],
                    ),
              timerProvider.isRunning
                  ? Text(
                      '${timerProvider.minutesRemaining}:${timerProvider.secondsRemaining}',
                      style: TextStyle(fontSize: 16, color: timerProvider.color),
                    )
                  : Text('25:00',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
  
}
