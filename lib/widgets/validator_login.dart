import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:teste/screens/login_screen.dart';
import 'package:teste/screens/menu_worker.dart';

import 'input_field.dart';


// ignore: camel_case_types
class Validator_login extends StatefulWidget {
  @override
  _Validator_loginState createState() => _Validator_loginState();
}

class _Validator_loginState extends State<Validator_login> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  final minhaSenha1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _key,
        autovalidate: _validate,
        child: _formUI()
    );
  }

  Widget _formUI() {
    return Column(
        children: <Widget>[
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
                hint: "CPF",
                validador: _validarCpf,
                Type: TextInputType.phone ,
              ),
            ),
          ),
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
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 0),
                child: TextFormField(
                  buildCounter: (BuildContext context,
                      {int currentLength, int maxLength, bool isFocused}) =>
                  null,
                  maxLength: 11,
                  maxLengthEnforced: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline, color: Colors.blueGrey),
                      hintText: "Sua senha",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100])),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100])),
                      contentPadding:
                      EdgeInsets.only(left: 5, right: 10, bottom: 10, top: 5)),
                  style: TextStyle(color: Colors.grey),
                  obscureText: true,
                  controller: minhaSenha1,
                  validator: _validarSenha,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            child: Text("Esqueceu sua senha?"),
            textColor: Colors.black,
            onPressed: (){
              showDialog(
                  context: context,builder: (_) => NetworkGiffyDialog(
                image: Image.asset("images/help.gif",),
                title: Text('Em caso de perca de senha contate sua empresa',
                  style: TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.w600, ),
                  textAlign: TextAlign.center,
                ),
                description: Text("O gestor saberá como dar proseguimento!. Obrigado",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                entryAnimation: EntryAnimation.TOP,
                onOkButtonPressed: () {
                  Navigator.push(context, MaterialPageRoute
                    (builder: (context) => LoginScreen()));
                },
              )
              );
            },
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
              onPressed: _sendForm,
              textColor: Colors.white,
            ),
          ),
        ]
    );
  }


  String _validarCpf(value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o CPF";
    } else if(value.length != 11){
      return "O CPF deve conter 11 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O CPF só deve conter dígitos";
    }
    if (CPFValidator.isValid(value) == false) {
      return "CPF Inválido";
    }
    return null;
  }

  String _validarSenha(text){
    if (minhaSenha1.text.isEmpty == true )
    {
      return ("Digite uma senha");
    }
    return null;

  }






  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MenuWorker()),
      );
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}