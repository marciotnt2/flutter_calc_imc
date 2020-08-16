import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _information = "Informe os dados";

  TextEditingController wheighCOntroller = TextEditingController();
  TextEditingController heighCOntroller = TextEditingController();

  void _resetFields() {
    setState(() {
      wheighCOntroller.text = "";
      heighCOntroller.text = "";
      _information = "Informe os dados";
    });
  }

  void _calcImc() {
    setState(() {
      double wheigh = double.parse(wheighCOntroller.text.toString());
      double heigh = double.parse(heighCOntroller.text.toString()) / 100;
      debugPrint(heigh.toString());
      double result = wheigh / (heigh * heigh);
      debugPrint(result.toStringAsPrecision(4));
      _information = result.toStringAsPrecision(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadra de IMC"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40.0),
                child: Icon(Icons.person_outline,
                    size: 120.0, color: Colors.green)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: wheighCOntroller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green, fontSize: 18.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: heighCOntroller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green, fontSize: 18.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: _calcImc,
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                color: Colors.green,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _information,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
