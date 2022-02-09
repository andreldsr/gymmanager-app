import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:prototipo_personalizacao/data/model/exercise.dart';
import 'package:prototipo_personalizacao/data/repository/exercise_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.repository}) : super(HomeInitial()) {
    _load();
  }

  ExerciseRepository repository;

  void _load() async {
    emit(HomeLoading());
    await _loadInitialState();
  }

  _loadInitialState() async {
    final exercises = await repository.getAllExercise();
    emit(HomeLoaded(exercises));
  }
}
