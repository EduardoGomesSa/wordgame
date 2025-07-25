import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:wordgame/src/controllers/game_controller.dart';
import 'package:wordgame/src/screens/home/modals/new_word_modal.dart';

class StopWatcherDown extends StatefulWidget {
  const StopWatcherDown({super.key});

  @override
  State<StopWatcherDown> createState() => _StopWatcherDownState();
}

class _StopWatcherDownState extends State<StopWatcherDown> {
  late StopWatchTimer stopWatchTimer;
  final controller = GameController();

  @override
  void initState() {
    super.initState();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: 6000, 
      onEnded: () {
        debugPrint('Contagem regressiva finalizada!');
        Navigator.pop(context);
        _openModal(context);
      },
    );
    stopWatchTimer.onStartTimer(); 
  }

  void _openModal(BuildContext context) async {
    final String? newWord = await showModalBottomSheet(
        context: context, builder: (context) => NewWordModal(gameController: controller,));

    if(newWord != null || newWord!.isNotEmpty) {
      print("usuario digitou: $newWord");
    }
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
              color: Colors.blue[100],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue[100]!, width: 4),
            ),
            alignment: Alignment.center,
            child: Text(
              displayTime,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
