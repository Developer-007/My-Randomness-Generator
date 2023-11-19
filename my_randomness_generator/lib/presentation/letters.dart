import 'package:flutter/material.dart';
import 'package:my_randomness_generator/domain/getrandomletterusecase.dart';

class Letters extends StatefulWidget {
  const Letters({super.key});

  @override
  State<Letters> createState() => _LettersState();
}

class _LettersState extends State<Letters> {
  var getRandomLetterUseCase=GetRandomLetterUseCase();
  String letter='';
  bool isChecked=false;
  String alphValue='Latin';
  final alphItems = ['Latin', 'Cyrillic', 'Greek'];
  Set<String> latinAlpabet={'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
  Set<String> cyrillicAlpabet={'А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','K','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я'};
  Set<String> greekAlpabet={'Α','Β','Γ','Δ','Ε','Ζ','Η','Θ','Ι','Κ','Λ','Μ','Ν','Ξ','Ο','Π','Ρ','Σ','Τ','Υ','Φ','Χ','Ψ','Ω'};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Letters'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text('Alphabet:', style: TextStyle(fontSize: 20)),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.indigo, width: 4)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: alphValue,
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    isExpanded: true,
                    items: alphItems.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(()=> this.alphValue = value!),
                  ),
                )
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              activeColor: Colors.indigo,
                              onChanged: (bool? value){
                                setState(() {
                                  isChecked=value!;
                                });
                              }),
                          Text('To lower case'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('$letter', style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              letter=getRandomLetterUseCase.execute(alphValue, isChecked, latinAlpabet, cyrillicAlpabet, greekAlpabet)!;
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
                  )
              ),
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