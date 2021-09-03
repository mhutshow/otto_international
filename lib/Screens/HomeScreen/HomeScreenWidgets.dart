import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otto_int/Utils/Colors.dart';
import 'package:otto_int/Utils/removeHtml.dart';

class ListPosts extends StatelessWidget {
  final int index;
  final String postTitle;
  final String content;
  final String date;
  ListPosts({required this.postTitle, required this.date, required this.content, required this.index,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15 , right: 15 , top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:  ottoPrimary.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(4, 7), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 13),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color:  ottoPrimary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(child: Text((index+1).toString() ,style: TextStyle(color:  ottoPrimary, fontSize: 17, fontWeight: FontWeight.w600),)),
                ),
                SizedBox(width: 20,),
                Container(child: Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Text(postTitle ,overflow: TextOverflow.ellipsis , style: TextStyle( fontSize:17, fontWeight: FontWeight.w800), )),
                    Text( removeAllHtmlTags(content) ,overflow: TextOverflow.ellipsis ,maxLines: 2, style: TextStyle( fontSize:15, fontWeight: FontWeight.w500), ),
                    SizedBox(height: 5,),
                    Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(date)) ,overflow: TextOverflow.ellipsis , style: TextStyle( fontSize:12, fontWeight: FontWeight.w300), ),
                  ],
                ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class AnimatedButton extends StatelessWidget {
  const AnimatedButton({ required this.buttonColor, required this.icon, required this.onTap});
  final Color buttonColor;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        child: Animator<double>(
          duration: Duration(milliseconds: 1500),
          cycles: 0,
          curve: Curves.easeInOut,
          tween: Tween<double>(begin: 0.0, end: 15.0),
          builder: (context, animatorState, child) => Container(
            margin: EdgeInsets.all(animatorState.value),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor,
              boxShadow: [
                BoxShadow(
                  color: buttonColor.withOpacity(0.5),
                  offset: Offset(0, 5),
                  blurRadius: 30,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}