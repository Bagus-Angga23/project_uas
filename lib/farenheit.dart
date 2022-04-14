import 'package:flutter/material.dart';
import 'package:project_uas/widget/input.dart';
import 'package:project_uas/widget/result.dart';


class farenheit extends StatefulWidget {
  const farenheit({Key? key}) : super(key: key);

  @override
  State<farenheit> createState() => _farenheitState();
}

class _farenheitState extends State<farenheit> {
  // text controller
  TextEditingController etInput = TextEditingController();
  //variabel berubah
  double _inputUser = 0;
  double _fahrenheit = 0;
  final _formKey = GlobalKey<FormState>();

  _konversiSuhu() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _inputUser = double.parse(etInput.text);
        _fahrenheit = 9 / 5 * _inputUser + 32;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" Aplikasi Pengukur Suhu Farenheit"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Input(etInput: etInput),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Result(
                    result: _fahrenheit,
                    name: "Fahrenheit",
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _konversiSuhu,
                child: const Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
