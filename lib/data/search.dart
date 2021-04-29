import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  //Create a constructor to get the return Search results
  Search({this.searchResult});
  final List searchResult;
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    print("Search Results ${widget.searchResult}");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search result",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: List.generate(widget.searchResult.length, (index) {
            final data = widget.searchResult[index]; // Get each returned data

            //Get All the data
            final id = data["id"];
            final name = data["name"];
            final bloodGroup = data["bloodgroup"];
            final rhesus = data["rhesus"];
            final email = data["email"];
            final phone = data["phone"];
            final state = data["state"];
            final age = data["age"];

            //REturn widget Here
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text(id),
                ),
                title: Text(name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(email),
                    Text(phone),
                  ],
                ),
                trailing: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Column(
                    children: [Text(bloodGroup), Text(rhesus)],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
