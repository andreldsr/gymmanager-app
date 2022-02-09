import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototipo_personalizacao/data/model/config.dart';
import 'package:prototipo_personalizacao/data/model/exercise.dart';
import 'package:prototipo_personalizacao/extensions/colors.dart';
import 'package:prototipo_personalizacao/pages/splash/splash_cubit.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.exercise}) : super(key: key);
  Exercise exercise;
  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    final state = splashCubit.state;
    if (state is SplashLoaded) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor.fromHex(state.config.primaryColor!),
          title: Text(
            "Detalhe",
            style: GoogleFonts.getFont(state.config.headingTextFont!,
                color:
                    state.config.blackPageTitle! ? Colors.black : Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildDetail(exercise, state.config),
        ),
      );
    }

    return const CircularProgressIndicator();
  }

  Widget buildDetail(Exercise exercise, Config config) {
    return Column(
      children: [
        Hero(
          tag: exercise.name ?? "",
          child: SizedBox(
            child: Image.network(
              exercise.image ?? "",
              fit: BoxFit.fill,
            ),
            height: 240,
            width: 360,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          exercise.name ?? "",
          style: GoogleFonts.getFont(config.headingTextFont!, fontSize: 32),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${exercise.series} series",
                style: GoogleFonts.getFont(config.bodyTextFont!,
                    color: HexColor.fromHex(
                        config.secondaryTextColor ?? "#CCCCCC")),
              ),
              Text("${exercise.repetitions} repetições",
                  style: GoogleFonts.getFont(config.bodyTextFont!,
                      color: HexColor.fromHex(
                          config.secondaryTextColor ?? "#CCCCCC")))
            ],
          ),
        ),
        Text(exercise.description ?? "",
            style: GoogleFonts.getFont(config.bodyTextFont!))
      ],
    );
  }
}
