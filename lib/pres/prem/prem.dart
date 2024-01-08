import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Prem extends StatelessWidget {
  const Prem({
    super.key,
    required this.prem,
  });
  final String prem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(prem),
          ),
        ),
      ),
    );
  }
}
