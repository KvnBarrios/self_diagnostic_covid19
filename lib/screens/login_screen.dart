import 'package:flutter/material.dart';
import 'package:teste/screens/first_login.dart';
import 'package:teste/screens/forms.dart';
import 'package:teste/widgets/input_field.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black54, Color.fromRGBO(15, 26, 74,1)])),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/covid.png"),
                    height: 140,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0))),
                          child: Center(
                            child: InputField(
                              icon: Icons.account_circle,
                              obscure: false,
                              hint: "Worker",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0))),
                          child: InputField(
                            icon: Icons.lock,
                            obscure: true,
                            hint: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FlatButton(
                          child: Text("Forgot you password?"),
                          textColor: Colors.black,
                          onPressed: (){},
                        ),
                        SizedBox(
                          height: 60,
                          width: 150,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: BorderSide(color: Color.fromRGBO(15, 26, 74,1))),
                            color: Color.fromRGBO(15, 26, 74,1),
                            child: Text("Entrar"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkerForm()),
                              );
                            },
                            textColor: Colors.white,
                          ),
                        ),
                    FlatButton(
                      child: Text("Primeiro acesso? clique aqui"),
                      textColor: Colors.black,
                      onPressed: (){
                        Navigator.push (
                          context,
                          MaterialPageRoute(builder: (context) => FirstLoginForm()),
                        );
                      },
                    ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
