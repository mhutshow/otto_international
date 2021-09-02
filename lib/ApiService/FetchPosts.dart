import 'package:wordpress_api/wordpress_api.dart';

class WpData{
  ///The date the object was published, in the site's timezone.
  final String? date;

  ///The title for the object.
  final String? title;

  ///The content for the object.
  final String? content;

  ///The ID for the author of the object.
  final int? author;

  ///Meta fields.
  final dynamic meta;

  WpData({
    this.date,
    this.title,
    this.content,
    this.author,
    this.meta,
  });

  static Future<List<WpData>> getWpDatas() async{
    List<WpData>result=[];
    final api = WordPressAPI('https://otto.letsflutter.com/');
    final WPResponse res = await api.posts.fetch();

    for (final post in res.data) {
      print(post.guid);
      result.add(WpData(date: post.date,title: post.title ,content:  post.content,author: post.author, meta: post.meta));
      print(result.length);
    }
    return result;
  }
}