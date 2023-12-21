import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(
      () {
        _notifications = newValue;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width < Breakpoints.sm
                ? width * 0.5
                : width < Breakpoints.md
                    ? width * 0.45
                    : width < Breakpoints.lg
                        ? width * 0.4
                        : width < Breakpoints.xl
                            ? width * 0.35
                            : width < Breakpoints.xxl
                                ? width * 0.3
                                : width >= Breakpoints.xxl
                                    ? width * 0.3
                                    : 0.3,
            maxHeight: height,
          ),
          child: ListView(
            children: [
              SwitchListTile(
                value: _notifications,
                onChanged: _onNotificationsChanged,
                title: Text(
                    "Enable Notification ${MediaQuery.of(context).size.width}"),
                subtitle: const Text("detailed information"),
              ),
              CheckboxListTile(
                activeColor: Colors.black,
                checkColor: Colors.white,
                value: _notifications,
                onChanged: _onNotificationsChanged,
                title: const Text(
                  "Enable notifications",
                ),
              ),
              ListTile(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1992),
                    lastDate: DateTime(2024),
                  );
                  print(date);
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  print(time);
                  final booking = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(1992),
                    lastDate: DateTime(2024),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          appBarTheme: const AppBarTheme(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.deepPurple,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  print(booking);
                },
                title: const Text("What is your birthday?"),
              ),
              ListTile(
                title: const Text("Log out (iOS)"),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("No"),
                        ),
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Log out (Android)"),
                textColor: Colors.red,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please don't go"),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(FontAwesomeIcons.car),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Log out (iOS / Bottom)"),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Are you sure?"),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Not log out"),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Yes Please"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const AboutListTile(
                applicationVersion: "1.0",
                applicationLegalese: "Don't copy me.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
