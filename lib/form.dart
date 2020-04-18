import 'package:flutter/material.dart';
import 'package:slap/fav_tab.dart';
import 'dart:math';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/jar.json');
}



TextEditingController jartitle = new TextEditingController();
String element = "default";
Random rnd = new Random();

class form extends StatefulWidget {
  final Color color;
  final JarNumber jarNumber;

  const form(Color white, {Key key, this.color, @required this.jarNumber}) : super(key: key);
  _ListViewClickListenerState createState() => _ListViewClickListenerState();

}

class _ListViewClickListenerState extends State<form> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _listViewData = [];

  @override
  void initState() {
    super.initState();

    // use this
    loadData();
  }

  loadData()async{
    int num = widget.jarNumber.index;
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    print( jsonResponse[0]['options'][0]['name'].length);
    for(int i = 0; i< jsonResponse[0]['options'][num]['paper'].length ; i++) {
      print(jsonResponse[0]['options'][num]['paper'][i]);
      _listViewData.add(jsonResponse[0]['options'][num]['paper'][i]);
    }
    //print('printing from json file');
    //refresh the page
    return (context as Element).reassemble();
  }

  void pickingpoison() {
    element = (_listViewData..shuffle()).first;
    return print(element); // e.g. 'illaoi'
  }

  void addjar() {
    TextEditingController newjartitle = jartitle;
    //save jartitle to _listViewData
    _listViewData.add(newjartitle.text);
    (context as Element).reassemble();
    print(_listViewData);
    Navigator.of(context, rootNavigator: true).pop('dialog');
    jartitle = new TextEditingController();
    return print(jartitle.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('assets'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'reroll',
            onPressed: () {
              pickingpoison();
              //print('pressed asset button');
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                          content: Text(
                            (element.toString()),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ));
                    },
                  );
            },
          ),
          /**IconButton(
            icon: const Icon(Icons.file_upload),
            tooltip: 'load data',
            onPressed: () {
              loadData();
              //print('pressed asset button');
            },
          ),*/
        ],

      ),

      body: ListView.builder(
        itemCount: _listViewData.length,
        itemBuilder: (context, index) {
          final item = _listViewData[index];


          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                _listViewData.removeAt(index);

              });
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },

            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red,),
            child: ListTile(title: Text('$item')),

          );

        },

      ),




      floatingActionButton: FloatingActionButton(

        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration:
                            new InputDecoration(labelText: "title of jar"),
                            controller: jartitle,
                          ),
                        ),
                        RaisedButton(
                          child: Text("add jar"),
                          onPressed: addjar,
                          color: Colors.black,
                          textColor: Colors.yellow,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          splashColor: Colors.grey,
                        ),

                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),tooltip: 'Add to Jar!',
        backgroundColor: Colors.pink[200],

      ),


    );

  }
}