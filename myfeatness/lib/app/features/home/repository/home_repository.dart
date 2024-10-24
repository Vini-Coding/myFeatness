import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myfeatness/app/features/home/model/article.dart';

class HomeRepository {
  Future<List<Article>> getData(String link) async {
    Uri url = Uri.parse(link);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Converte o corpo da resposta para Map<String, dynamic>
      Map<String, dynamic> data = json.decode(response.body);

      // Extrai a lista de artigos do JSON
      List<dynamic> articlesJson = data['articles'];

      // Mapeia a lista de JSONs para objetos Article
      List<Article> articles = articlesJson.map((articleJson) {
        return Article.fromMap(articleJson);
      }).toList();

      return articles;
    } else {
      throw Exception(
          'Falha ao carregar os artigos. Status: ${response.statusCode}');
    }
  }
}
