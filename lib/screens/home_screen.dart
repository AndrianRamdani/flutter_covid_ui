import 'package:covid/api/http_service.dart';
import 'package:covid/counter.dart';
import 'package:flutter/material.dart';
import 'package:covid/config/palette.dart';
import 'package:covid/widgets/widgets.dart';
import 'package:covid/api/post_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get index => null;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Coronavirus',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Global & Indonesia LiveData',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Coronavirus Global',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child:Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
              // children: <Widget>[
              //   Counter(
              //     number: 1046,
              //     title: "Positif",
              //   ),
              //   Counter(
              //     number: 87,
              //     title: "Sembuh",
              //   ),
              //   Counter(
              //     number: 46,
              //     title: "Meninggal",
              //   ),
              // ],
              ),),
            ),
          ],
        ),
        ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    final DataIndonesia _getIndonesia = new DataIndonesia();
   return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Coronavirus Indonesia',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: FutureBuilder(
            future: _getIndonesia.getDataIndonesia(),
            builder: (BuildContext context, AsyncSnapshot<List<Covid>> snapshot) {
              if (snapshot.hasData) {
                List<Covid> dataIndonesia = snapshot.data;
                return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Positif'),
                    Text(dataIndonesia[index].positif),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Sembuh'),
                    Text(dataIndonesia[index].sembuh),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Meninggal'),
                    Text(dataIndonesia[index].meninggal),
                  ],
                ),
              ].toList(),
            );
            }else{
              return Center(
                  child: CircularProgressIndicator(),
                );
            }
          }
        ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
