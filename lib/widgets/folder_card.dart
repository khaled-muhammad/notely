import 'package:flutter/material.dart';
import 'package:notely/providers/folders.dart';
import 'package:notely/screens/folder_notes.dart';
import 'package:provider/provider.dart';

class FolderCard extends StatelessWidget {
  final int id;
  final String name;

  const FolderCard({Key? key, required this.name, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<Folders>(create: (ctx) => Folders()),
            ],
            child: FolderNotes(id: id),
          );
        }));
      },
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/folder_icon.png', width: 120,),
              SizedBox(height: 35,),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}