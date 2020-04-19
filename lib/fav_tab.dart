import 'package:flutter/material.dart';
import 'package:slap/form.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:slap/jar_json.dart';
import 'package:http/http.dart' as http;


Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/jar.json');
}

TextEditingController jartitle = new TextEditingController();

class fav_tab extends StatefulWidget {
  final Color color;

  const fav_tab(Color white, {Key key, this.color}) : super(key: key);
  _ListViewClickListenerState createState() => _ListViewClickListenerState();

}

class JarNumber {
  final int index;
  JarNumber(this.index);
}



class _ListViewClickListenerState extends State<fav_tab> {
  //var names = const [];
  /**
  List <jar_json> name = [];

  Future _loadAStudentAsset() async {
    List<jar_json> _names = await jar_json.browse();
    setState(() {
        name = _names;

    });
    //return await rootBundle.loadString('assets/jar.json');
  }
      */
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _listViewData = [];

  loadData() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    //print(jsonResponse[0]['options'].length);

    for (int i = 0; i < jsonResponse[0]['options'].length; i++) {
      _listViewData.add(jsonResponse[0]['options'][i]['name']);
    }
    print('printing from json file');
    //refresh the page
    return (context as Element).reassemble();
  }

  void addjar() {
    if (jartitle.text != null) {
      TextEditingController newjartitle = jartitle;

      _listViewData.add(newjartitle.text);
      (context as Element).reassemble();
      print(_listViewData);
      Navigator.of(context, rootNavigator: true).pop('dialog');
      jartitle = new TextEditingController();
      return print(jartitle.text);
    } else
      return print("component was empty");
  }
  @override
  void initState() {
    super.initState();

    // use this
    loadData();
  }

  bool pressing = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Pick your poison',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 25,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.black,
            )),

        actions: <Widget>[
          /**IconButton(
            icon: const Icon(Icons.file_upload),
            tooltip: 'use existing JSON files',
            onPressed: () {
              if (pressing == true) {
                loadData();
                setState(() {
                  pressing = false;
                  print(pressing);
                });
              } else {
                print('cannot load anymore data');
              }
              print('pressed button');
            },
          ),*/
        ],
      ),

      body: ListView.builder(
        itemCount: _listViewData.length,
        itemBuilder: (context, index) {
          final item = _listViewData[index];
          return GestureDetector(
              child: ListTile(title: Text('$item')),
              onTap: () {},
              onTapUp: (_) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new form(Colors.white,
                            jarNumber: new JarNumber(index))));
              },
              onLongPress: () {
                print('longpress');
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('delete?'),
                        content: const Text('This will delete your jar'),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                          ),
                          RaisedButton(
                            child: const Text('ACCEPT'),
                            onPressed: () {
                              //remove from list
                              setState(() {
                                _listViewData.removeAt(index);

                                //print ('hi');
                                //String whatisleft = jsonEncode(_listViewData); // say it again
                                //String itemsss = jsonDecode(_listViewData.removeAt(index));
                                //print(itemsss);
                              });
                              Navigator.of(context)
                                  .pop(_listViewData.indexOf(item));
                              return (context as Element).reassemble();
                            },
                          )
                        ],
                      );
                    });
              });
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
        child: Icon(Icons.add),
        tooltip: 'Add a Jar!',
        backgroundColor: Colors.pink[200]


      ),
    );
  }
}
