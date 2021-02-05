import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewWidget extends StatelessWidget {
  final String url;
  webViewWidget({this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        url: url,
        appBar:  AppBar(
          title:  Text("Widget webview"),
          backgroundColor: Color.fromRGBO(206, 53, 51,1.0),
        ),
      ),
    );



    // return WebView(
    //     initialUrl: 'https://www.baidu.com',
    //     javascriptMode: JavascriptMode.unrestricted,
    //     onWebViewCreated: (WebViewController webViewController) {
    //   // _controller.complete(webViewController);
    // });
  }
}
