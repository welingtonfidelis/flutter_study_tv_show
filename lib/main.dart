import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_show_data/tv_show_card.dart';
import 'package:tv_show_data/tv_show_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool themeModeIsLight = true;

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
      ),
      cardTheme: CardThemeData(
        color: colorSchemaDark.secondaryContainer,
        shadowColor: colorSchemaDark.onSurface,
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    void _changeThemeMode() {
      setState(() {
        themeModeIsLight = !themeModeIsLight;
      });
    }

    return MaterialApp(
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: themeModeIsLight ? ThemeMode.light : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Eu Amo Séries'),
              IconButton(
                icon: Icon(
                  themeModeIsLight ? Icons.light_mode : Icons.dark_mode,
                ),
                tooltip: 'Tema',
                onPressed: _changeThemeMode,
              ),
            ],
          ),
        ),
        //   body: ListView(
        //     children: [
        //       ...favTvShowList.map((tvShow) => TvShowCard(tvShow: tvShow)),
        //     ],
        //   ),
        // ),
        body: ListView.builder(
          itemBuilder: (context, index) =>
              TvShowCard(tvShow: favTvShowList[index], index: index),
          itemCount: favTvShowList.length,
        ),
      ),
    );
  }
}
