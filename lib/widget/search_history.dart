import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resi_cek_app/Page/resi_detail.dart';
import 'package:resi_cek_app/db/db.dart';
import 'package:resi_cek_app/Model/search_history.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          child: Text(
            'Riwayat Pencarian',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
        const Expanded(child: ListViewTile())
      ],
    );
  }
}

class ListViewTile extends StatefulWidget {
  const ListViewTile({Key? key}) : super(key: key);

  @override
  State<ListViewTile> createState() => _ListViewTileState();
}

class _ListViewTileState extends State<ListViewTile> {
  final DBHelper handler = DBHelper();
  late Future<List<SearchHistoryModel>> dataFuture;

  List history = [];
  @override
  void initState() {
    super.initState();
    handler.initializeDB().whenComplete(() async {
      setState(() {});
    });
    dataFuture = handler.getSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<SearchHistoryModel>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              displacement: 0,
              onRefresh: () async {
                setState(() {
                  dataFuture = handler.getSearchHistory();
                });
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data![index].resi_id,
                    ),
                    subtitle: Text(
                      snapshot.data![index].courier,
                    ),
                    trailing: Text(
                      snapshot.data![index].updated_date,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResiDetail(
                                resiId: snapshot.data![index].resi_id,
                                courier: snapshot.data![index].courier,
                              )));
                    },
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
