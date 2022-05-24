import 'package:flutter/material.dart';

class FavAllCard extends StatelessWidget {
  const FavAllCard({
    Key? key,
    required this.text,
    required this.count,
    required this.icon,
  }) : super(key: key);
  final String text;
  final int count;
  final IconData icon;
//Ricky：進入分類選單後，下面的橫條
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
          ),
          Text(
            count.toString(),
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.black.withOpacity(0.5)),
    );
  }
}
