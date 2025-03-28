import 'dart:convert';

import 'package:desafio_os/features/login/data/datasources/remote/remote_data_source_interface.dart';
import 'package:desafio_os/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSource implements IDataSources {
  final String apiUrl = 'https://api.example.com/users';

  @override
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar usuários');
    }
  }


}
