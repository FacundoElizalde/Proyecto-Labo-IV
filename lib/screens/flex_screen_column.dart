import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class FlexScreenColumn extends StatelessWidget {
  const FlexScreenColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Alineación en Flutter por Columnas'),
        ),
        drawer: DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pushNamed(context, 'home');
          },
          child: const Icon(Icons.door_back_door),
        ),
        body: ListView(
          children: <Widget>[
            // Ejemplo 1: Row con MainAxisAlignment.spaceBetween
            Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.black12,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 40,
                    width: 40,
                  ),
                  Container(
                    color: Colors.green,
                    height: 40,
                    width: 40,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // 1° Ejemplo
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.black12,
              padding: const EdgeInsets.all(10),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 40,
                    width: 40,
                  ),
                  Container(
                    color: Colors.green,
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // 3° Ejemplo
            Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.black12,
              padding: EdgeInsets.all(10),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 60,
                    width: 60,
                    child: Center(
                        child: Text(
                      '1',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    color: Colors.green,
                    height: 60,
                    width: 60,
                    child: Center(
                        child: Text(
                      '2',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.black12,
              padding: EdgeInsets.all(10),
              width: 80,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 60,
                    width: 60,
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    color: Colors.green,
                    height: 60,
                    width: 60,
                    child: Center(
                        child: Text(
                      '2',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // 2° Ejemplo
            // 4° Ejemplo
          ],
        ),
      ),
    );
  }
}
