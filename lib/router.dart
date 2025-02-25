import 'package:flutter/material.dart';
import 'package:doubanapp/pages/detail/detail_page.dart';
import 'package:doubanapp/pages/container_page.dart';
import 'package:doubanapp/pages/videos_play_page.dart';
import 'package:doubanapp/pages/search/search_page.dart';
import 'package:doubanapp/pages/photo_hero_page.dart';
import 'package:doubanapp/pages/person_detail_page.dart';
import 'package:doubanapp/pages/web_view_page.dart';

///https://www.jianshu.com/p/b9d6ec92926f

class MyRouter {
  static const homePage = 'app://';
  static const detailPage = 'app://DetailPage';
  static const playListPage = 'app://VideosPlayPage';
  static const searchPage = 'app://SearchPage';
  static const photoHero = 'app://PhotoHero';
  static const personDetailPage = 'app://PersonDetailPage';

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        case detailPage:
          return DetailPage(params);
        case homePage:
          return ContainerPage();
        case playListPage:
          return VideoPlayPage(params);
        case searchPage:
          return SearchPage(searchHintContent: params);
        case photoHero:
          return PhotoHeroPage(
              photoUrl: params['photoUrl'], width: params['width']);
        case personDetailPage:
          return PersonDetailPage(params['personImgUrl'], params['id']);
      }
    }
    return null;
  }

  MyRouter.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  MyRouter.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
