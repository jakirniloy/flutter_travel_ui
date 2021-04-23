import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:flutter_travel_ui/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class hotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exclusive Hotels',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,
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

            itemCount: hotels.length,
            itemBuilder: (BuildContext context,int index){
              Hotel hotel = hotels [index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 240,

                child: Stack(
                  alignment: Alignment.topCenter,

                  children: [
                    Positioned(
                      bottom:9,
                      child: Container(
                        height: 120,
                        width: 240,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Text(hotel.name,style:TextStyle(fontSize: 22.00,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text(hotel.address,style:TextStyle(fontWeight: FontWeight.w600,color: Colors.grey)),
                            SizedBox(height: 2.0,),
                              Text('\$${hotel.price}/night',style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                              ),)

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
                              height: 190.0,width: 220.0,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,),
                          ),


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
