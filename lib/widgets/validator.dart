import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';


class Validator extends StatefulWidget {
  @override
  _ValidatorState createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

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
            onPressed: _sendForm,
          ),
          SizedBox(
            height: 20,
          )
        ]
    );
  }


  String _validarCpf(value) {
    if (CPFValidator.isValid(value) == false) {
      return "CPF Invalido";
    }
    return null;
  }



  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}