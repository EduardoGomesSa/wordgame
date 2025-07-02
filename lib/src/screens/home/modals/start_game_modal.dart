import 'package:flutter/material.dart';

class StartGameModal extends StatefulWidget {
  const StartGameModal({super.key});

  @override
  State<StartGameModal> createState() => _StartGameModalState();
}

class _StartGameModalState extends State<StartGameModal> {
  String selectedLevel = 'Normal';
  final List<String> levels = ['Fácil', 'Normal', 'Difícil'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Escolha o nível da partida",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              iconEnabledColor: Colors.blue,
              focusColor: Colors.yellow,
              isExpanded: true,
              value: selectedLevel,
              hint: Text(selectedLevel),
              items: levels.map((level) {
                return DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: level,
                  child: Container(
                    color: Colors.blue,
                    child: Text(level),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLevel = value!;
                });
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Iniciar partida"),
                icon: const Icon(Icons.play_circle),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
