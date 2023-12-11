// page_wrapper.dart

import 'package:common_loading_skeleton/src/widgets/common/awesome_loading.dart';
import 'package:common_loading_skeleton/src/widgets/common/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatefulWidget {
  final Future<void> Function() onInit;
  final Widget child;
  final String appBarTitle;
  final List<Widget>? appBarActions;
  final String? loadingMessage;
  final String? error;

  const PageWrapper({
    Key? key,
    required this.onInit,
    required this.child,
    required this.appBarTitle,
    this.appBarActions,
    this.loadingMessage,
    this.error,
  }) : super(key: key);

  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  late Future<void> _initFuture;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initFuture = widget.onInit();
  }

  // Retry the initialization logic
  Future<void> onTryAgain() async {
    setState(() {
      _initFuture = widget.onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: widget.appBarActions,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<void>(
              future: _initFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading state
                  return _buildLoading();
                } else if (snapshot.hasError || widget.error != null) {
                  // Error state
                  return _buildError(widget.error ?? "Something went wrong");
                } else {
                  // Success state
                  return widget.child;
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // Widget for displaying loading state
  Widget _buildLoading() {
    return Container(
      alignment: Alignment.center,
      child: AwesomeLoading(
        loadingMessage: widget.loadingMessage,
      ),
    );
  }

  // Widget for displaying error state
  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 16),
          PrimaryButton(onClick: onTryAgain, label: "Try Again"),
        ],
      ),
    );
  }
}
