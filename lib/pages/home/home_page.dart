import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototipo_personalizacao/data/model/config.dart';
import 'package:prototipo_personalizacao/data/model/exercise.dart';
import 'package:prototipo_personalizacao/extensions/colors.dart';
import 'package:prototipo_personalizacao/pages/home/home_cubit.dart';
import 'package:prototipo_personalizacao/pages/splash/splash_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoaded) {
        return _buildPage(splashCubit.state, state.exercises);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }

  Widget _buildPage(SplashState state, List<Exercise> exercises) {
    if (state is SplashLoaded) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor.fromHex(state.config.primaryColor!),
          title: Text(
            "Inicio",
            style: GoogleFonts.getFont(state.config.headingTextFont!,
                color:
                    state.config.blackPageTitle! ? Colors.black : Colors.white),
          ),
        ),
        backgroundColor: HexColor.fromHex(state.config.backgroundColor!),
        body: _buildExerciseList(exercises, state.config),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  Widget _buildExerciseList(List<Exercise> exercises, Config config) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: exercises.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed("/detail", arguments: exercises[index]);
        },
        child: Card(
          color: HexColor.fromHex(config.secondaryColor!),
          child: Row(
            children: [
              SizedBox(
                  width: 64,
                  height: 64,
                  child: Hero(
                    tag: exercises[index].name ?? "",
                    child: Image.network(
                      exercises[index].image ?? "",
                      fit: BoxFit.fill,
                    ),
                  )),
              const SizedBox(
                width: 16,
              ),
              Text(
                exercises[index].name ?? "",
                style: GoogleFonts.getFont(config.bodyTextFont!,
                    color: HexColor.fromHex(config.textColor!),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
