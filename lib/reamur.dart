import 'package:flutter/material.dart';
import 'package:project_uas/widget/input.dart';
import 'package:project_uas/widget/result.dart';

class reamur extends StatefulWidget {
  const reamur({Key? key}) : super(key: key);

  @override
  State<reamur> createState() => _reamurState();
}

class _reamurState extends State<reamur> {
  // text controller
  TextEditingController etInput = TextEditingController();
  //variabel berubah
  double _inputUser = 0;
  double _reamur = 0;
  final _formKey = GlobalKey<FormState>();

  _konversiSuhu() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _inputUser = double.parse(etInput.text);
        _reamur = 4 / 5 * _inputUser;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(" Aplikasi Pengukur Suhu Reamur"),
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
