import 'package:flutter/material.dart';
import 'package:my_randomness_generator/domain/getyesornousecase.dart';

class YesOrNo extends StatefulWidget {
  const YesOrNo({super.key});

  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {
  List<String> answers = ['Yes', 'No'];
  String answer='';
  var getYesOrNoUseCase=GetYesOrNoUseCase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yes or No'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Press Generate to generate an answer', style: TextStyle(fontSize: 30, color: Colors.indigo), textAlign: TextAlign.center),
            Text('$answer', style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    answer=getYesOrNoUseCase.execute(answers);
                  });
                },
                child: Text('Generate'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 48)
                )
            )
          ],
        ),
      )
    );
  }
}
