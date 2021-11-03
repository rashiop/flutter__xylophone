import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class Note extends StatelessWidget {
  const Note(this.index, {Key? key}) : super(key: key);

  final int index;

  void playSound(int index) {
    int songIndex = index + 1;
    String song = 'note$songIndex'
        '.wav';
    final player = AudioCache();
    player.play(song);
  }

  @override
  Widget build(BuildContext context) {
    List<MaterialColor> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.lightBlue,
      Colors.purple
    ];
    Color color = colors[index];

    return ElevatedButton(
        child: const Text('Press me'),
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: const Size.fromHeight(34.0),
        ),
        onPressed: () {
          playSound(index);
        });
  }
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Xylophone')),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Expanded(child: Note(0)),
              Expanded(child: Note(1)),
              Expanded(child: Note(2)),
              Expanded(child: Note(3)),
              Expanded(child: Note(4)),
              Expanded(child: Note(5)),
              Expanded(child: Note(6)),
            ],
          ),
        ),
      ),
    );
  }
}
