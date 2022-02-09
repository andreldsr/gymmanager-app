part of 'config_cubit.dart';

@immutable
abstract class ConfigState {}

class ConfigInitial extends ConfigState {}

class ConfigReloaded extends ConfigState {}
