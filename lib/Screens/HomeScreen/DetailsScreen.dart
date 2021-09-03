
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otto_int/ApiService/ApiService.dart';
import 'package:otto_int/ApiService/FetchPosts.dart';
import 'package:otto_int/Utils/Colors.dart';
import 'package:get/get.dart';
import 'package:otto_int/Utils/removeHtml.dart';
class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}


class _PostDetailsState extends State<PostDetails> {
WpData args=Get.arguments;
String author='Fetching...';

void initState() {
  fetchAuthor();
  super.initState();
}

fetchAuthor() async{
  author = await ApiService.authorInfo(args.author!);
  setState(() {
    print(author);
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Otto Int.'),),
      body: SafeArea(
        child:  Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ottoPrimary,
                  boxShadow: [
                    BoxShadow(
                      color: ottoPrimary.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(4, 7), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title : ${args.title}'.toString(), style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 22),),
                    SizedBox(height: 20,),
                    Text('Author : $author'.toString(), style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 18),),
                    SizedBox(height: 10,),
                    Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(args.date.toString())) ,overflow: TextOverflow.ellipsis , style: TextStyle( fontSize:12, fontWeight: FontWeight.w300 , color: Colors.white), ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ottoPrimary.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(4, 7), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child:  Text(removeAllHtmlTags(args.content.toString()), style: TextStyle( fontWeight: FontWeight.w400 , fontSize: 18),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

