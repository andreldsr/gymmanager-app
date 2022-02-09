import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigInitial());
}
