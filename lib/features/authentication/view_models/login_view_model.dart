import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/utils.dart';

class LogingViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () async => await _repository.signIn(email, password));
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      //     context.go("/home");
    }
  }
}

final loginProvider = AsyncNotifierProvider<LogingViewModel, void>(
  () => LogingViewModel(),
);
