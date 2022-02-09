import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:prototipo_personalizacao/data/model/exercise.dart';
import 'package:prototipo_personalizacao/data/repository/exercise_repository.dart';

part 'detail_state.dart';

class HomeCubit extends Cubit<DetailState> {
  HomeCubit({required this.repository}) : super(DetailInitial()) {
    _load();
  }

  ExerciseRepository repository;

  void _load() async {
    emit(DetailLoading());
    await _loadInitialState();
  }

  _loadInitialState() async {
    final exercises = await repository.getAllExercise();
    emit(DetailLoaded(exercises[0]));
  }
}
