import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBody extends StatefulWidget {
  final String siteName;

  const WebBody({super.key, required this.siteName});

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  late WebViewController controller;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          isLoading = true;
          setState(() {});
        },
        onPageStarted: (url) {
          isLoading = true;
          setState(() {});
        },
        onPageFinished: (url) {
          isLoading = false;
          setState(() {});
        },
        onWebResourceError: (error) {
          isLoading = false;
          setState(() {});
        },
      ))
      ..loadRequest(Uri.parse("https://${widget.siteName}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Stack(),
        WebViewWidget(controller: controller)
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => backProcess(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  // -- Functions --
  backProcess() async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      snackBarFunction();
    }
  }

  snackBarFunction() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('No more to go!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  reloadSite() {
    controller.loadRequest(Uri.parse("https://${widget.siteName}"));
  }
}
