import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/preferences.dart';
import 'package:flutter_repo_guide/providers/theme_provider.dart';
import 'package:flutter_repo_guide/screens/pageview_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/screens.dart';

void main() async {
  // TODO: Comentar
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  await Preferences.initShared();

  // runApp(const MyApp());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      // theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
      theme: Provider.of<ThemeProvider>(context, listen: true).temaActual,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'counter': (context) => const CounterPage(),
        'listview': (context) => const ListViewScreen(),
        'listview1': (context) => const ListBuilderScreen(),
        'listview2': (context) => ListBuilderScreen2(),
        'flexbox': (context) => const FlexScreenColumn(),
        'animated': (context) => const ContainerPage(),
        'qr_code': (context) => const QrScannerScreen(),
        'swipper': (context) => const CardSwiperScreen(),
        'slivers': (context) => const SliversScreen(),
        'profile': (context) => const ProfileScreen(),
        'alert': (context) => const AlertScreen(),
        'provider': (context) => const DemoProviderScreen(),
        'photo_provider': (context) => const PhotosScreen(),
        'pageview': (context) => PageViewScreen(),
        'infinite_scroll': (context) => const InfiniteScrollScreen(),
        'future_builder1': (context) => FutureBuilderScreen(),
        'future_builder2': (context) => FuturePhotoScreen(),
        'form_screen': (context) => const FormScreen(),
        'fingerprint_screen': (context) => const FingerPrintScreen(),
      },
    );
  }
}
