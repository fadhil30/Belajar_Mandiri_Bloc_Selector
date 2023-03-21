import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({'name': '-', 'age': 0});

  void changeName(String newName) {
    emit({
      'name': newName,
      'age': state['age'],
    });
  }

  void changeAge(int newAge) {
    if (newAge < 0) {
    } else {
      emit({
        'name': state['name'],
        'age': newAge,
      });
    }
  }
}
