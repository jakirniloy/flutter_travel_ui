
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/Widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/Widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  int  currentTeb = 0;

  List<IconData>icons =[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget buildicon(int index){
    return GestureDetector(
     onTap: (){
       setState(() {
         selectedIndex =index;
       });
       print(selectedIndex);
     },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(color: selectedIndex==index? Theme.of(context).accentColor:Color(0xFFE7EBEE)
        ,borderRadius: BorderRadius.circular(30.0)
        ),child: Icon(icons[index],
      size: 25.0,
      color: selectedIndex==index? Theme.of(context).primaryColor:Color(0xFFB4C1C4)

      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0,),
          children: [ 
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 120.0),
              child: Text("What you would like to find?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold

              ),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:icons.asMap().entries.map(
                  (MapEntry map)=>buildicon(map.key

                  )).toList(),
              ),
            SizedBox(height: 20,),
            destinationCarousel(),
            SizedBox(height: 20,),
            hotelCarousel(),

            
          ],
          
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentTeb,
        onTap: (int value){

        setState(() {
          currentTeb = value;
        });
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30.0,
          ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
         backgroundImage:  NetworkImage('http://3.bp.blogspot.com/-P_qMx1hPnBM/YEpv_kbsiqI/AAAAAAAA2p0/mJ1TPJR4gKgZB3UhYQmZF5W4UjR9usYPwCK4BGAYYCw/s1600/52286661_2792678240957593_1876677421592215552_o.jpg'),
    ),
            title: SizedBox.shrink(),
          ),

        ],
      ),
    );
  }
}