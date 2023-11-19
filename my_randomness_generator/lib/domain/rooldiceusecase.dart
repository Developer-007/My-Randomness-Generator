import 'dart:math';

class RollDiceUseCase{
  int execute(){
    var random = Random.secure();
    int randomValue = 1 + random.nextInt(6-1+1);
    return randomValue;
  }
}