import 'package:flutter/material.dart';
import 'package:volei/modules/components/topo.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Volei(),
    );
  }
}
class Volei extends StatefulWidget{
  @override
  _VoleiState createState() => _VoleiState();
}
class _VoleiState extends State<Volei>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Topo(),
      ),
    );
  }
}