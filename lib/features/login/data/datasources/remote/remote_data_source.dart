import 'package:desafio_os/features/login/data/datasources/remote/remote_data_source_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/user_model.dart';

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

  Future<void> fetchDataFromDatabricks() async {
    // Configurações da conexão
    const String accessToken =
        "<access-token>"; // Substitua pelo seu token de acesso
    const String tableName =
        "<nome_da_tabela>"; // Substitua pelo nome da tabela

    // Corpo da requisição SQL
    final Map<String, dynamic> requestBody = {
      "statement": "SELECT * FROM treinamentos.gold.$tableName"
    };

    try {
      // Fazendo a requisição POST
      final response = await http.post(
        Uri.parse("jdbc:databricks://adb-926216925051160.0.azuredatabricks.net:443;HttpPath=/sql/1.0/warehouses/e44141a47229ebf8"),
        headers: {
            "Authorization": "Bearer $accessToken",
            "Content-Type": "application/json",
          },
        body: jsonEncode(requestBody),
      );

      // Verificando a resposta
      if (response.statusCode == 200) {
        final data = response.body;
        print("Dados recebidos: $data");
      } else {
        print("Erro: ${response.statusCode}");
        print("Mensagem: ${response.body}");
      }
    } catch (e) {
      print("Erro ao conectar ao Databricks: $e");
    }
  }
}
