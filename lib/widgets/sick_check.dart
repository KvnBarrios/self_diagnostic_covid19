import 'package:flutter/material.dart';

class SickForm extends StatefulWidget {
  final IconData icon;
  final String hint;
  final String subhint;
  SickForm({this.icon, this.hint, this.subhint  });


  @override
  _SickFormState createState() => _SickFormState();
}

class _SickFormState extends State<SickForm> {


  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: Text(widget.hint, style: TextStyle(
                  fontSize: 26
              ),),
            ),
            secondary: Icon(widget.icon, size: 25,color: Colors.black,),
            value: _isSelected,
            subtitle: Center(child: Text(widget.subhint)),
            activeColor: Colors.blue ,
            onChanged: (bool newValue){
              setState(() {
                _isSelected = newValue;
              });
              print (_isSelected);
            },
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
