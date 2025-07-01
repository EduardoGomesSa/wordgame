import 'package:flutter/material.dart';

class StartGameModal extends StatefulWidget {
  const StartGameModal({super.key});

  @override
  State<StartGameModal> createState() => _StartGameModalState();
}

class _StartGameModalState extends State<StartGameModal> {
  String? selectedLevel;
  final List<String> levels = ['Fácil', 'Médio', 'Difícil'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          const Text("Escolha o nível"),
          const SizedBox(height: 8),
          DropdownButton<String>(
            isExpanded: true,
            value: selectedLevel,
            hint: const Text("Selecione"),
            items: levels.map((level){
              return DropdownMenuItem<String>(
                value: level,
                child: Text(level),);
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedLevel = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
