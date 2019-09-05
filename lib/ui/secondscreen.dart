import 'package:flutter/material.dart';
import 'package:flutter_app/ui/climate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './Api.dart' as Api;
class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  var country=new TextEditingController();
  var city=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screeen"),
        backgroundColor: Colors.transparent,
      ),

      body: Stack(
        children: <Widget>[

            Center(
              child: Image.asset('images/white_snow.png',
              fit: BoxFit.fill,
              width: 1000.0,),
              
            ),
        
  Container(
            margin: EdgeInsets.fromLTRB(10.0, 40.0,0.0, 0.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child:  TextField(
                controller: country,
                decoration: InputDecoration(
                hintText: "Enter the Country"
              ),
            ),
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child:              TextField(
                controller: city,
                decoration: InputDecoration(
                hintText: "Enter the City"
              ),
            ),


            ),
           

            Container(
              child: RaisedButton(
                child: Text("Get Data"),
                color: Colors.redAccent,
                onPressed: ()=>Navigator.push(context,new MaterialPageRoute<Map>(builder: (context)=>MyApp(
                    
                    field1_country:country.text.toString(),
                    field2_city:city.text.toString()
               
              )),
            )))

            
          

          ],
        )
  )

        ])

      
    );
  }
}
void showStuff(String city,String country) async{

  Map res=await getAPI(city,Api.appid,country);
  print(res);
}

Future<Map> getAPI(String city,String api_id,String country) async {

        print("Country is ${country.toString()}");
  
    String apiUrl="https://api.openweathermap.org/data/2.5/weather?q=${city.toString()},${country.toString()}&appid=3e38bd9bca6ee85818308b61c68c98fe&units=imperial";
    //https://api.openweathermap.org/data/2.5/weather?q=kolkata,India&appid=3e38bd9bca6ee85818308b61c68c98fe
    
    var response=await http.get(apiUrl);
    return json.decode(response.body);


}

Widget getdata(String city,String country) {

  return FutureBuilder(
    future: getAPI(city,Api.appid,country),
    builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
      if(snapshot.hasData){
        Map data =snapshot.data;
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(50.0, 100.0, 30.0, 0.0),
          child: 
              ListTile(
                  title: Text(city,style: TextStyle(color: Colors.white,fontSize: 30.0),),
                  subtitle: Text("Temp ${data['main']['temp'].toString()}F\nHumidity ${data['main']['humidity'].toString()}%\n",
                  style: TextStyle(color: Colors.white,fontSize: 15.0),),
              ),
            
          
        );
      }
      else{
        return Container();
      }});
}


