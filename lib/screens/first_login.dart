import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teste/widgets/input_field.dart';
import 'package:teste/widgets/validator.dart';


class FirstLoginForm extends StatefulWidget {
  @override
  _FirstLoginForm createState() => _FirstLoginForm();
}

class _FirstLoginForm extends State<FirstLoginForm> {

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
                        Text("Registre-se", style: TextStyle(
                          fontSize: 24
                        ),),
                        SizedBox(
                          height: 20,
                        ),
                        Validator(),
                        /*
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
                              hint: "CPF (Números)",
                              Type: TextInputType.phone,
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
                            hint: "Sua senha",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
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
                            hint: "Confirme sua senha",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 60,
                          width: 150,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: BorderSide(color: Color.fromRGBO(15, 26, 74,1))),
                            color: Color.fromRGBO(15, 26, 74,1),
                            child: Text("Registrar"),
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                        ),
                        FlatButton(
                          child: Text("Algum problema? acesse aqui"),
                          textColor: Colors.black,
                          onPressed: () => _sendForm(){
                          },
                        ),
                        SizedBox(
                          height: 20,
                        )*/
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



