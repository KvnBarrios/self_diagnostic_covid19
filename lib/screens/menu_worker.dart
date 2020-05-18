import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'forms.dart';

class MenuWorker extends StatefulWidget {
  @override
  _MenuWorkerState createState() => _MenuWorkerState();
}

class _MenuWorkerState extends State<MenuWorker> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){},
      child: Scaffold(
        bottomNavigationBar:Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("images/wave.png"),
                  color: Color.fromRGBO(15, 26, 74, 1),
                ),
          appBar: AppBar(
            actions: <Widget>[Icon(Icons.report_problem)],
            backgroundColor: Color.fromRGBO(15, 26, 74, 1),
            title: Text("Menu"),
            automaticallyImplyLeading: false,
          ),
          body: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      margin: EdgeInsets.only(left: 23, right: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text(
                              "Olá, Kevin!",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 20.0, // soften the shadow
                                    spreadRadius: 0.0, //extend the shadow
                                    offset: Offset(
                                      5.0, // Move to right 10  horizontally
                                      5.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                              ),
                              child: Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Sua triagem diaria",
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Clique aqui",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Center(
                                            child: Container(
                                              child: Image(
                                                image: AssetImage(
                                                    "images/triagem.png"),
                                                height: 225,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) => new WorkerForm(),
                                                maintainState: false
                                            )
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ]
          )
      ),
    );
  }
}
