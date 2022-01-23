import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:download_image_from_network_app/constants/links.dart';
import 'package:download_image_from_network_app/screens/screen-2.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> links=Links.getlinks;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(links.length, (index)=>Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
            height: 400,
            width: size.width-50,
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(links[index])));
               
               
                }, icon: Icon(Icons.fit_screen_outlined),color: Colors.white,iconSize: 40,),
                IconButton(
                  onPressed: ()async{
                  try {
                   Directory? dir= await getExternalStorageDirectory();
                   String pathasSting=dir!.path;
                   print(pathasSting);
                   List<String> folders= pathasSting.split("/");
                   String dio_download_path="";
                   for ( var i = 1 ; i<folders.length  ; i++ ){
                     final folder=folders[i];
                       if (folder!="Anddroid") {
                          dio_download_path+="/"+folder;
                       } else {
                         break;
                       }
                   }
                   dio_download_path+="/my_download_files/"+DateTime.now().toString()+".jpg";
                    Dio dio=Dio();
                    await  dio.download(links[index],dio_download_path);
                    await GallerySaver.saveImage(dio_download_path,albumName: "Xurshid files 😎");
                    print("Xurshid files 😎");
                    //   ByteData imageData1 = await rootBundle.load("assets/"+names[index]+".jpg");
                    // await ImageGallerySaver.saveImage(
                    // imageData1.buffer.asUint8List(),
                    // quality: 90,
                    // name: "footballers");

                    await Flushbar(
                      backgroundColor: Colors.blueGrey,
                      flushbarPosition: FlushbarPosition.TOP,
                      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                      title: 'download_image_from_network_app',
                      message:
                          "Network Image is saved to gallery",
                          messageSize: 17,
                          titleSize: 17,
                      duration:const Duration(seconds: 5),
                    ).show(context);
                  } catch (e) {
                    print("xatoooo:"+e.toString());
                  } 

                 
                }, icon:const Icon(Icons.file_download_rounded),color: Colors.white,iconSize: 40,),
              ],
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                 image: DecorationImage(image:NetworkImage(links[index]) ,fit: BoxFit.cover,)
            ),
        )),
          ),
          )),
    );
  }
}
