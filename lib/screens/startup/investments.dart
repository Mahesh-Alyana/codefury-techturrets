import 'package:flutter/material.dart';

class Fundings extends StatefulWidget {
  const Fundings({Key? key}) : super(key: key);

  @override
  State<Fundings> createState() => _FundingsState();
}

class _FundingsState extends State<Fundings> {
  @override
  Widget build(BuildContext context) {
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
                                  "Fundings",
                                  style: TextStyle(
                                    color: Color(0xff0e1532),
                                    fontSize: 26,
                                    fontFamily: "Outfit",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60)),
                              ),
                              child: ListView.builder(
                                  itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: width * 0.85,
                                    height: height * 0.16,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 255, 227, 137)),
                                        color: Color(0xffFFF8EE)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.08),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              child: Image.asset(
                                                'assets/images/profile.jpg',
                                                fit: BoxFit.cover,
                                                width: 50,
                                                height: 50,
                                              )),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Person A",
                                              style: TextStyle(
                                                color: Color(0xff242424),
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              "Angel investor",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              "\$350.46",
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
