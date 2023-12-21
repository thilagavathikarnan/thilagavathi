import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ht_re/model/banner_model.dart';
import 'package:ht_re/model/team_model.dart';
import 'package:ht_re/service/common_service.dart';
import 'package:ht_re/service/common_var.dart';
import 'package:ht_re/service/task_services.dart';
import 'package:ht_re/view/task/task_add.dart';
import 'package:ht_re/view/task/task_view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shimmer/shimmer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   DateTime? _selectedDate = DateTime.now();

   double? height;
  double? width;
   BannerModel? data;
   // List<TeamModel>? teamList;
   PageController controller = PageController();
   int _curr=0;
   List _list = [
'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_640.jpg',
   ];
   void initState()
   {
     super.initState();
      bannerSectio();



   }

   void bannerSectio() async{

      CommonService().BannerService().then((value)
      {
        setState(() {
          data = value;
          print("GetDta");
          print(data);
        });
      });
      // TaskServices().getTeamList().then((List<TeamModel>? value)
      // {
      //
      //   setState(() {
      //     CommonVariable().teamList = value;
      //     print("fvfknvklnfklbnkfl");
      //     print(value![0].name);
      //   });
      //
      // } as FutureOr Function(dynamic value));
      //


   }

   CalendarFormat _calendarFormat = CalendarFormat.week;
   DateTime _focusedDay = DateTime.now();
   DateTime _selectedDay = DateTime.now();

   @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.pink,
        leading: InkWell(
            onTap: () {
              // _scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
                child: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                  size: 30,
                ))),
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
            SizedBox(height: 5,),
            Text("",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

      ),
      floatingActionButton: InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskView()));
        },
        child: Container(
          width: 120,
          height: 40,
          padding: EdgeInsets.all(08),
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(18)
          ),
          child: Center(child: Text("Task")),


        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            data == null?
            Container(

              child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade600,
                  highlightColor: Colors.blue,
                  child: Container(
                      height:180

                  )
              ),

            ):

            CarouselSlider(
              items: [
                for (int i = 0; i < data!.data.length; i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(data!.data[i].fullImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
              // items: [
              //   //1st Image of Slider
              //   Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       image: const DecorationImage(
              //         image: AssetImage('assets/images/meditaion2.webp'),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              //
              //   //2nd Image of Slider
              //   Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       image: const DecorationImage(
              //         image: AssetImage('assets/images/meditaion1.jpeg'),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              //
              //   //3rd Image of Slider
              //   Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       image: const DecorationImage(
              //         image: AssetImage('assets/images/meditaion3.webp'),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.9,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 16.0,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    calendarFormat: _calendarFormat,
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                  ),
                  Text("Today Task",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
