import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/card_image_widget.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

import '../widgets/card_sample_widget.dart';

class CardSampleScreen extends StatelessWidget {
   
  const CardSampleScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
            CardSampleWidget(
              titulo: 'PRueba',               
            ),
            CardImageSample(url:'assets/images/landing.jpg', caption:'imagen de la facultad'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
            CardImageSample(url:'assets/images/landing.jpg'),            
        ],
      ),
    );
  }
}

