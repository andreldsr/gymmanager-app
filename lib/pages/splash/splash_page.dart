import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototipo_personalizacao/extensions/colors.dart';
import 'package:prototipo_personalizacao/pages/splash/splash_cubit.dart';
import 'package:prototipo_personalizacao/pages/splash/widgets/splash_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.read<SplashCubit>();
    return BlocConsumer<SplashCubit, SplashState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is SplashLoaded) {
          Navigator.of(context).pushReplacementNamed("/home");
        }
      },
      builder: (context, state) {
        if (state is SplashLoading) {
          return buildLoading(state, size);
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildLoading(SplashLoading state, Size size) {
    return Container(
      color: HexColor.fromHex(state.primaryColor),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogo(color: state.logoColor, height: size.height / 3),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              child: const LinearProgressIndicator(),
              width: size.width * 0.8,
            )
          ],
        ),
      ),
    );
  }
}
