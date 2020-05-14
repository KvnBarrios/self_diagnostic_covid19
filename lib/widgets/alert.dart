
import 'package:flutter/material.dart';
import 'package:teste/screens/forms.dart';
import 'package:teste/screens/login_screen.dart';
import 'package:teste/widgets/sick_check.dart';


showAlertDialog1(BuildContext context)
{


  Widget  redoButoon= FlatButton(
    child: Text("Refazer"),
    onPressed: () {
      Navigator
          .push(
        context,
        new MaterialPageRoute(builder: (context) => new WorkerForm()),

      );
    },
);

  // configura o button
  Widget returnButton = FlatButton(
    child: Text("Retornar"),
    onPressed: () {
      Navigator
          .push(
        context,
        new MaterialPageRoute(builder: (context) => new LoginScreen()),
      );

    },

  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Olá Kevin Barrios"),
    content: Text("Seu auto-diagnostico foi enviado com sucesso"),
    actions: [
      redoButoon,
      returnButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}