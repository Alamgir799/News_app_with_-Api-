import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news.dart';

class RemoteService {
  Future<News?> getNews() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2023-04-25&to=2023-04-25&sortBy=popularity&apiKey=c59a711bea714779a69e9871d68d7421');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return News.fromJson(data);
      // var articles = data['articles'];
      // print(articles);
    } else {
      return null;
    }
  }
}