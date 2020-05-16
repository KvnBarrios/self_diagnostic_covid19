import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

import 'menu_worker.dart';
class WorkerForm extends StatefulWidget {
  @override
  _WorkerFormState createState() => _WorkerFormState();

}
@override
bool _isSelected = false;
bool _isSelected2 = false;
bool _isSelected3 = false;
bool _isSelected4 = false;
bool _isSelected5 = false;
bool _isSelected6 = false;
bool _isSelected7 = false;

class _WorkerFormState extends State<WorkerForm> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            child: Icon((Icons.arrow_back),color: Colors.white,
            ),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute
                (builder: (context) => MenuWorker()));
            },
          ),
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
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Tosse seca", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.headSideCoughSlash, size: 25, color: Colors.black,),

                        value: _isSelected,
                        subtitle: Center(child: Text("Tosse persistente sem catarro")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),

                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Febre", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.thermometerFull, size: 25, color: Colors.black,),

                        value: _isSelected2,
                        subtitle: Center(child: Text("Acima de 37,5°C")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected2 = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Tosse", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.headSideCough, size: 25, color: Colors.black,),
                        value: _isSelected3,
                        subtitle: Center(child: Text("Tosse persistente com catarro")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected3 = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Falta de ar", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.lungs, size: 25, color: Colors.black,),

                        value: _isSelected4,
                        subtitle: Center(child: Text("Dificuldade de respirar")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected4 = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Dor de garganta", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.userMinus, size: 25, color: Colors.black,),

                        value: _isSelected5,
                        subtitle: Center(child: Text("Dor ou irritação na garganta")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected5 = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Congestão nasal", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.boxTissue, size: 25, color: Colors.black,),

                        value: _isSelected6,
                        subtitle: Center(child: Text("Vias nasais inchadas")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected6 = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            offset: Offset(
                              0, // Move to right 10  horizontally
                              4, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: CheckboxListTile(
                        title: Center(
                          child: Text("Mal estar", style: TextStyle(
                              fontSize: 26
                          ),),
                        ),
                        secondary: Icon(
                          FontAwesomeIcons.diagnoses, size: 25, color: Colors.black,),

                        value: _isSelected7,
                        subtitle: Center(child: Text("Fadiga ou dor muscular")),
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected7 = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),

                /*
                SickForm(icon: FontAwesomeIcons.headSideCoughSlash,hint: "Tosse seca", subhint: "Tosse persistente sem catarro"),
                SickForm(icon: FontAwesomeIcons.thermometerFull,hint: "Febre", subhint: "Acima de 37,5°C"),
                SickForm(icon: FontAwesomeIcons.headSideCough,hint: "Tosse ", subhint: "Tosse persistente com catarro"),
                SickForm(icon: FontAwesomeIcons.lungs,hint: "Falta de ar", subhint: "Dificuldade de respirar"),
                SickForm(icon: FontAwesomeIcons.userMinus,hint: "Dor de garganta", subhint: "Dor ou irritação na garganta"),
                SickForm(icon: FontAwesomeIcons.boxTissue,hint: "Congestão nasal", subhint: "Vias nasais inchadas"),
                SickForm(icon: FontAwesomeIcons.diagnoses,hint: "Mal estar", subhint: "Fadiga ou dor muscular"),
                */


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
                      onPressed: () {/*
                        showDialog(
                          context: context,builder: (_) => Container(
                          color: Colors.white,

                          margin: EdgeInsets.only(left: 75, top: 150,bottom: 150,right: 75),
                          child: Column(
                            children: <Widget>[
                              VerificaSintoma(
                              )
                            ],
                          ),
                        )
                        );
                        */










                        //showAlertDialog1(context);
                        showDialog(
                          context: context,builder: (_) => NetworkGiffyDialog(
                          image: Image.asset("images/thumbs-up.gif",),
                          title: Text('Olá, Kevin! Seu diagnóstico esta pendente!',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600, ),
                            textAlign: TextAlign.center,
                          ),
                          description:VerificaSintoma(),
                          buttonOkText: Text("Confirmar",
                          style: TextStyle(
                            color: Colors.white
                          ),),
                          buttonCancelText: Text("Editar",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          entryAnimation: EntryAnimation.TOP,
                          onOkButtonPressed: () {
                            Navigator.push(context, MaterialPageRoute
                              (builder: (context) => MenuWorker()));

                          },
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


Text VerificaSintoma(){
  var s = ["Tosse seca", "Febre", "Tosse", "Falta de ar","Dor de garganta", "Congestão nasal", "Mal estar"];
  var z = [_isSelected,_isSelected2,_isSelected3,_isSelected4,_isSelected5,_isSelected6,_isSelected7];
  var text = [];
  var i;
  var u =1;
  bool t = false;
  bool y = false;
  String textoinit = "Sem sintomas";
  for(i = 0; i < 7; i++){
    if(z[i] == true){
      textoinit = "Você esta sentindo:";
      if (y == false){
        text.add("-${s[i]}");
        u++;
        t = true;
        y = true;
        continue;
      }
      if (u%2 != 0 && u>2) {
        if (t == false) {
          text.add("\n");
          text.add("-${s[i]}");
          u++;
          t = true;
          continue;
        }
      }
      else {
        if(i==7){
          continue;
        }
        else{
        text.add(", ${s[i]}");
        u++;
        t = false;
        continue;
        }
      }
    }
  };
  return Text("${textoinit}\n${ text.join("")}",
  style: TextStyle(
    fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600,
  ), textAlign: TextAlign.left,);
}