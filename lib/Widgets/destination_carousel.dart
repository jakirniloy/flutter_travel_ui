import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class destinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Destinations',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),)
              ,GestureDetector(
                onTap: (){
                print("see all");

                },
                child: Text('See All',style:
                TextStyle(color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),),
              )
            ],
          ),
        ),
        Container(
          height: 300.0,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: destinations.length,
            itemBuilder: (BuildContext context,int index){
              Destination destination =  destinations[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 210,

                child: Stack(
                  alignment: Alignment.topCenter,

                  children: [
                    Positioned(
                      bottom:9,
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${destination.activities.length} activites',style:TextStyle(fontSize: 22.00,fontWeight: FontWeight.w600),),
                              Text(destination.description,style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey)),
                            ],
                          ),
                        ),

                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)
                    ,boxShadow: [
                      BoxShadow(
                        color:Colors.black26,
                        offset: Offset(0.0,2.0),
                        blurRadius: 6.0,
                      )
                        ]
                    ),
                    child: Stack(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            height: 190.0,width: 190.0,
                          image: AssetImage(destination.imageUrl),
                          fit: BoxFit.cover,),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(destination.city,
                              style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.2),)
                            ,
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationArrow,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    destination.country,
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  )

                  ],
                ),
              );

            },

          ),
        )

      ],
    );
  }
}




