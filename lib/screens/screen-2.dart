import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String link;
  Screen2(this.link);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
            body:
              
              Container(
                padding:const EdgeInsets.all(40),
                width: size.width,
                height: size.height,
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon:const Icon(Icons.arrow_back_ios_new_rounded,),color: Colors.white,iconSize: 30,),
                   const Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)
                  ],
                ),
                decoration:  BoxDecoration(
         image: DecorationImage(image:NetworkImage(link) ,fit: BoxFit.fitHeight,)
    ),
              
            ),);
  }
}