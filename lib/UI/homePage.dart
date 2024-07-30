// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../consts/constants.dart';
import '../utils/colors.dart';
import '../utils/textStyle.dart';
import '../widgets/contactSection.dart';
import '../widgets/imageContainer.dart';
import '../widgets/journeySection.dart';
import '../widgets/services.dart';
import '../widgets/workSection.dart';
import 'aboutPage.dart';

import 'package:flutter/scheduler.dart';

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

  List<GlobalKey> get sectionKeys => [
        _homeKey,
        _aboutKey,
        _servicesKey,
        _worksKey,
        _journeyKey,
        _contactKey,
      ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollThrottled);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollThrottled);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollThrottled() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _onScroll();
    });
  }

  void _onScroll() {
    int newIndex = selectedIndex;
    for (int i = 0; i < sectionKeys.length; i++) {
      final context = sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position <= 100 && position + box.size.height > 100) {
          newIndex = i;
          break;
        }
      }
    }
    if (newIndex != selectedIndex) {
      setState(() {
        selectedIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhiteColor,
      appBar: AppBar(
        backgroundColor: landingImageColor,
        centerTitle: false,
        title: Text(
          'Tech Tree',
          style: TextStyle(color: appWhiteColor),
        ),
        actions: [
          if (MediaQuery.of(context).size.width > 600) ...[
            for (int i = 0; i < sectionKeys.length; i++) _buildTextButton(i, ['Home', 'About', 'Services', 'Works', 'Journey', 'Contact'][i], sectionKeys[i]),
          ] else ...[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: appWhiteColor),
                onPressed: () {
                  // Your menu action here
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
          Container(
              key: _homeKey,
              child: ImageAssetContainer(
                image: 'assets/Ubaid (1).png',
                height: 650,
                portfolioOnPressed: () {
                  _scrollToSection(_worksKey);
                },
              )),
          Container(key: _aboutKey, child: AboutPage()),
          Container(key: _servicesKey, child: ServicesPortion(color: lightGreenColor, text: "My Services", servicesData: dummyServiceData)),
          Container(key: _worksKey, child: PortfolioPage()),
          Container(key: _journeyKey, child: ExperienceJourney()),
          Container(key: _contactKey, child: ContactSection()),
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
          Container(
              key: _homeKey,
              child: ImageAssetContainer(
                image: 'assets/Ubaid (1).png',
                isMobileView: true,
                height: 200,
                portfolioOnPressed: () {
                  _scrollToSection(_worksKey);
                },
              )),
          Container(key: _aboutKey, child: AboutPage()),
          Container(key: _servicesKey, child: ServicesPortion(color: lightGreenColor, text: "Services", servicesData: dummyServiceData)),
          Container(key: _worksKey, child: PortfolioPage(isNarrow: true)),
          Container(key: _journeyKey, child: ExperienceJourney()),
          Container(key: _contactKey, child: ContactSection()),
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
