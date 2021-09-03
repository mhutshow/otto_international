import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otto_int/ApiService/FetchPosts.dart';
import 'package:otto_int/Screens/HomeScreen/DetailsScreen.dart';
import 'package:otto_int/Screens/HomeScreen/HomeScreenWidgets.dart';
import 'package:otto_int/Utils/removeHtml.dart';
import 'package:otto_int/Utils/Colors.dart';
import 'package:get/get.dart';

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
                    Expanded(flex: 12,child: Text( dataLoaded ? 'Content : ${removeAllHtmlTags(wpData[0].content.toString())}' : 'Fetching content...' ,overflow: TextOverflow.visible, textAlign: TextAlign.justify, style: TextStyle(color: Colors.white),)),
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
                  return GestureDetector(
                    onTap:(){
                      Get.to(PostDetails() , arguments: wpData[index]);
                    },
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
