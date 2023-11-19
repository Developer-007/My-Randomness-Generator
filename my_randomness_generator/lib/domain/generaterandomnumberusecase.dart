import 'dart:math';

class GenerateRandomNumberUseCase{
  int execute(String minNumber, String maxNumber){
    var random = Random.secure();
    int randomNumber = int.tryParse(minNumber)! + random.nextInt(int.tryParse(maxNumber)!-int.tryParse(minNumber)! +1);
    return randomNumber;
  }
}