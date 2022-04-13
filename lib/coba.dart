import 'package:flutter/material.dart';

class Coba extends StatelessWidget {
  const Coba({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coba'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: const DecorationImage(
                      image: AssetImage('images/angga.jpg'), fit: BoxFit.cover),
                ),
                width: 100,
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("Putu Bagus Angga Darmawan", style: TextStyle(
                    fontSize: 20
                ),),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("1915101048"),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("Ilmu Komputer RPL 6C "),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("Singaraja,Bali"),
              )
            ],
          ),
        ),
      ),
    );
  }
}