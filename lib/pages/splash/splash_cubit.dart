import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prototipo_personalizacao/data/model/config.dart';
import 'package:prototipo_personalizacao/data/repository/config_repository.dart';
import 'package:prototipo_personalizacao/extensions/colors.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.configRepository}) : super(SplashInitial()) {
    load();
  }

  ConfigRepository configRepository;
  Config? _config;

  void load() async {
    try {
      await _loadInitialState();
      final config = await configRepository.loadNewConfig();
      if (config != null) {
        await configRepository.updateLocalConfig(config);
        _config = config;
      }
    } finally {
      Timer(const Duration(seconds: 3), () => emit(SplashLoaded(_config!)));
    }
  }

  _loadInitialState() async {
    _config = await configRepository.getConfig();
    _config ??= Config(
        primaryColor: Colors.blue.toHex(),
        secondaryColor: Colors.orangeAccent.toHex(),
        textColor: Colors.black.toHex(),
        backgroundColor: Colors.white.toHex(),
        showExercisePhoto: true,
        logoColor: Colors.white.toHex(),
        headingTextFont: "Roboto",
        subtitleTextFont: "Roboto",
        bodyTextFont: "Roboto",
        blackPageTitle: false);
    final logoColor = _config!.logoColor!;
    final primaryColor = _config!.primaryColor!;
    emit(SplashLoading(logoColor, primaryColor));
  }
}
