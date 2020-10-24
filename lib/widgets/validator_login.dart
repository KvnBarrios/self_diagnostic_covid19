import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _isHidden = true;

  void _toogleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }
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
                hint: "CPF",
                icon: Icons.account_circle,
                obscure: false,
                validador: _validarCpf,
                Type: TextInputType.phone ,
                max: 11,
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
                  keyboardType:TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],

                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline, color: Colors.blueGrey),
                      hintText: "Sua senha",
                      suffixIcon: IconButton(
                            onPressed: _toogleVisibility,
                            icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          alignment: Alignment.topCenter,
                        ),
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100])),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100])),
                  ),
                  style: TextStyle(color: Colors.grey),
                  obscureText: _isHidden,
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

                context: context, builder: (context) =>
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Dialog(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(top: 100),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.6,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * (0.8),
                        child: Material(
                          type: MaterialType.card,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25)),
                          elevation: Theme
                              .of(context)
                              .dialogTheme
                              .elevation ?? 24.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25),
                                  child: Image.asset(
                                      "images/help.gif",fit: BoxFit.fitWidth,),
                                ),
                                Text(
                                  'Em caso de perca de senha, comunique seu gestor!.',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Colors.green,
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9.0),
                                      ),
                                      child: Text('Voltar', style: TextStyle(fontSize: 15,color: Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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