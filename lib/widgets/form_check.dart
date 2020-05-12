import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class FormCheck extends StatefulWidget {
  final String hint;

  FormCheck(this.hint);

  @override
  _FormCheckState createState() => _FormCheckState();
}

class _FormCheckState extends State<FormCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0, // soften the shadow
                    offset: Offset(
                      0, // Move to right 10  horizontally
                      4, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(widget.hint,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                RadioButtonGroup(
                    orientation: GroupedButtonsOrientation.HORIZONTAL,
                    margin: EdgeInsets.only(left: 140),
                    labelStyle: TextStyle(fontSize: 20),
                    labels: <String>[
                      "Sim",
                      "Não",
                    ],
                    onSelected: (String selected) =>
                        print({this.widget.hint, selected})),
              ],
            )),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
