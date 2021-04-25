import 'package:easy_rent/model/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime currentBackPressTime;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: '再按一次返回键退出');
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 238, 213),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Color.fromARGB(255, 251, 150, 110),
                floating: true,
                snap: true,
                title: Text(
                  "易租",
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search_outlined,
                    ),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int idx) =>
                      allPosts[idx].buildCard(context),
                  childCount: allPosts.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FloatingActionButton(
            elevation: 10.0,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.selectPage),
            backgroundColor: Color.fromARGB(255, 120, 194, 196).withOpacity(0.9),
            tooltip: "发布帖子",
            child: Icon(
              Icons.post_add_outlined,
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<Post> searchResult;

  @override
  String get searchFieldLabel => '你想找...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (searchResult != null) {
      searchResult.clear();
    }
    searchResult = allPosts
        .where((element) => element.toString().contains(query))
        .toList();
    if (searchResult.isEmpty) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/not_found.png',
              ),
              Text(
                '非常抱歉，没有找到符合条件的帖子呢。',
                style: TextStyle(
                  color: Color.fromRGBO(141, 141, 141, 1.0),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: ListView(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            scrollDirection: Axis.vertical,
            children: List.generate(
              searchResult.length,
              (idx) => searchResult[idx].buildCard(context),
            )),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
