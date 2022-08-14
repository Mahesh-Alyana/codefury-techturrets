import 'package:codefury/provider/feed_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../provider/investors_list_provider.dart';

class StartupFeed extends StatefulWidget {
  const StartupFeed({Key? key}) : super(key: key);

  @override
  State<StartupFeed> createState() => _StartupFeedState();
}

class _StartupFeedState extends State<StartupFeed> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    setState(() {
      _controller = VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
        ..videoPlayerOptions
        ..addListener(() {
          setState(() {});
        })
        ..initialize().then((value) {
          _controller.play();
        });
    });
  }

  void setController(String link) {
    setState(() {
      _controller = VideoPlayerController.network(link)
        ..videoPlayerOptions
        ..addListener(() {
          setState(() {});
        })
        ..initialize().then((value) {
          _controller.play();
        });
    });
  }

  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    setState(() {
      _isLoading = true;
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Provider.of<FeedListProvider>(context).getProductList().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    Provider.of<InvestorListProvider>(context).getProductList().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var feeds = Provider.of<FeedListProvider>(context).productList;
    var investors = Provider.of<InvestorListProvider>(context).productList;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffee9b27), Color(0xffe14d28), Color(0xff6f84b8)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                      child: Container(
                        height: height,
                        child: Image.asset("assets/images/Rectangle.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: Text(
                                  "Feed",
                                  style: TextStyle(
                                    color: Color(0xff0e1532),
                                    fontSize: 26,
                                    fontFamily: "Outfit",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: height * 0.1,
                                width: width,
                                child: ListView.builder(
                                    itemCount: investors.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              child: Image.asset(
                                                'assets/images/profile.jpg',
                                                fit: BoxFit.cover,
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            Text(
                                              "${investors[index].name}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xff0c0c0c),
                                                fontSize: 9.39,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              height: height,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60)),
                              ),
                              child: ListView.builder(
                                  itemCount: feeds.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: width * 0.9,
                                        height: height * 0.5,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 255, 227, 137)),
                                            color: Color(0xffFFF8EE)),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              top: 0,
                                              child: Container(
                                                height: height * 0.3,
                                                width: width * 0.9,
                                                child: _controller
                                                        .value.isInitialized
                                                    ? VideoPlayer(
                                                        _controller,
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                            Positioned(
                                              left: width * 0.05,
                                              top: height * 0.28,
                                              child: Container(
                                                width: 85,
                                                height: 85,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17),
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 5)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(17),
                                                  child: Image.asset(
                                                    'assets/images/profile.jpg',
                                                    fit: BoxFit.cover,
                                                    width: 85,
                                                    height: 85,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: height * 0.32,
                                              left: width * 0.32,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${feeds}",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily: "Roboto",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    "on 15 Oct 2019 ",
                                                    style: TextStyle(
                                                      color: Color(0xff9ca0ac),
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: height * 0.32,
                                              right: width * 0.05,
                                              child: IconButton(
                                                  onPressed: (() {}),
                                                  icon: Icon(
                                                      Icons.currency_rupee)),
                                            ),
                                            Positioned(
                                              bottom: 60,
                                              left: width * 0.05,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.thumb_up_alt),
                                                  Text("5 like")
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: width * 0.05,
                                              bottom: 30,
                                              child: SizedBox(
                                                width: 321,
                                                child: Text(
                                                  "#healthy You and your family will love this refreshing desert!",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
