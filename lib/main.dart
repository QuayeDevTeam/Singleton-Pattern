import 'package:flutter/material.dart';

//Singleton

class User {
  String name;
  String age;

  User({this.name, this.age});
}

class AppUsers {
  static final _instance = AppUsers._internal();

  factory AppUsers() {
    return _instance;
  }

  AppUsers._internal();


  List<User> userList = [
    User(name: "Quinton", age: "34"),
    User(name: "Carl", age: "35"),
    User(name: "Scott", age: "33")
  ];



  _add(User thisUser) {
    userList.add(thisUser);
    print("------------- ");

    for (var i in userList){
      print(i.name);
    }

    return userList;
  }


  void removeUser(int atIndex){
    userList.removeAt(atIndex);

    for (var i in userList){
      print(i.name);
    }
  }



}
//End---------------



void main() => runApp(NameView());



class NameView extends StatefulWidget {
  @override
  _NameViewState createState() => _NameViewState();
}

class _NameViewState extends State<NameView> {
  final _formKey = GlobalKey<FormState>();

  String userName;
  String userAge;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        Scaffold(
          appBar: AppBar(
            title: Text("Naming App"),
          ),
          body: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      userName = value;

                      return null;
                    },
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your age',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      userAge = value;

                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          // Process data.
                          setState(() {

                            AppUsers._instance._add(User(name: userName, age: userAge));
                            _formKey.currentState.reset();
                          });

                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        setState(() {
                          AppUsers._instance.removeUser(1);
                        });
                      },
                      child: Text('Remove Second User'),
                    ),
                  ),
      */
                ],
              ),
            ),
          ),
        ),
    );
  }
}

