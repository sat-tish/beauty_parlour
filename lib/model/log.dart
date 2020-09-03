import 'package:beauty_parlour/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;

  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Widget _emailField() {
    return Container(
      child: TextFormField(
        cursorColor: Color(0xff2D3647),
        style: TextStyle(fontSize: 14),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2D3647)),
            ),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff2D3647),
            ),
            labelText: 'E-mail',
            labelStyle: TextStyle(color: Color(0xff2D3647), fontSize: 16)),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: TextFormField(
        obscureText: !_passwordVisible,
        cursorColor: Color(0xff2D3647),
        style: TextStyle(fontSize: 14),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2D3647)),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xff2D3647),
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Color(0xff2D3647), fontSize: 16),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xff2D3647),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RaisedButton(
      elevation: 5.0,
      color: Color(0xffCBB1B8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: MediaQuery.of(context).size.height / 40,
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return FlatButton(
      onPressed: () {},
      child: Text("Forgot Password"),
    );
  }

  Widget _container() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          _emailField(),
          _passwordField(),
          _forgotPassword(),
          _loginButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdcd0c0),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(16.0)),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
