import 'package:flutter/material.dart';
import 'package:resi_cek_app/widget/search_history.dart';
import 'package:resi_cek_app/widget/search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            color: Colors.green[300],
            height: 200,
          ),
          const Search()
        ],
      ),
      Container(
        margin: const EdgeInsets.all(20),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: const SearchHistory(),
      ),
    ]);
  }
}
