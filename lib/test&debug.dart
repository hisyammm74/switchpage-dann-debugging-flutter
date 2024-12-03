import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_test/flutter_test.dart';


int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

void main() {

  var logger = Logger();
  logger.d('Pesan debug');
  logger.i('Pesan info');
  logger.w('Pesan peringatan');
  logger.e('Pesan error');
  logger.e('FATAL: Pesan fatal (simulasi fatal)');

  try {
    throw Exception('Simulasi error');
  } catch (e) {
    logger.e('Terjadi pengecualian: $e');
  }

  runApp(MyApp());


  test('Test add function', () {
    expect(add(1, 2), equals(3));
    expect(add(0, 0), equals(0));
    expect(add(-1, 1), equals(0));
  });

  test('Test subtract function', () {
    expect(subtract(3, 1), equals(2));
    expect(subtract(0, 0), equals(0));
    expect(subtract(-1, 1), equals(-2));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Logger Example')),
        body: Center(child: Text('Lihat output log di terminal')),
      ),
    );
  }
}
