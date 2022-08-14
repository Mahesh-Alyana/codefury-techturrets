import 'package:codefury/provider/investors_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartUpHome extends StatefulWidget {
  const StartUpHome({Key? key}) : super(key: key);

  @override
  State<StartUpHome> createState() => _StartUpHomeState();
}

class _StartUpHomeState extends State<StartUpHome> {
  bool _isLoading = false;
  double total = 0.0;
  @override
  void didChangeDependencies() {
    setState(() {
      _isLoading = true;
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Provider.of<InvestorListProvider>(context).getProductList().then((value) {
      var data = Provider.of<InvestorListProvider>(context).productList;
      for (int i = 0; i < data.length; i++) {
        total += data[i].money!;
      }
      setState(() {
        _isLoading = false;
      });
    });
  }

  int count = 5;
  @override
  Widget build(BuildContext context) {
    var investors = Provider.of<InvestorListProvider>(context).productList;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFFF5E7),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey Username",
                              style: TextStyle(
                                color: Color(0xff3a3a47),
                                fontSize: 32,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Start Up",
                              style: TextStyle(
                                color: Color(0xff5b535c),
                                fontSize: 17.62,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xffee9b27),
                          Color(0xffe14d28),
                          Color(0xff6f84b8)
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                            width: width * 0.9,
                            height: height * 0.2,
                            child: Image.asset(
                              "assets/images/Rectangle.png",
                              fit: BoxFit.cover,
                            )),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Investments raised",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "$total",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      width: width,
                      height: height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(0xccffffff),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0, top: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Top investors",
                                style: TextStyle(
                                  color: Color(0xff0e1532),
                                  fontSize: 26,
                                  fontFamily: "Outfit",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.arrow_back_ios),
                              ),
                              Container(
                                width: width * 0.75,
                                height: height * 0.2,
                                child: ListView.builder(
                                    itemCount: investors.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                        width: width * 0.75,
                                        height: height * 0.2,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                                child: Image.asset(
                                                  'assets/images/profile.jpg',
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                  height: 50,
                                                )),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${investors[index].name}",
                                                  style: TextStyle(
                                                    color: Color(0xff242424),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "${investors[index].investorContactNo}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Text(
                                                  "${investors[index].money}",
                                                  style: TextStyle(
                                                    color: Color(0xff242424),
                                                    fontSize: 20,
                                                    fontFamily: "Outfit",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                          Container(
                              width: width * 0.3,
                              height: 20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 5, left: 5, right: 5),
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: Color(0xffD9D9D9),
                                          shape: BoxShape.circle),
                                    ),
                                  );
                                }),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    height: ((75 + 16) * count + height * 0.15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xccffffff),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Schedule",
                                  style: TextStyle(
                                    color: Color(0xff0e1532),
                                    fontSize: 26,
                                    fontFamily: "Outfit",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: ((75 + 16) * count).toDouble(),
                          child: ListView.builder(
                              itemCount: count,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: width * 0.85,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xffee9b27),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width: 26.50,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Icon(Icons.emoji_emotions)),
                                        SizedBox(
                                          width: 82.16,
                                          child: Text(
                                            "Lorem Ipsum",
                                            style: TextStyle(
                                              color: Color(0xff2b2442),
                                              fontSize: 16,
                                              fontFamily: "Outfit",
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 38.62,
                                          child: Text(
                                            "7:00 AM",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff2b2442),
                                              fontSize: 14,
                                              fontFamily: "Outfit",
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
    );
  }
}
