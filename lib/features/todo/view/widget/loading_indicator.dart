import 'package:flutter/material.dart';

class LoadingIndiactor extends StatelessWidget {
  const LoadingIndiactor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
