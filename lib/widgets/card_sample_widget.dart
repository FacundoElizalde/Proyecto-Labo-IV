import 'package:flutter/material.dart';

class CardSampleWidget extends StatelessWidget {

  String titulo;
  String? subtitulo;

  CardSampleWidget({
    super.key,
    required this.titulo,
    this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            title: Text(this.titulo),
            subtitle: Text(this.subtitulo ?? 'NO_SUB'),
            leading: const Icon(Icons.image),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print('Hice clic en cancelar');
                  }, 
                  child: Text('cancelar')
                ),
                SizedBox(width: 15,),
                ElevatedButton(
                   onPressed: () {
                    print('Hice clic en Aceptar');
                  }, 
                  child: Text('Aceptar')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}