import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tv_show_data/add_tv_show_screen.dart';
import 'package:tv_show_data/custom_drawer.dart';
import 'package:tv_show_data/tv_show_data.dart';
import 'package:tv_show_data/tv_show_model.dart';
import 'package:tv_show_data/tv_show_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TvShowModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TvShow> tvShows = favTvShowList;

  // screen control
  int currentScreenIndex = 0;
  List<Widget> get screens => [
    TvShowScreen(),
    AddTvShowScreen(
      backToHome: () {
        switchScreen(0);
      },
    ),
  ];
  void switchScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  // theme Control
  bool themeModeIsDark = false;
  void switchThemeMode() {
    setState(() {
      themeModeIsDark = !themeModeIsDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Color(0xff8716d5);

    var colorSchema = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    var colorSchemaDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    var customTheme = ThemeData(
      colorScheme: colorSchema,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchema.primary,
        titleTextStyle: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchema.onPrimary,
          fontFamily: GoogleFonts.lobster().fontFamily,
        ),
        iconTheme: IconThemeData(color: colorSchema.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchema.secondaryContainer,
        shadowColor: colorSchema.onSurface,
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    var customThemeDark = ThemeData(
      colorScheme: colorSchemaDark,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemaDark.onPrimary,
        titleTextStyle: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemaDark.primary,
          fontFamily: GoogleFonts.lobster().fontFamily,
        ),
        iconTheme: IconThemeData(color: colorSchemaDark.primary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchemaDark.secondaryContainer,
        shadowColor: colorSchemaDark.onSurface,
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    return MaterialApp(
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: themeModeIsDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Eu Amo Séries')],
          ),
        ),
        drawer: CustomDrawer(
          switchThemeMode: switchThemeMode,
          themeModeIsDark: themeModeIsDark,
          switchScreen: switchScreen,
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
