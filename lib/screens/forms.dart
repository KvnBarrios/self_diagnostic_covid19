import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/widgets/sick_check.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
class WorkerForm extends StatefulWidget {
  @override
  _WorkerFormState createState() => _WorkerFormState();
}

class _WorkerFormState extends State<WorkerForm> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          actions: <Widget>[Icon(Icons.report_problem)],
          backgroundColor: Color.fromRGBO(15, 26, 74,1),
          title: Text("Relatorio de triagem diaria"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(
              left: 23,
              right: 23
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Auto-diagnostico",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Você apresenta (ou) apresentou nos ultimos 14 dias?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SickForm(icon: FontAwesomeIcons.headSideCoughSlash,hint: "Tosse seca", subhint: "Tosse persistente sem catarro"),
                SickForm(icon: FontAwesomeIcons.thermometerFull,hint: "Febre", subhint: "Acima de 37,5°C"),
                SickForm(icon: FontAwesomeIcons.headSideCough,hint: "Tosse ", subhint: "Tosse persistente com catarro"),
                SickForm(icon: FontAwesomeIcons.lungs,hint: "Falta de ar", subhint: "Dificuldade de respirar"),
                SickForm(icon: FontAwesomeIcons.userMinus,hint: "Dor de garganta", subhint: "Dor ou irritação na garganta"),
                SickForm(icon: FontAwesomeIcons.boxTissue,hint: "Congestão nasal", subhint: "Vias nasais inchadas"),
                SickForm(icon: FontAwesomeIcons.diagnoses,hint: "Mal estar", subhint: "Fadiga ou dor muscular"),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Color.fromRGBO(15, 26, 74,1))),
                      color: Color.fromRGBO(15, 26, 74,1),
                      child: Text("Enviar"),
                      onPressed: () {
                        //showAlertDialog1(context);
                        showDialog(
                          context: context,builder: (_) => NetworkGiffyDialog(
                          image: Image.asset("images/thumbs-up.gif",),
                          title: Text('Olá, Kevin! Seu diagnóstico foi enviado.',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600, ),
                            textAlign: TextAlign.center,
                          ),
                          description: Text("Obrigado por fazer sua parte para um Brasil melhor!",
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                          entryAnimation: EntryAnimation.TOP,
                          onOkButtonPressed: () {},
                        )
                        );
                      },
                      textColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ));
  }
}
