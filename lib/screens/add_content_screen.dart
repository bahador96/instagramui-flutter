import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            Container(
              height: 83,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Draft',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/s$index.jpg'),
                      // child: Image.asset('images/item$index.png'),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 100),
        ),
      ],
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      height: 394,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/vil.jpg'),
        ),
      ),
    );
  }

  Padding _getHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 27),
      child: Row(
        children: [
          const Text(
            'Post',
            style: TextStyle(
              fontFamily: 'GB',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset('images/icon_arrow_down.png'),
          const Spacer(),
          const Text(
            'Next',
            style: TextStyle(
              fontFamily: 'GB',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
