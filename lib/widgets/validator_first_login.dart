import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:teste/screens/login_screen.dart';

import 'input_field.dart';

class Validator extends StatefulWidget {
  @override
  _ValidatorState createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  final minhaSenha1 = TextEditingController();
  final minhaSenha2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Form(key: _key, autovalidate: _validate, child: _formUI());
  }

  Widget _formUI() {
    return Column(children: <Widget>[
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
            validador: _validarCpf,
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
              keyboardType: TextInputType.phone,
              controller: minhaSenha1,
            ),
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
                  hintText: "Repita a sua senha",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100])),
                  contentPadding:
                      EdgeInsets.only(left: 5, right: 10, bottom: 10, top: 5)),
              style: TextStyle(color: Colors.grey),
              obscureText: true,
              keyboardType: TextInputType.phone,
              controller: minhaSenha2,
              validator:(text){
                if(minhaSenha1.text == null){
                  return ("Insira uma senha");
                }
                if(minhaSenha1.text != minhaSenha2.text){
                  return ("Senhas incompativeis");
                }
                return null;
              },
            ),
          ),
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
              side: BorderSide(color: Color.fromRGBO(15, 26, 74, 1))),
          color: Color.fromRGBO(15, 26, 74, 1),
          child: Text("Registrar"),
          onPressed: _sendForm,
          textColor: Colors.white,
        ),
      ),
      FlatButton(
        child: Text("Algum problema? acesse aqui"),
        textColor: Colors.black,
        onPressed: () {},
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }

  String _validarCpf(value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o CPF";
    } else if (value.length != 11) {
      return "O CPF deve conter 11 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O CPF só deve conter dígitos";
    }
    if (CPFValidator.isValid(value) == false) {
      return "CPF Inválido";
    }
    return null;
  }


  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      showDialog(
          context: context,builder: (_) => NetworkGiffyDialog(
        image: Image.asset("images/thumbs-up.gif",),
        title: Text('Olá, Kevin! Sua conta foi criada com sucesso.',
          style: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.w600, ),
          textAlign: TextAlign.center,
        ),
        description: Text("Agora é só entrar na sua conta!",
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
        entryAnimation: EntryAnimation.TOP,
        onOkButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()),
          );
        },
      ));
    } else {
      // erro de validação

      setState(() {
        _validate = true;
      });
    }
  }
}
