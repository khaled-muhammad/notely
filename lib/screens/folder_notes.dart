import 'package:flutter/material.dart';
import 'package:notely/helpers/main_helper.dart';
import 'package:notely/models/note.dart';
import 'package:notely/providers/folders.dart';
import 'package:notely/widgets/empty_list.dart';
import 'package:notely/widgets/note_card.dart';
import 'package:provider/provider.dart';

class FolderNotes extends StatelessWidget {
  final int id;

  const FolderNotes({required this.id});

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
                  Row(
                    children: [
                      Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white38,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Folders',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                        ),
                      ),
                    ],
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
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: folders.getItems[id].notes.length == 0 ?
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: EmptyList(
                    title: 'Oops! There are no notes that you have created',
                    icon: Icons.note_rounded,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(106, 48, 147, 1),
                        Color.fromRGBO(160, 68, 255, 1)
                      ]
                    )
                  ),
                ) :
                GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width*0.7,
                    childAspectRatio: 3/5,
                    crossAxisSpacing: 20,
                  ),
                  children: <Widget>[
                    ...folders.getItems[id].notes.map((Note note) {
                      return Column(
                        children: [
                          NoteCard(),
                        ],
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          asyncInputDialog(
            context,
            'Create Note',
            [
              ['checkbox', 'note_title', 'note title', 'quote']
            ]
          );
        },
        backgroundColor: Color.fromRGBO(101, 100, 193, 1),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}