import 'dart:io';

Future<void> main() async {
  final input = new File('2/input.txt');

  partOne(input);
  partTwo(input);
}

void partOne(File input) {
  final data = input.readAsLinesSync().map((l) {
    final split = l.split(' ');
    final course = split.first;
    final value = int.tryParse(split.last) ?? 0;
    return MapEntry<String, int>(course, value);
  }).toList(growable: false);

  int f = 0;
  int d = 0;

  for (var i = 0; i < data.length; i++) {
    final entry = data[i];

    switch (entry.key) {
      case 'forward':
        f += entry.value;
        break;
      case 'up':
        d -= entry.value;
        break;
      case 'down':
        d += entry.value;
        break;
      default:
        break;
    }
  }

  final position = f * d;

  print('F: $f, D: $f, POSITION: $position');
}

void partTwo(File input) {
  final data = input.readAsLinesSync().map((l) {
    final split = l.split(' ');
    final course = split.first;
    final value = int.tryParse(split.last) ?? 0;
    return MapEntry<String, int>(course, value);
  }).toList(growable: false);

  int f = 0;
  int d = 0;
  int aim = 0;

  for (var i = 0; i < data.length; i++) {
    final entry = data[i];

    switch (entry.key) {
      case 'forward':
        f += entry.value;
        break;
      case 'up':
        //  d -= entry.value;
        break;
      case 'down':
        aim += entry.value;
        // d += entry.value;
        break;
      default:
        break;
    }
  }

  final position = f * d;

  print('F: $f, D: $f, POSITION: $position');
}
