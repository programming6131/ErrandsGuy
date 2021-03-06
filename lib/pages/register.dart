import 'dart:io';

import 'package:errands_guy/constants/constants.dart';
import'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _brightness  =false;
  ThemeData _darkTheme =  ThemeData(brightness:Brightness.dark);
   ThemeData _lightTheme =  ThemeData(brightness:Brightness.light);
  var _currentItemSelected = '<6Hours';
  var _urgency = ['<6Hours', '24Hours', '48Hours'];
  File _image;
  final picker = ImagePicker();
  Future getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _brightness ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Register/Renew Licence',
      home:Scaffold(
        appBar: AppBar(
          elevation:0.0,
          backgroundColor:Color(0xff08D294),
        ),
        backgroundColor: Color(0xff08D294),
        body: Container(
          child:ListView(
            children: <Widget>[
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset('lib/assets/errands.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'ErrandsGuy',
                      style: TextStyle(
                        fontFamily: Constants.OPEN_SANS,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: Text(
                      'Order Form',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: Constants.OPEN_SANS,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0, top: 10.0),
                    child: Text(
                      'Service Description',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'OpenSans'),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    maxLines: 4,
                    maxLength: 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0, top: 10.0),
                    child: Text(
                      'Doc upload',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'OpenSans'),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                              splashColor: Color(0xff08D294),
                              color: Colors.white,
                              child: Text(
                                'Browse',
                                style: TextStyle(
                                  color: Color(0xff08D294),
                                ),
                              ),
                              onPressed: getImage,
                              elevation: 6.0),
                        ),
                        _image == null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Expanded(child: Text('No file selected')),
                              )
                            : Container(
                                height: 50,
                                width: 50.0,
                                child: Image.file(_image)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0, top: 10.0),
                    child: Text(
                      'Urgency*',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'OpenSans'),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0, top: 10.0),
                    child: DropdownButton<String>(
                      items: _urgency.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentItemSelected = newValueSelected;
                        });
                      },
                      value: _currentItemSelected,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        splashColor: Color(0xff08D294),
                        color: Colors.white,
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                            color: Color(0xff08D294),
                          ),
                        ),
                        onPressed: () {},
                        elevation: 6.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text('E'),
                ),
                accountName: Text('ErransGuy'),
                accountEmail: Text('errandsguy@gmail.com'),
              ),
              ListTile(
                title: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.work),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/window');
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Light/Dark mode',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Switch(
                    value: _brightness,
                    onChanged: (_newValue) {
                      setState(() {
                        _brightness = _newValue;
                      });
                    }),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'ErrandsPro',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.shopping_basket),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.account_circle),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.account_circle),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.account_box),
                onTap: () {},
              ),
            ],
          ),
        ),

      ),
    );
  }
}