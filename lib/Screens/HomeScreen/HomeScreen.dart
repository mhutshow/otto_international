import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otto_int/ApiService/FetchPosts.dart';
import 'package:otto_int/Utils/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WpData> wpData=[];
  bool dataLoaded=false;
  fetchData() async {
    wpData = await WpData.getWpDatas();
    if(mounted){
      setState((){
        dataLoaded=true;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedButton(
        buttonColor: ottoPrimary,
        icon: Icons.check,
        onTap: (){
          //Save
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
              child: Text('Otto Int Newsroom' , style: TextStyle(color: ottoPrimary , fontSize: 28),),
            ),
            SizedBox(height : 20,),
            Container(
              margin:const EdgeInsets.only(left: 20, right: 20,bottom: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ottoPrimary,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50))
              ),
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2,child: Text('Most Recent' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)),
                    Expanded(flex: 3,child: Text( dataLoaded ? 'Title : ${wpData[0].title.toString()}' : 'Fetching title...' ,overflow: TextOverflow.visible, style: TextStyle(color: Colors.white),)),
                    Expanded(flex: 7,child: Text( dataLoaded ? 'Content : ${wpData[0].content.toString()}' : 'Fetching content...' ,overflow: TextOverflow.visible, textAlign: TextAlign.justify, style: TextStyle(color: Colors.white),)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataLoaded?wpData.length:1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if(!dataLoaded){
                    return Center(child: CircularProgressIndicator(color: ottoPrimary,));
                  }
                  return Container(
                    child: ListPosts(
                      index: index,
                      date: wpData[index].date.toString(),
                      content: wpData[index].content.toString(),
                      postTitle: wpData[index].title.toString(),
                    ),
                  );
                },),
            ),
          ],
        ),
      ),
    );
  }
}
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
                    SizedBox(height: 5,),
                    Text(content ,overflow: TextOverflow.ellipsis , style: TextStyle( fontSize:15, fontWeight: FontWeight.w500), ),
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