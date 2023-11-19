import 'dart:math';

class GetRandomLetterUseCase{
  String? execute(String alphabetType, bool isToLowerCase, Set<String> latinAlphabet, Set<String> cyrillicAlphabet, Set<String> greekAlphabet){
    var random = Random.secure();
    switch(alphabetType){
      case 'Latin':
        if(isToLowerCase==true)
          return latinAlphabet.elementAt(random.nextInt(latinAlphabet.length)).toLowerCase();
        else
          return latinAlphabet.elementAt(random.nextInt(latinAlphabet.length));
        break;
      case 'Cyrillic':
        if(isToLowerCase==true)
          return cyrillicAlphabet.elementAt(random.nextInt(cyrillicAlphabet.length)).toLowerCase();
        else
          return cyrillicAlphabet.elementAt(random.nextInt(cyrillicAlphabet.length));
        break;
      case 'Greek':
        if(isToLowerCase==true)
          return greekAlphabet.elementAt(random.nextInt(greekAlphabet.length)).toLowerCase();
        else
          return greekAlphabet.elementAt(random.nextInt(greekAlphabet.length));
        break;
    }
  }
}