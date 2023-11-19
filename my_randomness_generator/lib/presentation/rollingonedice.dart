import 'package:flutter/material.dart';
import 'package:my_randomness_generator/domain/rooldiceusecase.dart';
import 'package:my_randomness_generator/domain/showdicepictureusecase.dart';

class RollingOneDice extends StatefulWidget {
  const RollingOneDice({super.key});

  @override
  State<RollingOneDice> createState() => _RollingOneDiceState();
}

class _RollingOneDiceState extends State<RollingOneDice> {
  var rollDiceUseCase=RollDiceUseCase();
  var showDicePictureUseCase=ShowDicePictureUseCase();
  int diceValue=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage('assets/${showDicePictureUseCase.execute(diceValue, 'first1.png', 'first2.png', 'first3.png', 'first4.png', 'first5.png', 'first6.png')}'),
            width: 100.0,
            height: 100.0,
          ),
          Text('$diceValue', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  diceValue=rollDiceUseCase.execute();
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
