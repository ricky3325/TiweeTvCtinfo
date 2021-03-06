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

class myChannels{
   String name;
   String url;

   myChannels({required this.name, required this.url});
}

class F_Player extends ConsumerWidget {
  F_Player({Key? key, required this.url, required this.country, required this.channelCount}) : super(key: key);
  final String country;
  final String url;
  final int channelCount;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  
  /*SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                new Icon(icon, color: Colors.blue),
                new Text(text),
            ],
        )
    );
  }*/

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
    
    print("??????????????????????????????????????????????????????????????????");
    screenHigh = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    if(MediaQuery.of(context).size.width > MediaQuery.of(context).size.height){
      path = false; //Ricky?????????????????????PATH TRUE
      videoHigh = MediaQuery.of(context).size.height;
      print("??????");
    }
    else if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height){
      path = true; //Ricky?????????????????????PATH FALSE
      videoHigh = MediaQuery.of(context).size.width/16*9;
      print("??????");
    }
    else{
      path = true;
    }
    print("??????????????????????????????????????????????????????????????????");
    /*return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      
      child: 
      SafeArea(
        child: 
        BetterPlayer.network(url,
            betterPlayerConfiguration: betterPlayerConfiguration),
      ),
    );*/
    /*return Scaffold(
      /*appBar: AppBar(
        title: Text("Basic player"),
      ),*///Ricky????????????????????????
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Basic player created with the simplest factory method. Shows video from URL.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SafeArea(
            child: BetterPlayer.network(
              url,
              betterPlayerConfiguration: betterPlayerConfiguration
            ),
          ),//Ricky??????????????????????????????????????????????????????????????????
        ],
      ),
    );*/
    List<myChannels> _Channels = [];
    var _darwershow = channels.when(
      data: (d) => List.generate(d[country]!.length, (index) {
        String name = d[country]![index].name;
        String url = d[country]![index].url;
        //print(url);
        //print(name);
        //print("55555555555555555555555555555555555555555555");
        
        _Channels.add(myChannels(name:name,url:url));
        print(_Channels.length);
        /*return Card(
          child: InkWell(
          splashColor: Color.fromARGB(255, 153, 105, 199).withAlpha(30),
          onTap: () {
            debugPrint(d[country]![index].url);
          },
          child: ListTile(
            title: Text(d[country]![index].name),
          ),
          ),
        );*/
        //return GestureDetector(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Player(url: data[country]![index].url, country:""),)),child: TvCard(size: size, index: index, data: data, ref: ref, country: country));
      }
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () =>  SizedBox(
          width: 50, child: Lottie.asset(kLoading, width: 60)),
    );


    //var _darwershow = ;

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
                              "Tiwee888",//Ricky???APP????????????
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SortedByCountryPage()));
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

                        /*print("22222222222222222222222222222222222222222");
                        print(await prefs.getString('url'));
                        print(await prefs.getString('country'));
                        print("22222222222222222222222222222222222222222");*/

                        await prefs.setString('url', _Channels[i].url);
                        await prefs.setString('country', country);

                        /*print("44444444444444444444444444444444444444444");
                        print(await prefs.getString('url'));
                        print(await prefs.getString('country'));
                        print("44444444444444444444444444444444444444444");*/

                        Navigator.push(context, MaterialPageRoute(builder: (context) => F_Player(url: _Channels[i].url, country: country, channelCount: channelCount),));
                      },
                      child: ListTile(
                        title: Text(_Channels[i].name),
                      ),
                      ),
                    ),
                  ],
                ),
              /*ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('??????????????????\n???????????????????????????'),
                    decoration: BoxDecoration(
                    color: Colors.blue,
                    ),
                  ),
                ],
            ),*/
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _key.currentState!.openDrawer(), // <-- Opens drawer
        ),
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
              Positioned(
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
              ),
              RaisedButton(
                child: Text('??????'),
                onPressed: () => _key.currentState!.openDrawer(),
              ),
            ],
          ),
          /*AppBar(
            title: Text("????????????"),
            
            //leading: Icon(FontAwesomeIcons.dragon),
            actions: <Widget>[
              /*IconButton(
                icon: Icon(FontAwesomeIcons.search),
                onPressed: null,
              )*/
              new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  this.SelectView(Icons.message, '????????????', 'A'),
                  this.SelectView(Icons.group_add, '????????????', 'B'),
                  this.SelectView(Icons.cast_connected, '????????????', 'C'),
              ],
              onSelected: (String action) {
                  // ?????????????????????
                  switch (action) {
                      case 'A': break;
                      case 'B': break;
                      case 'C': break;
                  }
              },
          ),
            ],
            /*bottom: TabBar(
              tabs: tabList.map((choice) {
                return Tab(
                  text: choice.title,       //Tab's title
                  icon: Icon(choice.icon),  //Tab's icon
                );
              }).toList(),
            ),*/
          ),*/
        ),
        
        /*behavior: HitTestBehavior.translucent,
        onTap: () {
          print("0000000000000000000000000000000");
          _visible = !_visible;
          print(_visible);
        },*/

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

                        /*print("22222222222222222222222222222222222222222");
                        print(await prefs.getString('url'));
                        print(await prefs.getString('country'));
                        print("22222222222222222222222222222222222222222");*/

                        await prefs.setString('url', _Channels[i].url);
                        await prefs.setString('country', country);

                        /*print("44444444444444444444444444444444444444444");
                        print(await prefs.getString('url'));
                        print(await prefs.getString('country'));
                        print("44444444444444444444444444444444444444444");*/

                        Navigator.push(context, MaterialPageRoute(builder: (context) => F_Player(url: _Channels[i].url, country: country, channelCount: channelCount),));
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
        
        /*body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Basic player created with the simplest factory method. Shows video from URL.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SafeArea(
            child: BetterPlayer.network(
              url,
              betterPlayerConfiguration: betterPlayerConfiguration
            ),
          ),//Ricky??????????????????????????????????????????????????????????????????
        ],
      ),*/
        /*body: TabBarView(
        children: [
            SafeArea(
            child: BetterPlayer.network(
              url,
              betterPlayerConfiguration: betterPlayerConfiguration
            ),
          ),//Ricky??????????????????????????????????????????????????????????????????
 
          SortedByCountryPage(allChanellsCount:5111 ,),
            //recordPage(),//Center(child: Text("0", style: TextStyle(fontSize: 40),)),
            //pricePage(),//Center(child: Text("1", style: TextStyle(fontSize: 40),)),
          ],
        ),*/
      );
  }
  void btnClickEvent() {
    print('btnClickEvent...');
  }
}
