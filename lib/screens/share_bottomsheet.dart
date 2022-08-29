import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  ShareBottomSheet({this.controller, Key? key}) : super(key: key);

  List<String> myProfile = [
    'images/ben2.jpg',
    'images/game1.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
    'images/ben2.jpg',
    'images/game1.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
    'images/ben2.jpg',
    'images/game1.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
    'images/ben2.jpg',
    'images/game1.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
  ];
  List<String> myText2 = [
    'bahador_22',
    'dark_knight256',
    'burstlinkerzero',
    'amiin__emamii',
    'bahador_22',
    'dark_knight256',
    'burstlinkerzero',
    'amiin__emamii',
    'bahador_22',
    'dark_knight256',
    'burstlinkerzero',
    'amiin__emamii',
    'bahador_22',
    'dark_knight256',
    'burstlinkerzero',
    'amiin__emamii',
  ];
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.09),
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: 67,
                    height: 5,
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 35,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontFamily: 'GB',
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search User',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  return _getItemGriid(
                    Image.asset(myProfile[index]),
                    myText2[index],
                  );
                }),
                childCount: myProfile.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 120,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 120),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              child: Text(
                'Share',
                style: TextStyle(
                  fontFamily: 'GB',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGriid(Image image, String text) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // child: Image.asset('images/profile.png'),
            child: image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
