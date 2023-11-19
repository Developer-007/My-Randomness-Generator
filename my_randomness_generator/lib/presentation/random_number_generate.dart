import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_randomness_generator/domain/generaterandomnumberusecase.dart';

class RandomNumberGenerate extends StatefulWidget {
  const RandomNumberGenerate({super.key});

  @override
  State<RandomNumberGenerate> createState() => _RandomNumberGenerateState();
}

class _RandomNumberGenerateState extends State<RandomNumberGenerate> {

  String min='';
  String max='';
  int randomNumder=0;

  var generateRandomNumberUseCase=GenerateRandomNumberUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random number generator'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  cursorColor: Colors.indigo,
                  style: TextStyle(
                      color: Colors.indigo,
                  ),
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
                  onChanged: (String value){
                    setState(() {
                      min=value;
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                      border: OutlineInputBorder(),
                      fillColor: Colors.indigo[200],
                      filled: true,
                      hintText: 'Min number'
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                TextField(
                  cursorColor: Colors.indigo,
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
                  onChanged: (String value){
                    setState(() {
                      max=value;
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                      border: OutlineInputBorder(),
                      fillColor: Colors.indigo[200],
                      filled: true,
                      hintText: 'Max number'
                  ),
                ),
              ],
            ),
            Text('$randomNumder', style: TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),),
            ElevatedButton(
                onPressed: () {
                  if(min==null || min=='' || max==null || max==''){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Enter max and min numbers!'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo,
                                  onPrimary: Colors.white,
                              )
                          )
                        ],
                      );
                    });
                  } else if(int.tryParse(min)! > int.tryParse(max)!){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Min must be smaller than max!'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo,
                                  onPrimary: Colors.white,
                              )
                          )
                        ],
                      );
                    });
                  } else{
                    setState(() {
                      randomNumder=generateRandomNumberUseCase.execute(min, max);
                    });
                  }
                },
                child: Text('Generate'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 48)
                )
            )
          ]
        )
      )
    );
  }
}
