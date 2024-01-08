import 'dart:ui';

import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/pres/home/home.dart';
import 'package:ecogrand_bank/pres/news/news.dart';
import 'package:ecogrand_bank/pres/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            IndexedStack(
              index: _index,
              children: [
                Home(
                  goToNews: () => _onTap(1),
                ),
                NewsPage(),
                Settings(),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                color: CustomTheme.darkGreyColor.withOpacity(0.60),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24, top: 16),
                      child: Row(
                        children: [
                          MainItem(
                            path: 'assets/bar/home.svg',
                            title: 'Home',
                            onTap: () => _onTap(0),
                            active: _index == 0,
                          ),
                          MainItem(
                            path: 'assets/bar/news.svg',
                            title: 'News',
                            onTap: () => _onTap(1),
                            active: _index == 1,
                          ),
                          MainItem(
                            path: 'assets/bar/cogs.svg',
                            title: 'Settings',
                            onTap: () => _onTap(2),
                            active: _index == 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int i) {
    setState(() {
      _index = i;
    });
  }
}

class MainItem extends StatelessWidget {
  const MainItem(
      {super.key,
      required this.path,
      required this.title,
      required this.onTap,
      required this.active});
  final String path;
  final String title;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              path,
              colorFilter: ColorFilter.mode(
                active
                    ? Theme.of(context).primaryColor
                    : const Color(0xFF979797),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: active
                    ? Theme.of(context).primaryColor
                    : const Color(0xFF979797),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
