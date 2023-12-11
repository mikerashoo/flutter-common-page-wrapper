import 'package:flutter/material.dart';

class AwesomeLoading extends StatelessWidget {
  const AwesomeLoading({super.key, this.loadingMessage });
  final String? loadingMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          // Customize this part based on your awesome loading animation
         const CircularProgressIndicator(

         ),
          const SizedBox(height: 16),
          Text(
            // IF loading message ezists show message else show loading
            loadingMessage ?? 'Loading...',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}