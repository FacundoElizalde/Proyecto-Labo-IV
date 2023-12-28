import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/new_photos.dart';
import '../widgets/drawer_menu.dart';

class PhotosScreen extends StatelessWidget {
   
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context) => PhotosProvider(),
      child: Scaffold(        
        drawer: DrawerMenu(),
        body: Center(
           child: ListaImagenes(),
        ),
      ),
    );
  }
}

class ListaImagenes extends StatelessWidget {  

  ListaImagenes({
    Key? key,    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final listaFotos  = Provider.of<PhotosProvider>(context);
    final GlobalKey<RefreshIndicatorState> _refresIndicatorKey = GlobalKey<RefreshIndicatorState>();

    return MediaQuery.removePadding(context: context,
      removeTop: true,
      removeBottom: true,
      child: Stack(
        children: [
          RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            strokeWidth: 4.0,
            displacement: 40,                     
            key: _refresIndicatorKey,            
            onRefresh: () async {
              print('onRefresh........');
              print('listaFotos.photos.length........${listaFotos.photos.length}');
              return await listaFotos.getNewPhotos();              
            },
            child: ListView.builder(                     
              reverse: false,
              physics: const BouncingScrollPhysics(),
              itemCount: listaFotos.photos.length,
              itemBuilder: (context, index) {                
                //listaFotos.photos[index].urls.small
                return FadeInImage(
                  placeholder: const AssetImage('assets/images/loading.gif'), 
                  image: NetworkImage(listaFotos.photos[index].urls.small)
                );
              },
            ),
          ),     
          if(listaFotos.isLoading)
            Positioned(
              bottom: 40,
              left: size.width * 0.5 - 30,
              child: const _LoadingIcon()
            )
        ],
      ),
    );
  }
}



class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator( color: Colors.blueAccent )
    );
  }
}