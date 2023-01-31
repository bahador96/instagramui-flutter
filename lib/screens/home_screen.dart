import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_application/screens/share_bottomsheet.dart';

class HomeScreeen extends StatelessWidget {
  HomeScreeen({Key? key}) : super(key: key);

  final List<String> imgList = [
    'images/s5.jpg',
    'images/game.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
  ];

  final List<String> myPosts = [
    'images/b2.jpg',
    'images/game.jpg',
    'images/sh1.jpg',
    'images/amin1.jpg',
  ];
  final List<String> myProfile = [
    'images/ben2.jpg',
    'images/game1.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
  ];
  final List<String> myText = [
    'bahador_22',
    'dark__knight256',
    'burstlinkerzero',
    'amiin__emamii',
  ];
  final List<String> myText2 = [
    'bahador_22',
    'dark_knight256',
    'burstlinkerzero',
    'amiin__emamii',
  ];
  final List<String> myBio = [
    'بهادر فولادی برنامه نویس موبایل',
    'من گیمیر هستم',
    'آموزش زبان ژاپنی',
    '''من به شما کمک میکنم در
     رشته طراحی صنعتی قبول شوید ''',
  ];
  final List<String> myComments = [
    '2.5K',
    '100k',
    '10k',
    '20k',
  ];
  final List<String> myLikes = [
    '5K',
    '100K',
    '300K',
    '50K',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1F2E),
        elevation: 0,
        centerTitle: false,
        title: SizedBox(
          width: 128,
          height: 24,
          child: Image.asset(
            'images/moodinger_logo.png',
          ),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.7,
                          builder: (context, controler) {
                            return ShareBottomSheet(controller: controler);
                          },
                        ),
                      );
                    },
                  );
                },
                child: const Text('Open BottomSheet'),
              ),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      _getHeaderPost(
                          myText2[index],
                          myBio[index],
                          Image.asset(
                            myProfile[index],
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      _getPostContent(
                        Image.asset(
                          myPosts[index],
                          width: 370,
                          height: 370,
                          fit: BoxFit.fill,
                        ),
                        myComments[index],
                        myLikes[index],
                      ),
                    ],
                  );
                },
                childCount: myPosts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imgList.length + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? _getAddSotryBox()
              : _getStoryListBox(
                  Image.asset(
                    imgList[index - 1],
                    fit: BoxFit.cover,
                  ),
                  myText[index - 1],
                );
        },
      ),
    );
  }

  Widget _getPostContent(Image image, String textcomments, String mylikes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 390,
        width: 394,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: image,
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Image.asset('images/icon_video.png'),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: 380,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/icon_hart.png',
                            width: 23,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            mylikes,
                            style: const TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'images/icon_comments.png',
                            width: 23,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            textcomments,
                            style: const TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Image.asset(
                        'images/icon_share.png',
                        width: 23,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Image.asset(
                          'images/icon_save.png',
                          width: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeaderPost(String text1, String text2, Image imageheader) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(imageheader),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  text2,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontFamily: 'SM', color: Colors.white),
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.asset(
            'images/icon_menu.png',
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  Widget _getStoryBox(Image imageheaderprofile) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(17),
      padding: const EdgeInsets.all(4),
      color: const Color(0xffF35383),
      strokeWidth: 2,
      dashPattern: const [40, 10],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: SizedBox(
          height: 38,
          width: 38,
          child: imageheaderprofile,
        ),
      ),
    );
  }

  Widget _getStoryListBox(Image image, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(17),
            padding: const EdgeInsets.all(4),
            color: const Color(0xffF35383),
            strokeWidth: 2,
            dashPattern: const [40, 10],
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: SizedBox(
                height: 58,
                width: 58,
                child: image,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _getAddSotryBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Your story',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
