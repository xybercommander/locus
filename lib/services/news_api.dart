import 'dart:convert';
import 'package:http/http.dart';
import 'package:locus/modules/news_topics.dart';
import 'package:locus/services/api_constants.dart';

class NewsApi {

  Future<void> getTopHeadlines() async {
    try {
      var url = Uri.parse('https://gnews.io/api/v4/top-headlines?token=${ApiConstants.KEY}&country=in&lang=en');
      var response = await get(url);
      Map data = jsonDecode(response.body);
      // print("DATA -----> $data");

      for(int i = 0; i < 10; i++) {
        TopHeadLines.topHeadLinesData.add(data['articles'][i]);
      }

    } catch(e) {
      print(e.toString());
    }
  }

  Future<void> getNationNews() async {
    try {
      var url = Uri.parse('https://gnews.io/api/v4/top-headlines?token=${ApiConstants.KEY}&country=in&lang=en&topic=nation');
      var response = await get(url);
      Map data = jsonDecode(response.body);
      // print("DATA -----> $data");

      for(int i = 0; i < 10; i++) {
        NationNews.nationNewsData.add(data['articles'][i]);
      }

    } catch(e) {
      print(e.toString());
    }
  }

  Future<void> getGlobalNews() async {
    try {
      var url = Uri.parse('https://gnews.io/api/v4/top-headlines?token=${ApiConstants.KEY}&country=in&lang=en&topic=world');
      var response = await get(url);
      Map data = jsonDecode(response.body);
      // print("DATA -----> $data");

      for(int i = 0; i < 10; i++) {
        WorldNews.worldNewsData.add(data['articles'][i]);
      }

    } catch(e) {
      print(e.toString());
    }
  }

  // Future<void> getTechNews() async {
  //   try {
  //     var url = Uri.parse('https://gnews.io/api/v4/top-headlines?token=${ApiConstants.KEY}&country=in&lang=en&topic=technology');
  //     var response = await get(url);
  //     Map data = jsonDecode(response.body);
  //     print("DATA -----> $data");

  //     for(int i = 0; i < 10; i++) {
  //       TechNews.techNewsData.add(data['articles'][i]);
  //     }

  //   } catch(e) {
  //     print(e.toString());
  //   }
  // }

}