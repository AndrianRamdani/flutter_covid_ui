import 'package:covid/widgets/table_indo.dart';
import 'package:flutter/material.dart';
import 'package:covid/config/palette.dart';
import 'package:covid/widgets/widgets.dart';
import 'package:covid/widgets/table_global.dart';

class StatsScreen extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/covit.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(1.0),
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 20,
                  child: RichText(
                    text: TextSpan(
                        text: "Coronavirus \n",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                        children: [
                          TextSpan(
                              text: "Global & Indonesia LiveData.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20))
                        ]),
                  ),
                )
              ],
            ),
             Transform.translate(
              offset: Offset(0.0, -(height * 0.3 - height * 0.26)),
              child: Container(
                width: width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          unselectedLabelColor: Colors.grey[400],
                          unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          tabs: <Widget>[
                            Tab(
                              child: Text("Global"),
                            ),
                            Tab(
                              child: Text("Indonesia"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Data Corona Virus',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                         ),
                         SizedBox(
                          height: 10,
                        ),
                          Container(
                          height: height * 0.6,
                          child: TabBarView(
                            children: <Widget>[
                              TableGlobal(),
                              TableIndonesia(),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),),);
  }
}
//   SliverPadding _buildHeader() {
//     return SliverPadding(
//       padding: const EdgeInsets.all(20.0),
//       sliver: SliverToBoxAdapter(
//         child: Text(
//           'CoronaVirus Data',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 25.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   SliverToBoxAdapter _buildRegionTabBar() {
//     return SliverToBoxAdapter(
//       child: DefaultTabController(
//         length: 2,
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20.0),
//           height: 50.0,
//           decoration: BoxDecoration(
//             color: Colors.white24,
//             borderRadius: BorderRadius.circular(25.0),
//           ),
//           child: Column(
//           children: <Widget>[
//          TabBar(
//             indicator: BubbleTabIndicator(
//               tabBarIndicatorSize: TabBarIndicatorSize.tab,
//               indicatorHeight: 40.0,
//               indicatorColor: Colors.white,
//             ),
//             labelStyle: Styles.tabTextStyle,
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.white,
//             tabs: <Widget>[
//               Text('Indonesia'),
//               Text('Global'),
//             ],
//           ),
//           SizedBox(height: 10,),
                        
//           Container(
//             height: 600,
//             child: TabBarView(
//               children: <Widget>[
//                 TableGlobal(),
//               ],
//             ),
//           ),
//           ],
//           ),
//         ),
//       ),
//     );
//   }

//  }