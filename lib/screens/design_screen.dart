import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class DesignPage extends StatelessWidget {
   
  const DesignPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      drawer: DrawerMenu(),     
      body: ListView(           
         children: [             
              //https://www.eltiempo.com/files/article_main/uploads/2022/06/04/629bff00a3ab6.jpeg                                  
            const FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'), 
              image: NetworkImage('https://www.eltiempo.com/files/article_main/uploads/2022/06/04/629bff00a3ab6.jpeg'),
              height: 250,
              fit: BoxFit.cover,
            ),                            
            Container(
              color: Colors.green,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Titulo primario de la sección',
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text('Titulo secundario de la sección'),
                    ],
                  ),
                  Icon(Icons.star, color:Colors.red),
                  Text('41')
                ],
              ),
            ),
            Container(

              color: Colors.green,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),

            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                children: [
                  Icon(Icons.phone),
                  SizedBox(height: 5),
                  Text('CALL')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.phone),
                  SizedBox(height: 5),
                  Text('CALL')
                ],
              ),
              Column(
                children: [
                  Icon(Icons.phone),
                  SizedBox(height: 5),
                  Text('CALL')
                ],
              )
            ]),
            )
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
            ,Text('Sint nulla quis nulla non dolor elit incididunt ex amet pariatur proident pariatur in sit. Sunt excepteur laboris nostrud est ut. Eu enim et nisi officia dolore non. Cupidatat ad Lorem amet ullamco officia velit officia.')
          ],
      ),
    );
  }
}
