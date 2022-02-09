part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {
  final String logoColor;
  final String primaryColor;

  SplashLoading(this.logoColor, this.primaryColor);
}

class SplashLoaded extends SplashState {
  final Config config;

  SplashLoaded(this.config);
}
