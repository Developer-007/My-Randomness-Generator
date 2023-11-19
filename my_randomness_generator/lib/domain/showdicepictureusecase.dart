class ShowDicePictureUseCase{
  String? execute(
      int value,
      String firstPic,
      String secondPic,
      String thirdPic,
      String fourthPic,
      String fithPic,
      String sixthPic,
      ){
    switch(value){
      case 1:
        return firstPic;
        break;
      case 2:
        return secondPic;
        break;
      case 3:
        return thirdPic;
        break;
      case 4:
        return fourthPic;
        break;
      case 5:
        return fithPic;
        break;
      case 6:
        return sixthPic;
        break;
    }
  }
}