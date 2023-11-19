import 'package:flutter/material.dart';
import 'package:my_randomness_generator/presentation/rollingonedice.dart';
import 'package:my_randomness_generator/presentation/rollingtwodices.dart';

class RollingDices extends StatefulWidget {
  const RollingDices({super.key});

  @override
  State<RollingDices> createState() => _RollingDicesState();
}

class _RollingDicesState extends State<RollingDices> {

  final items = ['1 dice', '2 dices'];
  String value='1 dice';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rolling dices'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.indigo, width: 4)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    isExpanded: true,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(()=> this.value = value!),
                  ),
                )
            ),
            if(value=='1 dice')
              Expanded(
                  child: RollingOneDice()
              )
            else Expanded(
              child: RollingTwoDices()
            )

          ],
        )
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
          value: item,
          child: Text(
            item,
          ),
      );
}
