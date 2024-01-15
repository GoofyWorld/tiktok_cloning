import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  // bool _notifications = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              /*
              SwitchListTile.adaptive(
                value: context.watch<VideoConfig>().isMuted,
                onChanged: (value) =>
                    context.read<VideoConfig>().toggleIsMuted(),
                title: const Text("Auto Mute"),
                subtitle: const Text("Videos muted by default"),
              ),

                SwitchListTile(
                value: _notifications,
                onChanged: _onNotificationsChanged,
                title: Text(
                    "Enable Notification ${MediaQuery.of(context).size.width}"),
                subtitle: const Text("detailed information"),
              ),
              SwitchListTile(
                value: _notifications,
                onChanged: _onNotificationsChanged,
                title: Text(
                    "Enable Notification ${MediaQuery.of(context).size.width}"),
                subtitle: const Text("detailed information"),
              ),
              
              AnimatedBuilder(
                animation: darkmodeConfig,
                builder: (context, child) => SwitchListTile(
                  value: darkmodeConfig.value,
                  onChanged: (value) {
                    setState(() {
                      darkmodeConfig.value = !darkmodeConfig.value;
                    });
                  },
                  title: const Text("Dark Mode On/Off"),
                  subtitle: const Text("Tap for brightness change"),
                ),
              ),
              AnimatedBuilder(
                animation: videoConfig,
                builder: (context, child) => SwitchListTile(
                  value: videoConfig.value,
                  onChanged: (value) {
                    videoConfig.value = !videoConfig.value;
                  },
                  title: const Text("Mute Video "),
                  subtitle: const Text("Videos will be muted by"),
                ),
              ), */
              SwitchListTile(
                // value: context.watch<PlaybackConfigViewModel>().muted,
                value: ref.watch(playbackConfigProvider).muted,
                onChanged: (value) =>
                    {ref.read(playbackConfigProvider.notifier).setMuted(value)},
                //     context.read<PlaybackConfigViewModel>().setMuted(value),

                title: const Text("Mute Video"),
                subtitle: const Text("Videos will be muted by default."),
              ),
              SwitchListTile(
                // value: context.watch<PlaybackConfigViewModel>().autoplay,
                value: ref.watch(playbackConfigProvider).autoplay,
                onChanged: (value) => {
                  ref.read(playbackConfigProvider.notifier).setAutoplay(value)
                },
                // context.read<PlaybackConfigViewModel>().setAutoplay(value),
                title: const Text("Autoplay"),
                subtitle:
                    const Text("Videos will start playing automatically."),
              ),
              CheckboxListTile(
                activeColor: Colors.black,
                checkColor: Colors.white,
                // value: _notifications,
                value: false,
                // onChanged: _onNotificationsChanged,
                onChanged: (value) {},
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
                  if (kDebugMode) {
                    print(date);
                  }

                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (kDebugMode) {
                    print(time);
                  }

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
                  if (kDebugMode) {
                    print(booking);
                  }
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
                          onPressed: () {
                            ref.read(authRepo).signOut();
                            context.go("/");
                          },
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
