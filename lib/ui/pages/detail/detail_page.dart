import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  final String link;

  const DetailPage({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          link.trim().isEmpty
              ? Center(child: Text('유효한 링크가 없습니다.'))
              : InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(link)),
                initialSettings: InAppWebViewSettings(
                  userAgent:
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
                ),
              ),
    );
  }
}
