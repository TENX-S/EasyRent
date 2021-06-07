import 'dart:typed_data';
import 'package:easy_rent/utils/pending.dart';
import 'package:flutter/material.dart';
import 'package:easy_rent/model/post.dart';
import 'package:easy_rent/model/client.dart';
import 'package:easy_rent/model/app_routes.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

int activeIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _cmdClient = CmdClient(serverAddr: '1.116.216.141', serverPort: 8081);
  bool first = true;

  Future<void> _onLoad() async {
    final allExistPosts = rentPosts.map((e) => e.uuid).toList();
    allExistPosts.addAll(helpPosts.map((e) => e.uuid).toList());

    final comingPosts = await _cmdClient.onLoad(allExistPosts);
    setState(() {
      rentPosts.addAll(comingPosts.postPackage.rentPosts
          .map((p) => RentPost(p.uuid, p.name, p.phone, p.releaseTime)
        ..roomAddr = p.roomAddr
        ..roomArea = p.roomArea
        ..roomType = p.roomType
        ..roomOrientation = p.roomOrientation
        ..roomFloor = p.roomFloor
        ..description = p.description
        ..price = p.price
        ..restriction = p.restriction
        ..pictures = p.pictures.map((e) => e as Uint8List).toList()));

      helpPosts.addAll(comingPosts.postPackage.helpPosts
          .map((p) => HelpPost(p.uuid, p.name, p.phone, p.releaseTime)
        ..expectedAddr = p.expectedAddr
        ..expectedPrice = p.expectedPrice
        ..demands = p.demands));
    });
  }

  Future<void> _onRefresh() async {
    if (first) {
      final comingPosts = await _cmdClient.onRefresh(first);
      setState(() {
        rentPosts.addAll(comingPosts.postPackage.rentPosts
            .map((p) => RentPost(p.uuid, p.name, p.phone, p.releaseTime)
          ..roomAddr = p.roomAddr
          ..roomArea = p.roomArea
          ..roomType = p.roomType
          ..roomOrientation = p.roomOrientation
          ..roomFloor = p.roomFloor
          ..description = p.description
          ..price = p.price
          ..restriction = p.restriction
          ..pictures = p.pictures.map((e) => e as Uint8List).toList()));

        helpPosts.addAll(comingPosts.postPackage.helpPosts
            .map((p) => HelpPost(p.uuid, p.name, p.phone, p.releaseTime)
          ..expectedAddr = p.expectedAddr
          ..expectedPrice = p.expectedPrice
          ..demands = p.demands));
        first = false;
      });
    } else {
      setState(() {
        rentPosts.shuffle();
        helpPosts.shuffle();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        activeIndex = _tabController.index;
      }
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 238, 213),
      body: EasyRefresh.builder(
        taskIndependence: true,
        onLoad: _onLoad,
        onRefresh: _onRefresh,
        topBouncing: true,
        bottomBouncing: true,
        firstRefresh: true,
        header: ClassicalHeader(
          textColor: Color.fromARGB(255, 251, 150, 110),
          extent: 60,
          triggerDistance: 60,
          showInfo: false,
          enableHapticFeedback: true,
          enableInfiniteRefresh: false,
          refreshText: '下拉刷新',
          refreshedText: '刷新成功',
          refreshingText: '刷新中',
          refreshReadyText: '',
          refreshFailedText: '刷新失败，请检查网络连接',
        ),
        footer: ClassicalFooter(
          textColor: Color.fromARGB(255, 251, 150, 110),
          showInfo: false,
          loadText: '',
          loadedText: '',
          loadingText: '加载中',
          loadReadyText: '',
          loadFailedText: '',
        ),
        builder: (context, physics, header, footer) {
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  snap: true,
                  floating: true,
                  backgroundColor: Color.fromARGB(255, 251, 150, 110),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Easy Rent",
                      style: TextStyle(
                        color: Color.fromARGB(255, 247, 238, 213),
                        fontFamily: 'Vladimir',
                        fontWeight: FontWeight.w600,
                        fontSize: 32.0,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.search_outlined,
                      ),
                      onPressed: () async {
                        await showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  floating: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      indicatorColor: Color.fromARGB(255, 251, 150, 110),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            '出 租',
                            style: TextStyle(
                              color: Color.fromRGBO(48, 47, 48, 0.9),
                              fontWeight: FontWeight.w700,
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '求 租',
                            style: TextStyle(
                              color: Color.fromRGBO(48, 47, 48, 0.9),
                              fontWeight: FontWeight.w700,
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ],
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                CustomScrollView(
                  physics: physics,
                  slivers: [
                    header!,
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                            rentPosts[index].buildCard(context),
                        childCount: rentPosts.length,
                      ),
                    ),
                    footer!,
                  ],
                ),
                CustomScrollView(
                  physics: physics,
                  slivers: [
                    header,
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                            helpPosts[index].buildCard(context),
                        childCount: helpPosts.length,
                      ),
                    ),
                    footer,
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FloatingActionButton(
          elevation: 10.0,
          onPressed: () => Navigator.pushNamed(context, AppRoutes.selectPage),
          backgroundColor: Color.fromARGB(255, 251, 150, 110).withOpacity(0.9),
          tooltip: "发布帖子",
          child: Icon(
            Icons.post_add_outlined,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class CustomSearchDelegate extends SearchDelegate<Future<Widget>> {
  List<Post>? searchResult;

  @override
  String get searchFieldLabel => '你想找...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(),
      primaryColor: Color.fromARGB(255, 251, 150, 110),
    );
  }

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
        close(context, Future.value(null));
      },
    );
  }

  Future<List<Post>> search(String query) async {
    if (activeIndex == 0) {

    } else {

    }
    return Future.value(null);
  }

  @override
  Widget buildResults(BuildContext context) {
    if (searchResult != null) {
      searchResult!.clear();
    }
    // searchResult = rentPosts
    //     .where((element) => element.toString().contains(query))
    //     .toList();
    return FutureBuilder(
      future: search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (searchResult!.isEmpty) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/not_found.png',
                    ),
                    Text(
                      '非常抱歉，没有找到符合条件的帖子呢',
                      style: TextStyle(
                        color: Color.fromRGBO(141, 141, 141, 1.0),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              color: Color.fromARGB(255, 247, 238, 213),
              child: ListView(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                scrollDirection: Axis.vertical,
                children: List.generate(
                  (snapshot.data! as List<Post>).length,
                      (index) => (snapshot.data! as List<Post>)[index].buildCard(context),
                ),
              ),
            );
          }
        } else {
          showPendingDialog(context);
          return Container();
        }
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
