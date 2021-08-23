import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aranjarea widget-urilor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aranjarea widget-urilor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  final List<String> text =[
    "Caine",
    "Pisica",
    "Maimuta",
    "Elefant",
    "Rinocer",
    "T\n-\nR\nE\nX"
  ];
  var index = 0;
  int buildType = 0;

  Widget _build1(){
    //folosesc Expanded
    return Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                color:Colors.red,
                width: double.infinity,
                child: Text(
                  text[index],
                  style: TextStyle(
                    fontSize: 25,
                    
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
             Container(
               width: double.infinity,
                color: Colors.green,
                child: Center(
                  //Center ia latimea pe care o are copilul sau
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    onPressed: (){

                        setState(() {
                          index++;
                          if(index >= text.length){
                            index = 0;
                          }
                        });
                    }, 
                    child: Text(
                      "Schimba animalul",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ),
              ),
          ],
        ),
      );
  }
  
  Widget _build2(){
    //folosesc Expanded
    return Container(
      color: Colors.orangeAccent,
      child: Column(children: [

        Expanded(
          child: Container(color:Colors.cyan),
          flex: 1,
        ),
        Container(
          color: Colors.indigo,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "RODEAPPS",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20, 
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Container(color:Colors.pink),
          flex: 8
        ),
        ElevatedButton(child: Text("Buton1"), onPressed: (){},),
        ElevatedButton(child: Text("Buton2"), onPressed: (){},),
        Expanded(
          child: Container(color:Colors.purple[400]),
          flex: 1
        )
      ],),
    );
  }


  Widget _build3(){
    //folosesc mainAxisAlignment
    return Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                color:Colors.pink,
                width: double.infinity,
                child: Text(
                  text[index],
                  style: TextStyle(
                    fontSize: 25,
                    
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
             Container(
               width: double.infinity,
                color: Colors.yellow,
                child: Center(
                  //Center ia latimea pe care o are copilul sau
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    onPressed: (){

                        setState(() {
                          index++;
                          if(index >= text.length){
                            index = 0;
                          }
                        });
                    }, 
                    child: Text(
                      "Schimba animalul",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ),
              ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildType == 0 ? _build1() : buildType == 1 ? _build2() : _build3(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            buildType++;
            if(buildType == 3)
              buildType = 0;
          });
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
