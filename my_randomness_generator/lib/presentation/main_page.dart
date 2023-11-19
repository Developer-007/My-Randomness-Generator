import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_randomness_generator/presentation/carditem.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Randomness generator'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: /*Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ]
      ),*/
      ListView(
        children: [
          CardItem(title: 'Generate random number', route: '/randomnumber', image: 'randomnumber.png'),
          CardItem(title: 'Rolling dices', route: '/rollingdices', image: 'rollingdices.png'),
          CardItem(title: 'Yes or No', route: '/yesorno', image: 'yesorno.png'),
          CardItem(title: 'Letters', route: '/letters', image: 'alphabet.png'),
        ],
      )
    );
  }
}

