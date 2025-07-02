import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatcherDown extends StatefulWidget {
  const StopWatcherDown({super.key});

  @override
  State<StopWatcherDown> createState() => _StopWatcherDownState();
}

class _StopWatcherDownState extends State<StopWatcherDown> {
  late StopWatchTimer stopWatchTimer;

  @override
  void initState() {
    super.initState();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: 6000, // 5 segundos
      onEnded: () {
        debugPrint('Contagem regressiva finalizada!');
        Navigator.pop(context);
      },
    );
    stopWatchTimer.onStartTimer(); // inicia automaticamente
  }

  @override
  void dispose() {
    stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: stopWatchTimer.rawTime,
        initialData: stopWatchTimer.rawTime.value,
        builder: (context, snapshot) {
          final value = snapshot.data ?? 0;
          final displayTime = StopWatchTimer.getDisplayTime(
            value,
            milliSecond: false,
            hours: false,
            minute: false,
          );

          return Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              // color: Colors.blue[100],
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 4),
            ),
            alignment: Alignment.center,
            child: Text(
              displayTime,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          );
        },
      ),
    );
  }
}
