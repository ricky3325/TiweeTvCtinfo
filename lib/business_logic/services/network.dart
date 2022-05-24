import 'package:dio/dio.dart';
import 'package:Tiwee/business_logic/model/category.dart';
import 'package:Tiwee/business_logic/model/channel.dart';

Future<List<ChannelObj>?> fetchChannels() async {
  List<ChannelObj> channels = [];

  try {
    Response response =
        await Dio().get('https://iptv-org.github.io/iptv/channels.json');
        

    print("enzo");
    //print(response.toString());

    /*response.data = [
      {
        "name": "name名",
        "logo":
            "https://memeprod.sgp1.digitaloceanspaces.com/meme/0f95181226f34d0ef90e4267da8e8bd5.png",
        "url":
            "https://bloomberg-quicktake-1-lu.samsung.wurl.com/manifest/playlist.m3u8",
        "categories": [
          {"name":"Entertainment","slug":"entertainment"}
        ],
        "countries": [
          {"name": "ROC", "code": "TW"}
        ],
        "languages": [
          {"name": "English", "code": "eng"}
        ],
        "tvg": {
          "id": "BloombergQuicktake.us",
          "name": "TVG名",
          "url": ""
        }
      }, {
          "name": "&Pictures",
          "logo": "https://static.epg.best/in/AndPictures.in.png",
          "url": "https://sneh-z5api.herokuapp.com/?c=0-9-tvpictureshd",
          "categories": [{
              "name": "Movies",
              "slug": "movies"
          }],
          "countries": [{
              "name": "Afghanistan",
              "code": "AF"
          }, {
              "name": "Bangladesh",
              "code": "BD"
          }, {
              "name": "Bhutan",
              "code": "BT"
          }, {
              "name": "India",
              "code": "IN"
          }, {
              "name": "Sri Lanka",
              "code": "LK"
          }, {
              "name": "Maldives",
              "code": "MV"
          }, {
              "name": "Nepal",
              "code": "NP"
          }, {
              "name": "Pakistan",
              "code": "PK"
          }],
          "languages": [{
              "name": "Pashto",
              "code": "pus"
          }],
          "tvg": {
              "id": "AndPictures.in",
              "name": "&Pictures",
              "url": ""
          }
      },
    ];*/

    for (var channel in response.data) {
      ChannelObj channelObj = ChannelObj.fromJson(channel);

      if (channelObj.categories.isNotEmpty) {
        if (channelObj.categories[0].name != "XXX") {
          channels.add(channelObj);

        }
      }
    }
    print("salmm");

    print(channels[0].countries[0].name);
    List<ChannelObj> repairChannels = channels.toSet().toList();

    return repairChannels;
  } catch (e) {
    print(e);
  }
}
