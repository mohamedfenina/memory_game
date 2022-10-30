import 'dart:math';

class Game{
  final String hiddenCardPath = "assets/hidden.png";
  List<String>? gameImg;
  final int cardCount = 8 ;

final List<String> cards_list = [
  "assets/heart.png",
  "assets/new-moon.png",
  "assets/star.png",
  "assets/triangle.png",
  "assets/heart.png",
  "assets/new-moon.png",
  "assets/star.png",
  "assets/triangle.png",
];











List<Map<int,String>> matchCheck = [];



  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);

  }

}