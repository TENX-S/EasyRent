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
                backgroundColor: Color.fromARGB(255, 145, 180, 147),
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
            onPressed: () {},
            backgroundColor: Color(0xFF3A3B3C).withOpacity(0.7),
            tooltip: "发布帖子",
            child: Icon(Icons.post_add_outlined, size: 40.0,),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
