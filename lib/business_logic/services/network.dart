import 'package:dio/dio.dart';
import 'package:Tiwee/business_logic/model/category.dart';
import 'package:Tiwee/business_logic/model/channel.dart';

Future<List<ChannelObj>?> fetchChannels() async {
  List<ChannelObj> channels = [];

  try {
    Response response =
        await Dio().get('https://iptv-org.github.io/iptv/channels.json');
    print("enzo");
    print(response.toString());
    response.data = [
      {
        "name": "Bloomberg Quicktake",
        "logo":
            "https://www.adweek.com/wp-content/uploads/2019/12/quicktake-bloomberg-tictoc-CONTENT-2019-640x360.jpg",
        "url":
            "https://bloomberg-quicktake-1-lu.samsung.wurl.com/manifest/playlist.m3u8",
        "categories": [
          {"name": "General", "slug": "general"}
        ],
        "countries": [
          {"name": "泰國", "code": "TH"}
        ],
        "languages": [
          {"name": "English", "code": "eng"}
        ],
        "tvg": {
          "id": "BloombergQuicktake.us",
          "name": "Bloomberg Quicktake",
          "url": ""
        }
      },
      {
        "name": "Bloomberg Quicktake",
        "logo":
            "https://www.adweek.com/wp-content/uploads/2019/12/quicktake-bloomberg-tictoc-CONTENT-2019-640x360.jpg",
        "url":
            "https://bloomberg-quicktake-1-lu.samsung.wurl.com/manifest/playlist.m3u8",
        "categories": [
          {"name": "General", "slug": "general"}
        ],
        "countries": [
          {"name": "印尼", "code": "ID"}
        ],
        "languages": [
          {"name": "English", "code": "eng"}
        ],
        "tvg": {
          "id": "BloombergQuicktake.us",
          "name": "Bloomberg Quicktake",
          "url": ""
        }
      },
      {
        "name": "Bloomberg Quicktake",
        "logo":
            "https://www.adweek.com/wp-content/uploads/2019/12/quicktake-bloomberg-tictoc-CONTENT-2019-640x360.jpg",
        "url":
            "https://bloomberg-quicktake-1-lu.samsung.wurl.com/manifest/playlist.m3u8",
        "categories": [
          {"name": "General", "slug": "general"}
        ],
        "countries": [
          {"name": "菲律賓", "code": "PH"}
        ],
        "languages": [
          {"name": "English", "code": "eng"}
        ],
        "tvg": {
          "id": "BloombergQuicktake.us",
          "name": "Bloomberg Quicktake",
          "url": ""
        }
      },
      {
        "name": "Bloomberg Quicktake",
        "logo":
            "https://www.adweek.com/wp-content/uploads/2019/12/quicktake-bloomberg-tictoc-CONTENT-2019-640x360.jpg",
        "url":
            "https://bloomberg-quicktake-1-lu.samsung.wurl.com/manifest/playlist.m3u8",
        "categories": [
          {"name": "General", "slug": "general"}
        ],
        "countries": [
          {"name": "越南", "code": "VN"}
        ],
        "languages": [
          {"name": "English", "code": "eng"}
        ],
        "tvg": {
          "id": "BloombergQuicktake.us",
          "name": "Bloomberg Quicktake",
          "url": ""
        }
      }
    ];
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
