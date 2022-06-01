import 'package:Tiwee/business_logic/provider/channelProvider.dart';
import 'package:Tiwee/presentation/screens/home/country_channels.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:lottie/lottie.dart';
import 'package:Tiwee/presentation/screens/home/sorted_by_countryPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Tiwee/business_logic/provider/country_provider.dart';
import 'package:Tiwee/presentation/widgets/tv_card.dart';
import 'package:Tiwee/presentation/screens/home/player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Tiwee/presentation/screens/home/menu.dart';
import 'package:wakelock/wakelock.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class myChannels{
   String name;
   String url;

   myChannels({required this.name, required this.url});
}


class TestCard extends StatefulWidget {
  TestCard(this._key);
  GlobalKey<ScaffoldState> _key;
  @override
  State<StatefulWidget> createState() {
    return _FulBackPage(_key);
  }
}
class _FulBackPage extends State<TestCard> {
  _FulBackPage(this._key);
  GlobalKey<ScaffoldState> _key;
  var mainColor = Color.fromARGB(20, 255, 252, 51);
  bool iconShow = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
          Container(
            width: 80, 
            height: MediaQuery.of(context).size.height, 
            color: Color.fromARGB(20, 107, 107, 107),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  iconShow = !iconShow;
                });
              },
            ),
          ),
          Positioned(
            left: 12,
            top: MediaQuery.of(context).size.height / 2,
            child:  Visibility(
              child: Container(
                width: 40, 
                height: 40, 
                color: mainColor,
                child: GestureDetector(
                  child: Icon(
                    FontAwesomeIcons.tv,
                    color: Color.fromARGB(255, 14, 225, 253),
                  ),
                  onTap: () {
                      _key.currentState!.openDrawer();
                      setState(() {
                        iconShow = false;
                      });
                    },
                  ),
                ),
              visible: iconShow,
            ),
          ),
         
          ]
        ),
        
        
      ],
    );
  }
}
class F_Player extends ConsumerWidget {
  F_Player({Key? key, required this.url, required this.country}) : super(key: key);
  final String country;
  final String url;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var betterPlayerConfiguration = BetterPlayerConfiguration(
    autoPlay: true,
    controlsConfiguration: BetterPlayerControlsConfiguration(
      textColor: Colors.white,
      iconsColor: Color.fromARGB(255, 0, 151, 238),
      enableFullscreen: false,
      loadingWidget: SizedBox(
          width: 100,
          child: Lottie.asset(
            kTvLoading,
            width: 60,
            repeat: true,
            reverse: true,
          )),
      showControlsOnInitialize: true,
      showControls: true,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final size = MediaQuery.of(context).size;
    final channels = ref.watch(countryProvider);
    bool path;
    bool videoIsShow = true;
    double videoHigh = 50.0;
    double screenWidth = 0;
    double screenHigh = 0;
    Wakelock.enable();
    
    print("方向方向方向方向方向方向方向方向方向方向方向");
    screenHigh = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    if(MediaQuery.of(context).size.width > MediaQuery.of(context).size.height){
      path = false; //Ricky：橫放的時候，PATH TRUE
      videoHigh = MediaQuery.of(context).size.height;
      print("橫放");
    }
    else if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height){
      path = true; //Ricky：直放的時候，PATH FALSE
      videoHigh = MediaQuery.of(context).size.width/16*9;
      print("直放");
    }
    else{
      path = true;
    }
    print("方向方向方向方向方向方向方向方向方向方向方向");

    List<myChannels> _Channels = [];
    var _darwershow = channels.when(
      data: (d) => List.generate(d[country]!.length, (index) {
        String name = d[country]![index].name;
        String url = d[country]![index].url;

        _Channels.add(myChannels(name:name,url:url));
        print(_Channels.length);
}
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () =>  SizedBox(
          width: 50, child: Lottie.asset(kLoading, width: 60)),
    );

    bool _visible = true;
    
    return Scaffold(
        key: _key, 
        drawer: Drawer(
              child: 
                ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: 
                        Column(
                          children: <Widget>[
                            Text(
                              "Tiwee888",//Ricky：APP上方橫條
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 21
                              ),
                            ), 
                            Container(
                              height: 50,
                              child: Card(
                                color: Color.fromARGB(255, 250, 212, 252),
                                elevation: 10,
                                child: InkWell(
                                  splashColor: Color.fromARGB(255, 153, 105, 199).withAlpha(30),
                                  onTap: () {
                                    debugPrint('Home tapped.');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(),));
                                  },
                                  child: ListTile(
                                    title: Text("HOME"),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Card(
                                color: Color.fromARGB(255, 250, 212, 252),
                                elevation: 10,
                                child: InkWell(
                                  splashColor: Color.fromARGB(255, 153, 105, 199).withAlpha(30),
                                  onTap: () {
                                    debugPrint('Country tapped.');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SortedByCountryPage())); //Ricky： All Channel Count set 5000
                                  },
                                  child: ListTile(
                                    title: Text("COUNTRY"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 53, 156),
                      ),
                    ),
                    for (var i = 0; i < _Channels.length; i++) Card(
                      child: InkWell(
                      splashColor: Color.fromARGB(255, 153, 105, 199).withAlpha(30),
                      onTap: () async {
                        debugPrint(_Channels[i].url);
                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        await prefs.setString('url', _Channels[i].url);
                        await prefs.setString('country', country);

                        Navigator.push(context, MaterialPageRoute(builder: (context) => F_Player(url: _Channels[i].url, country: country),));
                      },
                      child: ListTile(
                        title: Text(_Channels[i].name),
                      ),
                      ),
                    ),
                  ],
                ),
          ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () => _key.currentState!.openDrawer(), // <-- Opens drawer
        ),*/
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(videoHigh), // here the desired height
          child: Stack(
            children: <Widget>[
              Container(
                width: screenWidth, 
                height: screenHigh, 
                color: Colors.blue,
                child:Visibility(
                  child: BetterPlayer.network(
                    url,
                    betterPlayerConfiguration: betterPlayerConfiguration
                  ),
                  visible: videoIsShow,
                ),
              ),
              TestCard(_key),
              /*Positioned(
                left: 12,
                top: screenHigh / 2,
                child: Container(
                  width: 40, 
                  height: 40, 
                  color: Color.fromARGB(255, 255, 0, 0),
                  child: GestureDetector(
                    onTap: () => _key.currentState!.openDrawer(),
                  ),
                ),
              ),*/
            ],
          ),
        ),

        body:
          Visibility(
            child: ListView(
              children: <Widget>[
                for (var i = 0; i < _Channels.length; i++) 
                  Card(
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 153, 105, 199).withAlpha(30),
                      onTap: () async {
                        debugPrint(_Channels[i].url);
                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        await prefs.setString('url', _Channels[i].url);
                        await prefs.setString('country', country);

                        Navigator.push(context, MaterialPageRoute(builder: (context) => F_Player(url: _Channels[i].url, country: country),));
                      },
                      child: ListTile(
                        title: Text(_Channels[i].name),
                      ),
                    ),
                  ), 
              ],
            ),
            visible: path,
          ),
      );
  }
}
