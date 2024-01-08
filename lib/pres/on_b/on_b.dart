import 'package:ecogrand_bank/custom_button.dart';
import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/pres/main/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnB extends StatefulWidget {
  const OnB({super.key});

  @override
  State<OnB> createState() => _OnBState();
}

class _OnBState extends State<OnB> {
  final PageController _cntrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _cntrl,
          children: [
            OnBChild(
              i: 'assets/1.png',
              index: 0,
              text:
                  'Discover all the features of our convenient and secure mobile banking.',
              onTap: () {
                _cntrl.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            OnBChild(
              i: 'assets/2.png',
              index: 1,
              text:
                  'Manage your finances, make payments, and receive notifications about your transactions - all in one app!',
              onTap: () {
                _cntrl.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            OnBChild(
              i: 'assets/3.png',
              index: 2,
              text:
                  'Track your expenses and income to always stay informed about your financial situation.',
              onTap: () async {
                final navigator = Navigator.of(context);
                final pr = await SharedPreferences.getInstance();
                await pr.setBool('wasOnBoarding', true);
                navigator.pushReplacement(MaterialPageRoute(
                  builder: (context) => Main(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OnBChild extends StatelessWidget {
  const OnBChild(
      {super.key,
      required this.index,
      required this.i,
      required this.text,
      required this.onTap});
  final int index;
  final String i;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Steps(i: index),
          const Spacer(flex: 2),
          Image.asset(
            i,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(flex: 2),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF979797),
              fontSize: 16,
            ),
          ),
          const Spacer(),
          CustomButton(
            onTap: onTap,
            text: 'Next',
          ),
          const Spacer(),
          const Text(
            'Terms of use  |  Privacy Policy',
            style: TextStyle(
              color: CustomTheme.lightGreyColor,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}

class Steps extends StatelessWidget {
  const Steps({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          flex: index == i ? 3 : 2,
          child: Container(
            margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: index == i
                  ? Theme.of(context).primaryColor
                  : CustomTheme.lightGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
