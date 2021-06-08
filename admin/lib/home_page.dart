import 'dart:typed_data';
import 'package:admin/model/agent.dart';
import 'package:admin/model/client.dart';
import 'package:admin/model/post.dart';
import 'package:admin/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cmdClient = CmdClient(serverAddr: '1.116.216.141', serverPort: 8082);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('易租管理中心'),
          backgroundColor: Color(0xFFfb966e),
          bottom: TabBar(
            tabs: [
              Tab(
                text: '中介机构认证',
              ),
              Tab(
                text: '审核帖子',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            verifyAgent(context),
            verifyPost(context),
          ],
        ),
      ),
    );
  }

  Future<List<Agent>> loadAgents() async {
    final results = await _cmdClient.onLoadUnverifiedAgents();
    return results.agent
        .map((a) => Agent(
            corp: a.corp,
            corpId: a.corpId,
            comRegdAddr: a.comRegdAddr,
            contact: a.contact,
            name: a.name,
            password: ''))
        .toList();
  }

  Widget verifyAgent(BuildContext context) {
    return FutureBuilder(
      future: loadAgents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            if ((snapshot.data as List<Agent>).isEmpty) {
              return Center(
                child: Text('没有待审核的中介机构'),
              );
            } else {
              return Container(
                color: Color.fromARGB(255, 247, 238, 213),
                child: ListView(
                  children: List.generate(
                    (snapshot.data as List<Agent>).length,
                    (index) => (snapshot.data as List<Agent>)[index].buildPanel(
                        onVerified: () async {
                      final result = await _cmdClient.onPassAgent(
                          (snapshot.data as List<Agent>)[index].name!);
                      if (result.success) {
                        showTip(msg: '提交成功');
                        setState(() {
                          (snapshot.data as List<Agent>).removeAt(index);
                        });
                      } else {
                        showTip(msg: '提交失败');
                      }
                    }),
                  ),
                ),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<Post>> loadPost() async {
    if (_selectedIndex == 0) {
      final results = await _cmdClient.onLoadUnverifiedRentPosts();
      return results.rentPosts
          .map((p) => RentPost(p.uuid, p.name, p.phone, p.releaseTime)
            ..roomAddr = p.roomAddr
            ..roomArea = p.roomArea
            ..roomType = p.roomType
            ..roomOrientation = p.roomOrientation
            ..roomFloor = p.roomFloor
            ..description = p.description
            ..price = p.price
            ..restriction = p.restriction
            ..pictures = p.pictures.map((e) => e as Uint8List).toList())
          .toList();
    } else {
      final results = await _cmdClient.onLoadUnverifiedHelpPosts();
      return results.helpPosts
          .map((p) => HelpPost(p.uuid, p.name, p.phone, p.releaseTime)
            ..expectedAddr = p.expectedAddr
            ..expectedPrice = p.expectedPrice
            ..demands = p.demands)
          .toList();
    }
  }

  Widget rentPage() {
    return FutureBuilder(
      future: loadPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            if ((snapshot.data as List<RentPost>).isEmpty) {
              return Center(
                child: Text('没有待审核的帖子'),
              );
            } else {
              return ListView(
                children: List.generate(
                  (snapshot.data as List<RentPost>).length,
                  (index) => (snapshot.data as List<RentPost>)[index].buildPanel(context,
                      onVerified: () async {
                    final result = await _cmdClient.onPassRentPost((snapshot.data as List<RentPost>)[index].uuid);
                    if (result.success) {
                      showTip(msg: '提交成功');
                      setState(() {
                        (snapshot.data as List<RentPost>).removeAt(index);
                      });
                    } else {
                      showTip(msg: '提交失败');
                    }
                  }),
                ),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget helpPage() {
    return FutureBuilder(
      future: loadPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            if ((snapshot.data as List<HelpPost>).isEmpty) {
              return Center(
                child: Text('没有待审核的帖子'),
              );
            } else {
              return ListView(
                children: List.generate(
                  (snapshot.data as List<HelpPost>).length,
                      (index) => (snapshot.data as List<HelpPost>)[index].buildPanel(context,
                      onVerified: () async {
                        final result = await _cmdClient.onPassHelpPost((snapshot.data as List<HelpPost>)[index].uuid);
                        if (result.success) {
                          showTip(msg: '提交成功');
                          setState(() {
                            (snapshot.data as List<HelpPost>).removeAt(index);
                          });
                        } else {
                          showTip(msg: '提交失败');
                        }
                      }),
                ),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> get pages => [
        rentPage(),
        helpPage(),
      ];

  Widget verifyPost(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: pages.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '出租帖',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.help), label: '求租帖'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
