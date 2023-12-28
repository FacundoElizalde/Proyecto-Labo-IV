import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class QrScannerScreen extends StatefulWidget {
   
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  
  int currentIdex = 0;
  String _qrCode = 'Code Bar';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Scanner'),
        centerTitle: false,
        toolbarHeight: 80,
        elevation: 10,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_open_outlined), 
            onPressed: () {  
              print('menu sup derecho 1');
            },            
          ),
          IconButton(
            iconSize: 50,
            icon: const CircleAvatar(                    
                    child: Icon(Icons.menu_open_outlined),
                  ), 
            onPressed: () {  
              print('menu sup derecho 2');
            },            
          )
        ],
      ),
      drawer: DrawerMenu(),
      body: Center(
         child: Text(_qrCode),
      ),   
      floatingActionButton: FloatingActionButton(        
        child: const Icon(Icons.camera),        
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#ffffff', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR);          
          if(barcodeScanRes != "-1"){
              //Capture code bar
              _qrCode = barcodeScanRes;
          }
        },
      ),   
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdex ,
        onTap: (value) {
          print('Boton $value');
          setState(() {            
            currentIdex = value;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        enableFeedback: false,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            label: 'Button 1',
            icon: Icon(Icons.abc)            
          ),
          BottomNavigationBarItem(
            label: 'Button 2',
            icon: Icon(Icons.abc)
          ),
          BottomNavigationBarItem(
            label: 'Button 3',
            icon: Icon(Icons.abc)
          ),
        ]
      ),
    );
  }
}