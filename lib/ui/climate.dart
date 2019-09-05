import 'package:flutter/material.dart';
import './secondscreen.dart';
class MyApp extends StatefulWidget {
  final String field1_country,field2_city;
  MyApp({Key key,this.field1_country,this.field2_city}):super(key:key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Weather Report"),
        centerTitle: true,
        
      ),
      

      body: Stack(
        children: <Widget>[
            
                Center(
                  child: Image.asset('images/umbrella.png',
                  height: 1000.0,
                  fit: BoxFit.fitHeight,
                  ),
                ) ,

                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Text("${widget.field1_country}",style: TextStyle(color: Colors.white,
                  fontStyle: FontStyle.italic,fontSize: 20),
                  ),

                ),

             
                getdata(widget.field2_city,widget.field1_country)
        ],
      ),
      
    );
  }
}