import 'dart:io';

Future<void> main() async {
  final input = new File('3/input.txt');

  partOne(input);
}

void partOne(File input) {
  final data = input.readAsLinesSync();

  final countOfBits = data.first.length;

  final gama = <int>[];
  final epsilon = <int>[];

//Step trough bits e.g [ 0 0 1 0 0 ]
  for (var i = 0; i < countOfBits; i++) {
    //Step trough each line and its bit
    var countOfZero = 0;
    var countOfOne = 0;
    for (var j = 0; j < data.length; j++) {
      final bitOfLine = int.tryParse(data[j][i]);
      if (bitOfLine == 0) {
        countOfZero++;
      } else {
        countOfOne++;
      }
    }
    if (countOfZero > countOfOne) {
      gama.add(0);
      epsilon.add(1);
    } else {
      gama.add(1);
      epsilon.add(0);
    }
  }

  final gamaDecimal = int.tryParse(gama.join(), radix: 2) ?? 1;
  final epsilonDecimal = int.tryParse(epsilon.join(), radix: 2) ?? 1;
  final power = gamaDecimal * epsilonDecimal;

  print('GAMA: $gamaDecimal, EPSILON: $epsilonDecimal, POWER: $power ');
}
