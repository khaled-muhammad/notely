import 'package:flutter/material.dart';
import 'package:notely/widgets/store_val.dart';

class ViewSwitcher extends StatefulWidget {
  final List<String> options;
  final List<Widget> widgets;
  final Function? onChanged;

  const ViewSwitcher({required this.options, required this.widgets, required this.onChanged});

  @override
  _ViewSwitcherState createState() => _ViewSwitcherState();
}

class _ViewSwitcherState extends State<ViewSwitcher> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    int itsNumber = -1;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...widget.options.map((e) {
                itsNumber ++;

                return StoreVal(
                  itsNumber,
                  (val) {
                    return GestureDetector(
                      onTap: () {
                        if (current != val) {
                          setState(() {
                            current = val;
                          });
                        }
                        if (widget.onChanged != null) {
                          widget.onChanged!(current);
                        }
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              e,
                              style: TextStyle(
                                fontSize: 18,
                                color: val == current ? Color.fromRGBO(255, 185, 66, 1) : null,
                              ),
                            ),
                            SizedBox(height: 10,),
                            AnimatedContainer(
                              curve: Curves.easeOutQuint,
                              duration: Duration(milliseconds: 500),
                              height: val == current ? 5 : 0,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 185, 66, 1),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
            ],
          ),
          SizedBox(height: 20,),
          Container(
            child: widget.widgets[current],
          ),
        ],
      ),
    );
  }
}