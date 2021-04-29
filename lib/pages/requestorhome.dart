import 'dart:developer';

import 'package:blooddonor/data/admindashboard.dart';
import 'package:blooddonor/data/requester.dart';
import 'package:blooddonor/pages//homepages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:blooddonor/pages/Constant.dart';
import '../data/loginn.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';
import 'package:blooddonor/pages/requesterserach.dart';







class Spacecraf{
  final String id;

  final String name, img, body, date, state, cat;
  Spacecraf({
    this.id,
    this.name,
    this.body,
    this.date,
    this.img,
    this.state,
    this.cat,

  });


  factory Spacecraf.fromJson(Map<String, dynamic> jsonData){

    return Spacecraf(
      id: jsonData['id'],
      name: jsonData['name'],
      body: jsonData['body'],
      date: jsonData['date'],
      state:jsonData['state'],
      cat:jsonData['cat'],
      img:  "https://upnepa.com.ng/media/"+ jsonData['img'],


    );

  }

}



class CustomListView extends StatefulWidget {
  //with NavigationStates {
  List<Spacecrafts> spacecrafts;
  CustomListView(this.spacecrafts);

  @override
  CustomListViewState createState() => new CustomListViewState(spacecrafts);

}

class CustomListViewState extends State<CustomListView> {


  int _counter = 0;


  final List<Spacecrafts> spacecrafts;
  CustomListViewState(this.spacecrafts);

  Widget build(BuildContext context ) {
    return ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: createViewItem,

      // return createViewItem(spacecrafts[currentIndex], context);

    );
  }




  List<String> isSelected =[];


  Widget createViewItem (BuildContext context,  int index){
    return new ListTile(
      title: new Card(
        elevation: 8.0,
        child: Container(

          decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Text('Name', textAlign: TextAlign.left, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(1.2),
                    ),
                    SizedBox(width: 100,),
                    //Text('|', textAlign : TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Padding(
                      child: Text('Cat', textAlign: TextAlign.right, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    ),

                  ],
                ),

              ),
              Container(
                color: Colors.redAccent,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text('State', textAlign: TextAlign.left, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(1.2),
                    ),
                    SizedBox(width: 100,),
                    Padding(
                      child: Text('Date', textAlign: TextAlign.end, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),

              Container(

                  child: Text(
                    "Blood", maxLines: 2, overflow: TextOverflow.ellipsis, style: new TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    // textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.justify,
                  )
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(

                          icon: new Icon(Icons.message, color:Colors.orange),
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: (){
                            setState(() {
                              //spacecrafts[index] = spacecrafts[index];
                            });

                          },
                        ),
                        IconButton(
                          icon: new Icon(Icons.loop, color: Colors.red),
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: (){},

                        ),

                        IconButton(
                          icon: new Icon(isSelected.contains(spacecrafts[index].id)? Icons.lightbulb_outline: Icons.highlight,  color: isSelected.contains(spacecrafts[index].id)? Colors.cyan : Colors.orange,),
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: (){
                            isSelected.add(spacecrafts[index].id);
                            setState(() {
                              _counter=_counter+1;
                            });
                          },

                        ),
                        Text('$_counter', style: TextStyle(fontWeight: FontWeight.bold),),
                        IconButton(
                          icon: new Icon(isSelected.contains(spacecrafts[index].id)? Icons.highlight: Icons.lightbulb_outline,  color: isSelected.contains(spacecrafts[index].id)? Colors.cyan : Colors.orange,),
                          alignment: Alignment.center,
                          padding: new EdgeInsets.all(2.0),
                          onPressed: (){
                            isSelected.add(spacecrafts[index].id);
                            setState(() {
                              _counter=_counter-1;
                            });
                          },
                        ),
                      ]
                  )
              ),
            ],
          ),
        ),
      ),

    );
  }
}



class Spacecrafs{
  final String id;
  final String title, img, news, date , disco;
  Spacecrafs({
    this.id,
    this.title,
    this.news,
    this.date,
    this.img,
    this.disco

  });


  factory Spacecrafs.fromJson(Map<String, dynamic> jsonData){

    return Spacecrafs(
      id: jsonData['id'],
      title: jsonData['title'],
      news: jsonData['news'],
      date: jsonData['date'],
      disco:jsonData['disco'],
      img:  "https://upnepa.com.ng/media/"+ jsonData['img'],

    );

  }

}
class CustomListViews extends StatelessWidget {//with NavigationStates {
  final List<Spacecrafs> spacecrafts;
  CustomListViews(this.spacecrafts);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: spacecrafts.length,
        itemBuilder: (context, int currentIndex){
          return createViewItem(spacecrafts[currentIndex], context);
        }
    );
  }


  Widget createViewItem (Spacecrafs spacecraft, BuildContext context){
    return new ListTile(
      title: new Card(
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.lightBlue,
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Text('Good', maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(0.2),
                    ),


                  ],
                ),

              ),
              Container(
                color: Colors.redAccent,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text('State', textAlign: TextAlign.left, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(1.2),
                    ),
                    SizedBox(width: 100,),
                    Padding(
                      child: Text('Date', textAlign: TextAlign.end, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),



            ],
          ),
        ),
      ),
    );
  }
}


class Spacecrafts{
  final String id;
  final String name, email, state, age, bloodgroup, phone, rhesus;

  Spacecrafts({
    this.id,
    this.name,
    this.bloodgroup,
    this.rhesus,
    this.email,
    this.phone,
    this.state,
    this.age,

  });



  factory Spacecrafts.fromJson(Map<String , dynamic> jsonData){
    return Spacecrafts(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      state: jsonData['state'],
      bloodgroup: jsonData['bloodgroup'],
      rhesus: jsonData['rhesus'],
      age: jsonData['age'],
      phone: jsonData['phone'],
    );
  }

}

class CustomListViewe extends StatelessWidget {//with NavigationStates {
  final List<Spacecrafts> spacecraft;
  CustomListViewe(this.spacecraft);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spacecraft.length,
      itemBuilder: createViewItem,
      //return createViewItem(spacecraft[currentIndex], context);

    );
  }


  Widget createViewItem (BuildContext context,  int index){
    return new ListTile(
      title: new Card(
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[

              Container(
                color: Colors.red,
                child:  Row(
                  children: <Widget>[

                    Padding(
                      child: Text(spacecraft[index].name, textAlign: TextAlign.end, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(4.0),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),


              Container(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecraft[index].state, maxLines: 3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(4.0),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),


              /*Container(
                color: Colors.redAccent,
                child:  Row(
                  children: <Widget>[

                    Padding(
                      child: Text(spacecraft[index].age, textAlign: TextAlign.end, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(4.0),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),*/

              Container(
                color: Colors.red,
                child:  Row(
                  children: <Widget>[

                    Padding(
                      child: Text(spacecraft[index].bloodgroup, textAlign: TextAlign.end, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(4.0),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),

              Container(
                color: Colors.red,
                child:  Row(
                  children: <Widget>[

                    Padding(
                      child: Text(spacecraft[index].rhesus, textAlign: TextAlign.end, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(4.0),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),

              Container(
                color: Colors.red,

                child:  Row(

                  children: <Widget>[

                    Padding(
                      child: Text(spacecraft[index].email, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    ),
                  ],
                ),

              ),



            ],
          ),
        ),
      ),
    );
  }
}


Future<List<Spacecrafts>> downloadJSONtips() async {
  //String e =home.diss;
  final url="https://blood.upnepa.com.ng/blood/index.php";
  final response = await get(url);

  if (response.statusCode == 200) {
    List spacecrafts = json.decode(response.body);
    return spacecrafts.map((spacecrafts) =>
    new Spacecrafts.fromJson(spacecrafts)).toList();
  } else {
    throw Exception("Unable to download from json");
  }
}






//Future<List<Spacecrafs>> downloadsJSONnews() async {
//  //String e =home.diss;
//  final url="https://upnepa.com.ng/news.php";
//  final response = await get(url);
//
//  if (response.statusCode == 200) {
//    List spacecrafs = json.decode(response.body);
//    return spacecrafs.map((spacecrafs) =>
//    new Spacecrafs.fromJson(spacecrafs)).toList();
//  } else {
//    throw Exception("Unable to download from json");
//  }
//}







class Requestor extends StatefulWidget {
//  final String userNamee;
//  final String diss;
//
//  TabApp({Key key, this.userNamee, this.diss}) : super(key: key);

  @override
  _RequestorState createState() => _RequestorState();
}

class _RequestorState extends State<Requestor> with SingleTickerProviderStateMixin<Requestor> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.orange,
      title: 'BLOOD REQUESTER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),

      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {

  final String userNamee;
  final String diss;

  HomePage({Key key, this.userNamee, this.diss}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}


//Future<List<Spacecrafts>> downloadJSON() async {
//  //String e =home.diss;
//  final url="https://upnepa.com.ng/image.php?disco=abuja";
// // final response = await get(url);
//
//  if (response.statusCode == 200) {
//    List spacecrafts = json.decode(response.body);
//    return spacecrafts.map((spacecrafts) =>
//    new Spacecrafts.fromJson(spacecrafts)).toList();
//  } else {
//    throw Exception("Unable to download from json");
//  }
//}



class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Text('BLOOD REQUESTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),);
  List<Widget> containers =[
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bc.jpg"), fit: BoxFit.cover,),
      ),
      child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[

                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Text(' INSTRUCTIONS ', textAlign: TextAlign.center,  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white
                  ),),

                  Divider(
                    color: Colors.white,
                    height: 30,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),

                  Text('Step 1 : Turn ON your phone Location',   style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white
                  ),),
                  Divider(
                    color: Colors.white,
                    height: 30,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),

                  Text('Step 2 : Click on the search icon below to search for blood donor ',   style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white
                  ),),
                  Divider(
                    color: Colors.white,
                    height: 30,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),

                  Text('Step 3 : Found a blood donor?... If yes, send a notification . If no, repeat step two ',   style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white
                  ),),
                  Divider(
                    color: Colors.white,
                    height: 30,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),

                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ]
      ),
    ),

    Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bc.jpg"), fit: BoxFit.cover,),
        ),
        child: new FutureBuilder<List<Spacecrafs>>(
          // future: downloadsJSONnews(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                List<Spacecrafs> spacecrafs= snapshot.data;
                return new CustomListViews(spacecrafs);
              }
              else if(snapshot.hasError){
                return Text('${snapshot.error}');
              }
              return Center(
                child: Container(
                  height: 10,
                  width: 10,
                  child:CircularProgressIndicator(
                    backgroundColor: Colors.cyanAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  ) ,
                ),
              );
            }
        )
    ),


    Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bc.jpg"), fit: BoxFit.cover,),
        ),

        child: new FutureBuilder<List<Spacecrafts>>(

            future: downloadJSONtips(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                List<Spacecrafts> spacecraf= snapshot.data;
                return new CustomListViewe(spacecraf);
              }
              else if(snapshot.hasError){
                return Text('${snapshot.error}');
              }
              return Center(
                child: Container(
                  height: 10,
                  width: 10,
                  child:CircularProgressIndicator(
                    backgroundColor: Colors.cyanAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  ) ,
                ),
              );
            }
        )
    ),
  ];


  @override
  Widget build(BuildContext context ) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Requester()));
                  }),
              actions: <Widget>[
//            IconButton(icon: Icon(Icons.search), onPressed: (){
//
//            },),
//            PopupMenuButton<String>(
//              onSelected: (choice)=> choiceAction(choice, context),
//              itemBuilder: (BuildContext context){
//                return Constants.choices.map((String choice){
//                  return PopupMenuItem<String>(
//                    value: choice,
//                    child: Text(choice),
//                  );
//                }).toList();
//              },
//            ),

              ],


              centerTitle: true,
              title: Text("BLOOD REQUESTER".toUpperCase() ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
              backgroundColor: Colors.red,
              bottom: TabBar(
                indicatorColor: Colors.cyan,

                tabs: <Widget>[

                  Tab(
                    child: Text('Tips', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),

                  ),

                  Tab(
                    child: Text('Get Notice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),

                  ),

                  Tab(
                    child: Text('Donors', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  ),

                ],
              ),
            ),
            body: TabBarView(
              children: containers,
            ),

            floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  FloatingActionButton(
                    child: Icon(
                        Icons.search , color: Colors.white, size: 38

                    ),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Requestersearch()));
                    },
                    heroTag: null,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  /* FloatingActionButton(
                  child: Icon(
                      Icons.touch_app, color: Colors.white,
                  ),
                  onPressed: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>Requestor()));
                  },
                  heroTag: null,
                ), */

                ]
            )
        )
    );

  }
}

void main(){
  runApp(Requestor());
}

void choiceAction(String choice, BuildContext context){
  if(choice==Constants.News){
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyInbox()));

  }else if(choice==Constants.Technician){
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTech()));

  }

  else if(choice==Constants.Consumption){
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrdersPage()));

  }
  else if(choice==Constants.Power){
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccountPage()));

  }
}