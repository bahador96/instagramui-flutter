import 'package:flutter/material.dart';
import 'package:instagram_application/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<String> myText = [
    'bahador_22',
    'dark__knight256',
    'burstlinkerzero',
    'amiin__emamii',
  ];
  List<String> myText1 = [
    'started following ',
    'likes youe post',
  ];
  List<String> myProfile = [
    'images/ben2.jpg',
    'images/game1.jpg',
    'images/sh.jpg',
    'images/amin.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: const Color(0xff1C1F2E),
              child: TabBar(
                controller: _tabController,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'GB',
                ),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorWeight: 5,
                indicatorColor: const Color(0xffF35383),
                tabs: const [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 20,
            ),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.following,
                myText[0],
                myText[0],
                Image.asset(
                  myProfile[0],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.following,
                myText[1],
                myText[1],
                Image.asset(
                  myProfile[1],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 20,
            ),
            child: Text(
              'Today',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.followBack,
                myText[1],
                myText[0],
                Image.asset(
                  myProfile[1],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.lkies,
                myText[3],
                myText1[1],
                Image.asset(
                  myProfile[3],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.followBack,
                myText[2],
                myText1[0],
                Image.asset(
                  myProfile[2],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 20,
            ),
            child: Text(
              'This week',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.followBack,
                myText[2],
                myText1[0],
                Image.asset(
                  myProfile[2],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.lkies,
                myText[1],
                myText1[1],
                Image.asset(
                  myProfile[1],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(
                ActivityStatus.following,
                myText[2],
                myText1[0],
                Image.asset(
                  myProfile[2],
                ),
              );
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  Widget _getRow(
      ActivityStatus status, String text1, String text2, Image image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: const BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                // child: Image.asset('images/s5.jpg'),
                child: image,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'GB',
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                      fontFamily: 'GM',
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'GB',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12,
                      fontFamily: 'GB',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: const TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Follow',
          ),
        );

      case ActivityStatus.lkies:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/s4.jpg'),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          child: const Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'GB',
              color: Color(0xffC5C5C5),
            ),
          ),
        );

      default:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
          ),
          child: const Text(
            'Message',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'GB',
              color: Color(0xffC5C5C5),
            ),
          ),
        );
    }
  }
}
