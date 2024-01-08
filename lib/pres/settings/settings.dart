import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/pres/news/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: CustomTheme.whiteColor,
            fontWeight: FontWeight.w900,
            fontSize: 32,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: CustomTheme.dividerColor,
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          SettingItem(
            onTap: () {
              Share.share('Welcome to our app! Download - https://apps.apple.com/us/app/the-ecogrand/id6475674141');
            },
            path: 'assets/settings/arrow.svg',
            title: 'Share with friends',
          ),
          SettingItem(
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowLiveMatches(
                    matches:
                        'https://docs.google.com/document/d/11CkvJ4rpyJ-Xzx2NsXrRi57O3Ag5Dhf6c9a99ANPqZw/edit?usp=sharing',
                  ),
                ),
              );
            },
            path: 'assets/settings/shield.svg',
            title: 'Privacy Policy',
          ),
          SettingItem(
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowLiveMatches(
                    matches:
                        'https://docs.google.com/document/d/1SSaD2b2zlScvbLjp73vd_C2YoUbntn5RHwGJ0KUg3t4/edit?usp=sharing',
                  ),
                ),
              );
            },
            path: 'assets/settings/sheet.svg',
            title: 'Terms of use',
          ),
          SettingItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowLiveMatches(
                    matches:
                        'https://forms.gle/eMY4wwH11ZZbWX3w5',
                  ),
                ),
              );
            },
            path: 'assets/settings/person.svg',
            title: 'Write support',
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.onTap,
      required this.path,
      required this.title});
  final VoidCallback onTap;
  final String path;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  SvgPicture.asset(path),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: CustomTheme.whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: CustomTheme.dividerColor,
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
