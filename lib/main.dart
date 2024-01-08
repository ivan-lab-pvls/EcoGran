import 'package:ecogrand_bank/core/config.dart';
import 'package:ecogrand_bank/core/notifx.dart';
import 'package:ecogrand_bank/custom_button.dart';
import 'package:ecogrand_bank/custom_theme.dart';
import 'package:ecogrand_bank/data/incomes_controller.dart';
import 'package:ecogrand_bank/pres/main/main.dart';
import 'package:ecogrand_bank/pres/on_b/on_b.dart';
import 'package:ecogrand_bank/pres/prem/prem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: AppFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 9),
    minimumFetchInterval: const Duration(seconds: 9),
  ));

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await NotificationsFb().activate();
  final pr = await SharedPreferences.getInstance();
  runApp(MyApp(pr));
}

class MyApp extends StatelessWidget {
  const MyApp(this._pr, {super.key});
  final SharedPreferences _pr;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IncomesController(_pr),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.theme,
        home: const StartPage(),
      ),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var _l = true;
  var _wasOnBoarding = false;
  String? _pre;
  @override
  void initState() {
    super.initState();
    _s();
  }

  void _s() async {
    final pr = await SharedPreferences.getInstance();
    _plsSetStars(pr);
    final conf = FirebaseRemoteConfig.instance;
    final str = conf.getString('pre');
    if (!str.contains('isPre')) {
      setState(() {
        _pre = str;
      });
      return;
    }

    setState(() {
      _wasOnBoarding = pr.getBool('wasOnBoarding') ?? false;
      _l = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_pre != null) {
      return Prem(prem: _pre!);
    }
    if (_l) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }

    if (!_wasOnBoarding) {
      return OnB();
    }

    return Main();
  }
}

Future<void> _plsSetStars(SharedPreferences bd) async {
  final rev = InAppReview.instance;
  bool alreadyRated = bd.getBool('isRated') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await bd.setBool('isRated', true);
    }
  }
}
