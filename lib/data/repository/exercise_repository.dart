import 'package:prototipo_personalizacao/data/model/exercise.dart';
import 'package:dio/dio.dart';

class ExerciseRepository {
  final Dio _dio = Dio();
  Future<List<Exercise>> getAllExercise() async {
    final data =
        await _dio.get("https://gymmanagerandreldsr.herokuapp.com/exercise");
    final list = data.data as List;
    return list.map((e) => Exercise.fromJson(e)).toList();
  }
}
