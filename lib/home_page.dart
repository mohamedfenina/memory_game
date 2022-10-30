import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_game/utils/game_logics.dart';
import 'package:memory_game/widgets/score_bord.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game _game = Game();
  int tries = 0  ;
  int score = 0 ;
   bool _enabled = true;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _game.initGame();
    _game.cards_list.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;



    return Scaffold(
      backgroundColor: Color(0xFFe55870),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(
            child: Text('Memory Game',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
              color: Colors.white
            ),),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ScoreBord('Tries', '${tries}'),
              ScoreBord("Score", "${score}"),
            ],
          ),
          SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: GridView.builder(
    padding: EdgeInsets.all(16),
              itemCount: _game.gameImg?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
    itemBuilder: (context,index)=>
        GestureDetector(
          onTap: (){

              print(_game.cards_list[index]);
              setState(() {


                _game.gameImg![index] = _game.cards_list[index];
                _game.matchCheck.add({index:_game.cards_list[index]});
                if(_game.matchCheck.length == 2){
                  tries++;
                  if(_game.matchCheck[0].values.first == _game.matchCheck[1].values.first ) {
                    print("true");
                    score+=100;

                    _game.matchCheck.clear();

                  }else{
                    print("false");
                    Future.delayed(Duration(milliseconds: 500),(){
                      print(_game.gameImg);
                      setState(() {
                        _game.gameImg![_game.matchCheck[0].keys.first] = _game.hiddenCardPath;
                        _game.gameImg![_game.matchCheck[1].keys.first] = _game.hiddenCardPath;
                        _game.matchCheck.clear();
                      });
                    });


                  }

                }

              });









    },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFB46A),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage(_game.gameImg![index]),
              fit: BoxFit.cover,


    ),),

            ),



    ),
        )
              
            ),


        ],
      ),

    );
  }
}
