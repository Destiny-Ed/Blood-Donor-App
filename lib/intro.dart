import 'dart:io';
import 'package:flutter/material.dart';

import 'package:blooddonor/data/data.dart';
import 'package:blooddonor/data/welcome.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Blood Donor",

      home:Home(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState()=>_HomeState();
}

class _HomeState extends State<Home>{
  List<SliderModel> slides= new List<SliderModel>();
  int currentIndex=0;
  PageController pageController= new PageController(initialPage: 0);

  @override
  void initState(){
    super.initState();
    slides=getSlides();

  }

  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 :6.0,
      width: isCurrentPage ? 10.0: 6.0,
      decoration: BoxDecoration(

          color: isCurrentPage? Colors.black:Colors.grey[300],
          borderRadius: BorderRadius.circular(12)
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body:PageView.builder(
            controller: pageController,
            itemCount: slides.length,

            onPageChanged: (val){
              setState(() {
                currentIndex=val;
              });
            },
            itemBuilder:(context, index){
              return SliderTile(
                imageAssetPath:slides[index].getImageAssetPath(),
                imageAssetPat:slides[index].getImageAssetPat(),
                title:slides[index].getTitle(),
                desc:slides[index].getDesc(),
                des:slides[index].getDes(),
                dec:slides[index].getDec(),

              );
            }),
        bottomSheet: currentIndex != slides.length-1?

        Container(
          height: Platform.isAndroid ? 70: 60,
          color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  pageController.animateToPage(slides.length-1, duration: Duration(milliseconds: 200), curve: Curves.linear);
                },
                child: Text("SKIP", style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                    fontSize: 18,

                ),),
              ),
              Row(
                children: <Widget>[
                  for(int i=0; i< slides.length; i++) currentIndex== i ?pageIndexIndicator(true): pageIndexIndicator(false)
                ],
              ),
              GestureDetector(
                onTap: (){
                  pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 200), curve: Curves.linear);
                },
                child: Text("NEXT", style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 18,

                ),),
              ),
            ],
          ),
        ):
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: Platform.isAndroid ? 70:60,
          color: Colors.red,
          child: RaisedButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("GET STARTED".toUpperCase(), style: TextStyle(fontSize: 20.0)),
                    ],
                  )),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),

        )
    );


  }
}

class SliderTile extends StatelessWidget{
  String imageAssetPath,title,desc, imageAssetPat, des, dec;
  SliderTile({this.imageAssetPath, this.title, this.desc, this.imageAssetPat, this.dec, this.des});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bc.jpg"),fit: BoxFit.cover,),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath, height: 160,),
          //Image.asset(imageAssetPat, height: 22,),
          Text(title, textAlign: TextAlign.center, style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w700
          ),),
          Divider(
            color: Colors.white,
            height: 3,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(height: 4,),
          Text(desc, textAlign: TextAlign.center, style:TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 23
          ),),
          SizedBox(height: 2,),
          Divider(
            color: Colors.white,
            height: 3,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          Text(des, textAlign: TextAlign.center, style:TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 20
          ),),
          SizedBox(height: 2,),
          Divider(
            color: Colors.white,
            height: 3,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          Text(dec, textAlign: TextAlign.center, style:TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 20
          ),)
        ],
      ),
    );
  }
}