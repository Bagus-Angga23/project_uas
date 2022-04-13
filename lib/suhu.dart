import 'package:flutter/material.dart';
import 'package:project_uas/widget/input.dart';
import 'package:project_uas/widget/result.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // text controller
  TextEditingController etInput = TextEditingController();
  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _fahrenheit = 0;
  double _reamur = 0;
  final _formKey = GlobalKey<FormState>();

  _konversiSuhu() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _inputUser = double.parse(etInput.text);
        _reamur = 4 / 5 * _inputUser;
        _fahrenheit = 9 / 5 * _inputUser + 32;
        _kelvin = _inputUser + 273;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" Aplikasi Pengukur Suhu"),
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
                    result: _kelvin,
                    name: "Kelvin",
                  ),
                  Result(
                    result: _fahrenheit,
                    name: "Fahrenheit",
                  ),
                  Result(
                    result: _reamur,
                    name: "Reamur",
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