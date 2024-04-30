import 'dart:convert';
import 'dart:io';

class utils {

  static String lerString(String text) {

    print(text);
    return lerConsole();

  }

  static String lerConsole() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    
    var value = lerConsole();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? lerConsolDouble(String text){

    print(text);
    return lerDouble();

  }

}
