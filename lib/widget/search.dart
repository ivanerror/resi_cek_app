import 'package:flutter/material.dart';
import 'package:resi_cek_app/Page/resi_detail.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final resiInputController = TextEditingController();

  @override
  void dispose() {
    resiInputController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    String inputText = resiInputController.text;

    if (inputText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Input can't be empty"),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResiDetail(
            resiId: inputText,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 180),
      // Container for TextField
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).dividerColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 5),
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: resiInputController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: "ID Resi e.g 1232112323...",
                  hintStyle: TextStyle(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.grey[500],
                onPressed: () {
                  _onSubmit();
                },
                icon: const Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
    );
  }
}
