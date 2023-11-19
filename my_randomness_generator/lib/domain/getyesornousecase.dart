import 'dart:math';

class GetYesOrNoUseCase{
  String execute(List<String> answers){
    var random = Random.secure();
    int i = 0 + random.nextInt(1-0+1);
    return answers[i];
  }
}