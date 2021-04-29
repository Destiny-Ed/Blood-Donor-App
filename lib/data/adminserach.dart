/*import 'dart:async';
import 'dart:convert';
import 'package:blooddonor/data/welcome.dart';
import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;
import 'package:blooddonor/data/admindashboard.dart';
import 'package:blooddonor/data/search.dart';

void main() => runApp(Adminsearch());

class Adminsearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donor',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override

  _MyHomePageState createState() => _MyHomePageState();
}
final locationController= TextEditingController();
class _MyHomePageState extends State<MyHomePage> {
  @override

  bool visible=false;

  var selectedCurrency, selectedType, bloodtype, rhesustype;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _accountType = <String>[
   /* 'Abia',
    'Adamawa',
    'Akwa ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Abuja',
    'Benue',
    'Borno',
    'Cross river',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kano',
    'Katsina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nasarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'River',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara', */

  ];

  List<String> _bloodgroup = <String>[
    'A+',
    'O+',
    'O-',
    'AB',
  ];

  List<String> _rhesus = <String>[
    'Rh+',
    'Rh-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePaget()));

              }),
          title: Container(
            alignment: Alignment.center,
            child: Text("ADMIN DASHBOARD",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          actions: <Widget>[

          ],
        ),
        body: Container( decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("white"),fit: BoxFit.cover,
          ),
        ),
          key: _formKeyValue,
          //autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(height: 70.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_hospital,
                      size: 25.0,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 50.0),
                    DropdownButton(
                        items: _bloodgroup
                            .map((value) =>
                            DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                              value: value,
                            ))
                            .toList(),
                        onChanged: (selectedAccountType) {
                          print('$selectedAccountType');
                          setState(() {
                            bloodtype = selectedAccountType;
                          });
                        },
                        value: bloodtype,
                        isExpanded: false,
                        hint: Text(
                          'Choose Your Blood Group',
                          style: TextStyle(color: Colors.lightBlue,
                          ),
                        )
                    )]
              ),
              SizedBox(height: 10.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_hospital,
                      size: 25.0,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 50.0),
                    DropdownButton(
                        items: _rhesus
                            .map((value) =>
                            DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                              value: value,
                            ))
                            .toList(),
                        onChanged: (selectedAccountType) {
                          print('$selectedAccountType');
                          setState(() {
                            rhesustype = selectedAccountType;
                          });
                        },
                        value: rhesustype,
                        isExpanded: false,
                        hint: Text(
                          'Choose Your Rhesus Factor',
                          style: TextStyle(color: Colors.lightBlue,
                          ),
                        )
                    )]
              ),
              SizedBox(
                height: 10.0,
              ),
             /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_searching,
                      size: 25.0,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(width: 50.0),
                    DropdownButton(
                        items: _accountType
                            .map((value) =>
                            DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                              value: value,
                            ))
                            .toList(),
                        onChanged: (selectedAccountType) {
                          print('$selectedAccountType');
                          setState(() {
                            selectedType = selectedAccountType;
                          });
                        },
                        value: selectedType,
                        isExpanded: false,
                        hint: Text(
                          'Choose Your State of Resident',
                          style: TextStyle(color: Colors.lightBlue,
                          ),
                        )
                    )]
              ),



              SizedBox(
                height: 40.0,
              ), */

              new TextFormField(
                  cursorColor: Colors.lightBlue,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter requester location';

                    }
                    return null;

                  },
                  controller: locationController,
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.location_searching,
                      color: Colors.lightBlue,
                    ),
                    //hintText: "Location",
                    labelText: '   Enter the requester location to search',
                     /* labelStyle: TextStyle(
                          color: Colors.lightBlue
                      ), */
                     focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                       color: Colors.lightBlue )),
                    border: OutlineInputBorder(
                        borderSide: BorderSide()
                    ),
                  ),
                  keyboardType: TextInputType.text
              ),

              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("SEARCH", style: TextStyle(fontSize: 24.0)),
                            ],
                          )),
                      onPressed: getData,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),


                ],
              ),
            ],
          ),
        ));
  }
  Future getData(){

    setState(() {

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
    });

//    String destate=selectedType.toString();
//    String blood=bloodtype.toString();
//    String rhesus=rhesustype.toString();
//    var url='https://upnepa.com.ng/blood/bloodreg.php';
//    var data={'bloodgroup':blood, 'rhesus':rhesus};
//   var response= await http.post(url, body: json.encode(data));
//
//    var message = jsonDecode(response.body);
//    if(response.statusCode==200){
//      setState(() {
//        visible=false;
//      });
//    }
//    else{
//
//    }

//    showDialog(
//        context: context,
//        builder: (BuildContext context){
//          return AlertDialog(
//            title: new Text(message),
//            actions: <Widget>[
//              FlatButton(
//                  child: new Text("OK"),
//                  onPressed: (){
//                    Navigator.of(context).pop();
//                  }
//              )
//            ],
//          );
//        }
//    );


  }
}
*/