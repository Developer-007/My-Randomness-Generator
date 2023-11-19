import 'package:flutter/material.dart';
import 'package:my_randomness_generator/presentation/rolling_dices.dart';
import 'package:my_randomness_generator/presentation/yesorno.dart';
import 'letters.dart';
import 'main_page.dart';
import 'random_number_generate.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.indigo),
  initialRoute: '/',
  routes: {
    '/': (context) => MainPage(),
    '/randomnumber': (context) => RandomNumberGenerate(),
    '/rollingdices': (context) => RollingDices(),
    '/yesorno': (context) => YesOrNo(),
    '/letters': (context) => Letters()
  },
));

