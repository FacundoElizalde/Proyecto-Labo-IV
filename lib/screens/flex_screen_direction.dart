import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class FlexScreenDirection extends StatelessWidget {
   
  const FlexScreenDirection({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Alineación en Flutter'),
        ),
        drawer: DrawerMenu(),
        body: FlexRowWidget(),
      ),
    );
  }
}

class FlexRowWidget extends StatelessWidget {
  const FlexRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: ListView(            
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                      color: Colors.red,                
                      width: 100,
                      height: 100,
                    ),
              Container(
                      color: Colors.blue,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
              Container(
                      color: Colors.green,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
              Container(
                      color: Colors.amber,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
              Container(
                      color: Colors.black,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView(            
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                      color: Colors.red,                
                      width: 100,
                      height: 100,
                    ),
              Container(
                      color: Colors.blue,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
              Container(
                      color: Colors.green,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
              Container(
                      color: Colors.amber,                
                      width: 100,
                      height: 100,
                    ), // 4° Ejemplo
              Container(
                      color: Colors.black,                
                      width: 100,
                      height: 100,                      
                    ), // 4° Ejemplo
            ],
          ),
        ),
      ],
    );
  }
}