import 'package:flutter/material.dart';

import '../domain/rooldiceusecase.dart';
import '../domain/showdicepictureusecase.dart';

class RollingTwoDices extends StatefulWidget {
  const RollingTwoDices({super.key});

  @override
  State<RollingTwoDices> createState() => _RollingTwoDicesState();
}

class _RollingTwoDicesState extends State<RollingTwoDices> {
  int firstDiceValue=1;
  int secondDiceValue=1;

  var rollFirstDiceUseCase=RollDiceUseCase();
  var showFirstDicePictureUseCase=ShowDicePictureUseCase();

  var rollSecondDiceUseCase=RollDiceUseCase();
  var showSecondDicePictureUseCase=ShowDicePictureUseCase();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/${showFirstDicePictureUseCase.execute(firstDiceValue, 'first1.png', 'first2.png', 'first3.png', 'first4.png', 'first5.png', 'first6.png')}'),
                width: 100.0,
                height: 100.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              ),
              Image(
                image: AssetImage('assets/${showSecondDicePictureUseCase.execute(secondDiceValue, 'second1.png', 'second2.png', 'second3.png', 'second4.png', 'second5.png', 'second6.png')}'),
                width: 100.0,
                height: 100.0,
              ),
            ]
          ),
          Text('${firstDiceValue + secondDiceValue}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  firstDiceValue=rollFirstDiceUseCase.execute();
                  secondDiceValue=rollSecondDiceUseCase.execute();
                });
              },
              child: Text('Roll dice'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 48)
              )
          )
        ],
      ),
    );
  }
}
