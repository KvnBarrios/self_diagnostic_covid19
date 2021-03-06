import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _isHidden = true;
  bool _isHidden2 = true;
  void _toogleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  void _toogleVisibility2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }



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
            margin: EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 0),
            child: TextFormField(
              buildCounter: (BuildContext context,
                      {int currentLength, int maxLength, bool isFocused}) =>
                  null,
              maxLength: 6,
              maxLengthEnforced: true,
              inputFormatters:  <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline, color: Colors.blueGrey),
                  hintText: "Sua senha",
                  suffixIcon: IconButton(
                    onPressed: _toogleVisibility,
                    icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    alignment: Alignment.topCenter,
                  ) ,
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100])),
                 ),
              style: TextStyle(color: Colors.grey),
              obscureText: _isHidden,
              keyboardType: TextInputType.phone,
              controller: minhaSenha1,
              validator: _validarSenha,
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
            margin: EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 0),
            child: TextFormField(
              buildCounter: (BuildContext context,
                      {int currentLength, int maxLength, bool isFocused}) =>
                  null,
              maxLength: 6,
              maxLengthEnforced: true,
              inputFormatters:  <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline, color: Colors.blueGrey),
                  suffixIcon: IconButton(
                    onPressed: _toogleVisibility2,
                    icon: _isHidden2 ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    alignment: Alignment.topCenter,
                  ) ,
                  hintText: "Repita a sua senha",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100])),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[100])),
                  ),
              style: TextStyle(color: Colors.grey),
              obscureText: _isHidden2,
              keyboardType: TextInputType.phone,
              controller: minhaSenha2,
              validator:_validarSenha,

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


  String _validarSenha(text){
    if(minhaSenha1.text != minhaSenha2.text){
      return ("Senhas incompativeis");
    }
    if (minhaSenha1.text.isEmpty == true || minhaSenha2.text.isEmpty == true ){
      return ("Digite uma senha");
    }
    return null;

  }

  String _validarCpf(value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o CPF";
    } else if (value.length != 11) {
      return "CPF detém 11 digitos";
    } else if (!regExp.hasMatch(value)) {
      return "Somente digitos";
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
        entryAnimation: EntryAnimation.TOP,
        onlyOkButton: true,
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

