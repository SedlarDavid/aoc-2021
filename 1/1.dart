import 'dart:io';

Future<void> main() async {
  final input = new File('1/input.txt');

  partOne(input);
}

void partOne(File input) {
  final data = input
      .readAsLinesSync()
      .map((l) => int.tryParse(l))
      .toList(growable: false);

  var increaseTime = 0;

  var lastMeasurement = 0;
  for (var i = 0; i < data.length; i++) {
    final val = data[i];
    if (val == null) continue;
    if (i == 0) {
      lastMeasurement = val;
      continue;
    }
    if (val > lastMeasurement) {
      increaseTime++;
    }
    lastMeasurement = val;
    continue;
  }

  print('IC count: $increaseTime');
}
