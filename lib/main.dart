import 'package:flutter/material.dart';
import 'package:quran_app/pages/detailscreen.dart';
import 'package:quran_app/pages/doadetailscreen.dart';
import 'package:quran_app/pages/homescreen.dart';
import 'package:quran_app/pages/splashscreen.dart';

import 'pages/dzikirdetailscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is Map<String, String>) {
            final idSurah = args['id_surah'];
            final namaSurah = args['nama_surah'];
            return DetailScreen(
                id_surah: idSurah,
                nama_surah: namaSurah,);
          } else {
            return const DetailScreen(
                id_surah: "1",
                nama_surah: "Al-Fatihah");
          }
        },
        DzikirDetailScreen.routeName: (context) => DzikirDetailScreen(
            id_dzikir: ModalRoute.of(context)!.settings.arguments as String),
        DoaDetailScreen.routeName: (context) => DoaDetailScreen(
            id_doa: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
