import 'package:flutter/material.dart';
import 'package:resi_cek_app/Model/cek_resi.dart';
import 'package:resi_cek_app/Model/search_history.dart';
import 'package:resi_cek_app/db/db.dart';
import 'package:resi_cek_app/helper/dio_client.dart';
import 'package:resi_cek_app/constant/constant.dart';
import 'package:resi_cek_app/Model/cek_resi.dart';
import 'package:resi_cek_app/helper/helper.dart';

class ResiDetail extends StatefulWidget {
  const ResiDetail({
    Key? key,
    required this.resiId,
    this.courier = "",
  }) : super(key: key);

  final String resiId;
  final String? courier;

  @override
  State<ResiDetail> createState() => _ResiDetailState();
}

class _ResiDetailState extends State<ResiDetail> {
  final DioClient _client = DioClient();
  final DBHelper handler = DBHelper();

  String courier = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      courier = widget.courier!;
    });
  }

  void _courierButtonHandler(String courier) {
    setState(() {
      this.courier = courier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Text(
          widget.resiId,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: courier.isEmpty
          ? Container(
              alignment: Alignment.topCenter,
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: courierType.map(
                  (e) {
                    return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(e.color),
                        ),
                        onPressed: () {
                          _courierButtonHandler(e.code);
                        },
                        child: Text(e.name));
                  },
                ).toList(),
              ),
            )
          : Center(
              child: FutureBuilder<CekResi?>(
                future:
                    _client.getCekResi(resiId: widget.resiId, courier: courier),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.green,
                    );
                  }
                  if (!snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Invalid Resi ID"),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Go Back"))
                      ],
                    );
                  }

                  if (snapshot.hasData) {
                    CekResi? resiData = snapshot.data;
                    Data? data = resiData!.data;
                    List<History>? history = data.history;

                    var addHistory = handler.insertHistory(
                      SearchHistoryModel(
                          resi_id: widget.resiId,
                          courier: courier,
                          created_date: convertDate(DateTime.now()),
                          updated_date: convertDate(DateTime.now())),
                    );

                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 10,
                      child: Expanded(
                        child: ListView.builder(
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(history[index].desc),
                                subtitle: Text(history[index].location),
                                trailing: Text(history[index].date),
                              );
                            }),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
    );
  }
}
