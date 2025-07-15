import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.switchThemeMode,
    required this.themeModeIsDark,
    required this.switchScreen,
  });

  final Function() switchThemeMode;
  final Function(int index) switchScreen;
  final bool themeModeIsDark;

  @override
  Widget build(BuildContext context) {
    void handleSwitchScreen(int index) {
      switchScreen(index);
      Navigator.of(context).pop();
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Eu Amo Séries',
                    style: GoogleFonts.lobster(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: switchThemeMode,
                    label: Text('Mudar tema'),
                    icon: Icon(
                      themeModeIsDark
                          ? Icons.wb_sunny_rounded
                          : Icons.nightlight_round_sharp,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              handleSwitchScreen(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Adicionar série"),
            onTap: () {
              handleSwitchScreen(1);
            },
          ),
        ],
      ),
    );
  }
}
