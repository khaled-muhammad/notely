import 'package:flutter/material.dart';

Future asyncInputDialog(BuildContext context, String title, List<List<String>> fields) async {
  Map<String, dynamic> vals = {};//String title, String labelText, String hintText
  int currentField = -1;

  return showDialog(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(title)),
        content: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    ...fields.map((e) {
                      currentField++;

                      return e[0] == "text_field" ? TextField(
                        autofocus: currentField == 0 ? true : false,
                        decoration: InputDecoration(
                          labelText: e[2],
                          hintText: e[3],
                        ),
                        onChanged: (value) {
                          vals[e[1]] = value;
                        },
                      ) : Builder(
                        builder: (ctx) {
                          print(vals[e[1]]);
                          vals[e[1]] = false;
                          return Checkbox(
                            value: vals[e[1]],
                            onChanged: (value) {
                              vals[e[1]] = value;
                              print(vals[e[1]]);
                            }
                          );
                        },
                      );
                    }),
                  ],
                ),
              )
            )
          ],
        ),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(vals);
            },
          ),
        ],
      );
    },
  );
}