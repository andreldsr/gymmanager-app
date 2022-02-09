import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototipo_personalizacao/data/config/hive_main.dart';
import 'package:prototipo_personalizacao/data/model/exercise.dart';
import 'package:prototipo_personalizacao/data/repository/exercise_repository.dart';
import 'package:prototipo_personalizacao/data/shared/config_hive.dart';
import 'package:prototipo_personalizacao/pages/details/detail_page.dart';
import 'package:prototipo_personalizacao/pages/home/home_cubit.dart';
import 'package:prototipo_personalizacao/pages/home/home_page.dart';
import 'package:prototipo_personalizacao/pages/splash/splash_cubit.dart';
import 'package:prototipo_personalizacao/pages/splash/splash_page.dart';

import 'data/repository/config_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveMain.start();
  runApp(
    BlocProvider(
        create: (context) => SplashCubit(
            configRepository: ConfigRepository(configHive: ConfigHive())),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashPage(),
        "/home": (context) => BlocProvider(
            create: (context) => HomeCubit(repository: ExerciseRepository()),
            child: const HomePage()),
        "/detail": (context) => DetailPage(
            exercise: ModalRoute.of(context)?.settings.arguments as Exercise)
      },
    );
  }
}
