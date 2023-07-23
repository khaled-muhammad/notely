import 'package:flutter/material.dart';

class StoreVal extends StatelessWidget {
  final val;
  final Function run;

  const StoreVal(this.val, this.run);

  @override
  Widget build(BuildContext context) {
    return run(val);
  }
}