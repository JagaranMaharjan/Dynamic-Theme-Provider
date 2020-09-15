import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme?dark:light,
            home: Scaffold(
              //----------------app bar-------------------------------------
              appBar: AppBar(
                title: Text("Theme Provider"),
              ),
              body: Column(
                children: [
                  Consumer<ThemeNotifier>(
                    builder: (context, notifier, _){
                      //--------------------use of switch tile list to change theme------------------//
                      return SwitchListTile(
                        value: notifier.darkTheme,
                        onChanged: (val) {
                          notifier.toggleTheme();
                        },
                        inactiveThumbColor: Colors.blueGrey,
                        title: Text(notifier.darkTheme?"Dark Theme":"Light Theme"),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
