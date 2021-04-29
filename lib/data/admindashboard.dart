import 'dart:developer';
import 'package:blooddonor/data/adminserach.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';
import 'package:blooddonor/pages/Constant.dart';
import 'package:blooddonor/data/admindashboard.dart';

class Spacecrafts{
  final String id;
  final String name, email, state, age, bloodgroup, time, rhesus;

  Spacecrafts({
    this.id,
    this.name,
    this.email,
    this.state,
    this.bloodgroup,
    this.rhesus,
    this.age,
    this.time
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
      time: jsonData['time'],
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
                color: Colors.lightBlue,
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecrafts[index].name, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(1.0),
                    ),
                    //Text('|', textAlign : TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),

                  ],
                ),

              ),
              Divider(
                height: 5,
                thickness: 2,
              ),




              Container(
                color: Colors.lightBlue,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecrafts[index].state, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),







              Container(
                color: Colors.lightBlue,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecrafts[index].rhesus, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),

              Container(
                color: Colors.lightBlue,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecrafts[index].bloodgroup, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
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
                color: Colors.lightBlue,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecrafts[index].email, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    ),
                  ],
                ),
              ),

              Divider(
                height: 5,
                thickness: 2,
              ),

              /*Container(
                color: Colors.orange,
                child:  Row(
                  children: <Widget>[
                    Padding(
                      child: Text(spacecrafts[index].age, textAlign: TextAlign.end, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      padding: EdgeInsets.all(2.0),
                    )
                  ],
                ),
              ),*/


            ],
          ),
        ),
      ),


    );
  }
}





class AdminTapp extends StatefulWidget {
  @override
  _AdminTappState createState() => _AdminTappState();
}

class _AdminTappState extends State<AdminTapp> with SingleTickerProviderStateMixin<AdminTapp> {




  @override
  Widget build(BuildContext context) {

    // TODOt: implement build
    return MaterialApp(
      color: Colors.lightBlue,
      title: 'BLOOD DONOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),

      home: HomePaget(),

    );
  }
}

class HomePage extends StatefulWidget {
  List<Spacecrafts> spacecrafts;

  HomePage(this.spacecrafts);

//  final String userNamee;
//  final String diss;
//
//  HomePage({Key key, this.userNamee, this.diss}) : super(key: key);

  @override
  _HomePagetState createState() => new _HomePagetState(spacecrafts);
}


class _HomePagetState extends State<HomePaget> {
  final List<Spacecrafts> spacecrafts;

  _HomePagetState(this.spacecrafts);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: createViewItem,

    );
  }

  List<String> isSlected = [];


  Widget createViewItem(BuildContext context, int index) {
    return new ListTile(
      title: new Card(
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue)),
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.lightBlue,
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Text(
                        spacecrafts[index].name, textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}


Future<List<Spacecrafts>> downloadJSON() async {
  //String e =home.diss;
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


Future<List<Spacecrafts>> downloadJSONN() async {
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

class HomePaget extends StatefulWidget {

  final String userNamee;
  final String diss;

  HomePaget({Key key, this.userNamee, this.diss}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}



class _HomePageState extends State<HomePaget> with SingleTickerProviderStateMixin<HomePaget> {
  List<Widget> containers =[
    Container(
      child: new FutureBuilder<List<Spacecrafts>>(
          future: downloadJSON(),
          builder: (context , snapshot){
            if(snapshot.hasData){
              List<Spacecrafts> spacecrafts= snapshot.data;
              return new CustomListView(spacecrafts);
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }

            return Container(
              height: 5,
              width: 5,
              child: new Center (child: new CircularProgressIndicator(strokeWidth: 2,)),

            );
          }

      ),

    ),


    /* Container(
      child: new FutureBuilder<List<Spacecrafts>>(
          future: downloadJSON(),
          builder: (context , snapshot){
            if(snapshot.hasData){
              List<Spacecrafts> spacecrafts= snapshot.data;
              return new CustomListView(spacecrafts);
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }

            return Container(
              height: 5,
              width: 5,
              child: new Center (child: new CircularProgressIndicator(strokeWidth: 2,)),

            );
          }
      )
      ), */




  ];




  @override
  Widget build(BuildContext context ) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){

            },),
            PopupMenuButton<String>(
              onSelected: (choice)=> choiceAction(choice, context),
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),

          ],


          centerTitle: true,
          title: Text("Admin Page".toUpperCase() ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
          backgroundColor: Colors.lightBlue,
          bottom: TabBar(
            indicatorColor: Colors.cyan,

            tabs: <Widget>[
              Tab(
                child: Text(' Donors information ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,  color: Colors.white),),

              ),


            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
        //floatingActionButton:FloatingActionButton(
        //backgroundColor: Colors.lightBlue,
        //child: Icon(Icons.search, color: Colors.white,),
        // onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminsearch()));
        // },
      ) ,
      // ),




    );

  }
}
void main(){
  runApp(HomePaget());
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
  else if(choice==Constants.home){
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminsearch()));

  }
}
