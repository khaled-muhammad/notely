import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Qoute',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            Container(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dec 24',
                  style: TextStyle(
                    color: Colors.grey.shade700
                  ),
                ),
                Text(
                  'Quote',
                  style: TextStyle(
                    color: Colors.grey.shade700
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}