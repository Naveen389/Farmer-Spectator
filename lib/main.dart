import 'package:Agriculture/color-util.dart';
import 'package:Agriculture/home.dart';
import 'package:Agriculture/loading_indicator.dart';
import 'package:Agriculture/registration_screen.dart';
import 'package:Agriculture/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          color: Colors.green,
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        primaryColor: HexToColor('#007500'),
        accentColor: HexToColor('#007500'),
        backgroundColor: Color(0xfff1f5f6),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool _isInAsyncCall = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";

  void _loginUser() {
    var result;
    // RestApi.fetchData(login_url, getQueryParams(), null)
    //     .then((String result1) async {
    //   result = result1;
    //   if (result == null) {
    //     setState(() {
    //       errorMessage = "Invalid Credentials";
    //       _isInAsyncCall = false;
    //     });
    //   }
    //   setState(() {
    //     _isInAsyncCall = false;
    //   });
    //     // Navigator.pushReplacement(
    //     //   context,
    //     //   MaterialPageRoute(builder: (context) => Home()),
    //     // );
    // });
    setState(() {
      _isInAsyncCall = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want to exit"),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Agriculture'),
        ),
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Farmer's Friendly",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      labelText: 'Mobile',
                      contentPadding: EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: FaIcon(FontAwesomeIcons.mobileAlt)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      contentPadding: EdgeInsets.all(15.0),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: FaIcon(FontAwesomeIcons.key)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()));
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  '$errorMessage',
                  style: TextStyle(color: Colors.red),
                ),
                _isInAsyncCall == false
                    ? Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(2, 0, 36, 1),
                              Color.fromRGBO(33, 139, 34, 1),
                              Color.fromRGBO(2, 0, 36, 1)
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                          ),
                        ),
                        child: FlatButton(
                            textColor: Colors.white,
                            child: Text(
                              'Login',
                            ),
                            onPressed: () {
                              setState(() {
                                _isInAsyncCall = true;
                              });
                              _loginUser();
                              FocusScope.of(context).requestFocus(FocusNode());
                            }))
                    : LoadingIndicator(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don\'t have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
