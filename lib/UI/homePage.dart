// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../consts/constants.dart';
import '../utils/colors.dart';
import '../utils/textStyle.dart';
import '../widgets/clientsPortion.dart';
import '../widgets/imageContainer.dart';
import '../widgets/productsPortion.dart';
import '../widgets/services.dart';
import '../widgets/technologyPage.dart';
import '../widgets/workSection.dart';
import 'aboutPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int hoveredIndex = -1;
  final Color selectedColor = orangeColor;
  final Color hoverColor = orangeColor;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _worksKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhiteColor,
      appBar: AppBar(
        backgroundColor: deepBlackColor,
        centerTitle: false,
        title: Text(
          'Tech Tree',
          style: TextStyle(color: appWhiteColor),
        ),
        actions: [
          if (MediaQuery.of(context).size.width > 600) ...[
            _buildTextButton(0, 'Home', _homeKey),
            _buildTextButton(1, 'About', _aboutKey),
            _buildTextButton(2, 'Services', _servicesKey),
            _buildTextButton(3, 'Works', _worksKey),
            _buildTextButton(4, 'Journey', _journeyKey),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: _buildTextButton(5, 'Contact', _contactKey),
            ),
          ] else ...[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: appWhiteColor),
                onPressed: () {
                },
              ),
            ),
          ],
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideLayout();
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }

  Widget _buildWideLayout() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(key: _homeKey, child: ImageAssetContainer(image: 'assets/bg2.jpg', height: 650)),
          Container(key: _aboutKey, child: AboutPage()),
          // Container(key: _aboutKey, child: ClientsPortion(color: deepWhiteColor, text: "Clients", image: dummyImages)),
          Container(key: _servicesKey, child: ServicesPortion(color: lightGreenColor, text: "My Services", servicesData: dummyServiceData)),
          Container(key: _worksKey, child: PortfolioPage()),
          // Container(
          //   key: _journeyKey,
          //   child: Center(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(vertical: 20.0),
          //       child: Text(
          //         "Products",
          //         style: headingTextStyle,
          //       ),
          //     ),
          //   ),
          // ),
          // ProductsPortion(),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(key: _homeKey, child: ImageAssetContainer(image: 'assets/bg2.jpg', height: 300)),
          Container(key: _aboutKey, child: AboutPage()),
          // Container(key: _aboutKey, child: ClientsPortion(color: deepWhiteColor, text: "Clients", image: dummyImages)),
          Container(key: _servicesKey, child: ServicesPortion(color: lightGreenColor, text: "Services", servicesData: dummyServiceData)),
          Container(key: _worksKey, child: PortfolioPage(isNarrow: true,)),
          // Container(
          //   key: _journeyKey,
          //   child: Center(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(vertical: 20.0),
          //       child: Text(
          //         "Products",
          //         style: headingTextStyle,
          //       ),
          //     ),
          //   ),
          // ),
          // ProductsPortion(),
        ],
      ),
    );
  }

  Widget _buildTextButton(int index, String text, GlobalKey key) {
    bool isSelected = selectedIndex == index;
    bool isHovered = hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = -1;
        });
      },
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
            _scrollToSection(key);
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: appBarTextStyle.copyWith(
                color: isSelected
                    ? selectedColor
                    : isHovered
                        ? hoverColor
                        : appWhiteColor,
              ),
            ),
            if (isSelected || isHovered)
              Container(
                margin: const EdgeInsets.only(top: 4.0),
                height: 2.0,
                width: isHovered ? 8.0 : 20,
                color: selectedColor,
              ),
          ],
        ),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }
}
