import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';

class BiolinkScreen extends ConsumerStatefulWidget {
  const BiolinkScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BiolinkScreenState();
}

class _BiolinkScreenState extends ConsumerState<BiolinkScreen> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bioController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _onSaved() {
    ref.read(usersProvider.notifier).updateBioAndLink(
          _bioController.text,
          _linkController.text,
        );
    Navigator.pop(context, {
      'bio': _bioController.text,
      'link': _linkController.text,
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          data: (data) => Scaffold(
            appBar: AppBar(
              title: const Text("Revise bio and link!"),
              actions: [
                IconButton(
                  onPressed: _onSaved,
                  icon: const FaIcon(
                    FontAwesomeIcons.floppyDisk,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                TextField(
                  // initialValue: data.bio,
                  controller: _bioController,
                  decoration: const InputDecoration(prefixText: "Bio >> "),
                ),
                TextField(
                  //initialValue: data.link,
                  controller: _linkController,
                  decoration: const InputDecoration(prefixText: "Link >> "),
                ),
              ],
            ),
          ),
        );
  }
}
