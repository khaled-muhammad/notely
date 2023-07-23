import 'package:flutter/material.dart';
import 'package:notely/helpers/main_helper.dart';
import 'package:notely/models/folder.dart';
import 'package:notely/providers/folders.dart';
import 'package:notely/widgets/empty_list.dart';
import 'package:notely/widgets/folder_card.dart';
import 'package:notely/widgets/note_card.dart';
import 'package:notely/widgets/view_switcher.dart';
import 'package:provider/provider.dart';

Future _asyncInputDialog(BuildContext context, String title, String labelText, String hintText) async {
  String teamName = '';
  return showDialog(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: new Row(
          children: [
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: labelText, hintText: hintText),
              onChanged: (value) {
                teamName = value;
              },
            ))
          ],
        ),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    Folders folders = Provider.of<Folders>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: [
                      Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                          Icons.search_rounded,
                          color: Colors.white38,
                      ),
                      SizedBox(width: 10,),
                      Icon(
                          Icons.menu_rounded,
                          color: Colors.white38,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 35,),
              Center(
                child: ViewSwitcher(
                  options: ['All', 'Folder'],
                  widgets: [
                    NoteCard(),
                    folders.getItems.length == 0 ?
                    Transform.translate(
                      offset: Offset(0, 150),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: EmptyList(
                          title: 'Oops! There are no folders that you have created',
                          icon: Icons.folder_rounded,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(106, 48, 147, 1),
                              Color.fromRGBO(160, 68, 255, 1)
                            ]
                          )
                        ),
                      ),
                    ) :
                    Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: MediaQuery.of(context).size.width*0.7,
                          childAspectRatio: 3/5,
                          crossAxisSpacing: 20,
                        ),
                        children: <Widget>[
                          ...folders.getItems.map((Folder folder) {
                            return Column(
                              children: [
                                FolderCard(
                                  id: folder.id,
                                  name: folder.name,
                                ),
                              ],
                            );
                          })
                        ],
                      ),
                    )
                  ],
                  onChanged: (newVal) {
                    setState(() {
                      currentScreen = newVal;
                    });
                  }
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: currentScreen == 0 ?
        () {

        } :
        () {
          /*_asyncInputDialog(context, 'Enter folder name:', 'folder name', 'Diary').then((value) {
            folders.add(Folder(id: folders.getItems.length, name: value, notes: []));
          });*/
          asyncInputDialog(
            context,
            'Create new folder',
            [
              ['text_field', 'folder_name', 'folder name', 'Diary'],
            ]
          ).then((value) {
            folders.add(Folder(id: folders.getItems.length, name: value['folder_name'], notes: []));
          });
        },
        backgroundColor: Color.fromRGBO(101, 100, 193, 1),
        child: Icon(
          currentScreen == 0 ? Icons.add : Icons.create_new_folder_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}