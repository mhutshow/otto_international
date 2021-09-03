import 'package:otto_int/ApiService/ApiService.dart';

class WpData{
  ///The date the object was published, in the site's timezone.
  final String? date;

  ///The title for the object.
  final String? title;

  ///The content for the object.
  final String? content;

  ///The ID for the author of the object.
  final int? author;


  WpData({
    this.date,
    this.title,
    this.content,
    this.author,
  });

  static Future<List<WpData>> getWpDatas() async{
    return ApiService.fetchPosts();
  }
}