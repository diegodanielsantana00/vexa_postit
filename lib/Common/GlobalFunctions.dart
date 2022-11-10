// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

String GetNameMonth(int month) {
  List months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
  return months[month - 1];
}

ButtonStyle styleButtonDefaut(Color? color) {
  return TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: color,
    padding: EdgeInsets.all(0),
  );
}

DateTime StringISO0081toDateTime(String dateString) {
  return DateTime.parse(dateString);
}

Color StringToColor(String colorString) {
  String valueString = colorString.split('(0x')[1].split(')')[0];
  int value = int.parse(valueString, radix: 16);
  return Color(value);
  ;
}

bool validateDateEqualDayMothYears(
  DateTime dateOne,
  DateTime dateTwo,
) {
  return dateOne.day == dateTwo.day && dateOne.month == dateTwo.month && dateOne.year == dateTwo.year;
}

void RestartScreenHotRestart(BuildContext context) {
  (context as Element).reassemble();
}

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Future<String> GetVersion() async {
  var file = await rootBundle.loadString("pubspec.yaml");
  var yaml = loadYaml(file);
  return yaml["version"];
}

Widget widgetVersionText() {
  return FutureBuilder<String>(
    future: GetVersion(),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      if (snapshot.hasData) {
        return Text("Versão: ${snapshot.data?.split('+')[0]}");
      } else if (snapshot.hasError) {
        return SizedBox();
      } else {
        return SizedBox();
      }
    },
  );
}
