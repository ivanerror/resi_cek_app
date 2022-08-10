import 'package:json_annotation/json_annotation.dart';

part 'cek_resi.g.dart';

@JsonSerializable()
class CekResi {
  CekResi({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory CekResi.fromJson(Map<String, dynamic> json) => CekResi(
      status: json["status"],
      message: json["message"],
      data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "data": data.toJson()};
}

class Data {
  Data({required this.summary, required this.detail, required this.history});

  Summary summary;
  Detail detail;
  List<History> history;

  factory Data.fromJson(Map<String, dynamic> json) {
    List historyObjsJson = json["history"] as List;
    List<History> history = historyObjsJson
        .map((historyJson) => History.fromJson(historyJson))
        .toList();

    return Data(
      detail: Detail.fromJson(json["detail"]),
      summary: Summary.fromJson(json["summary"]),
      history: history,
    );
  }

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "summary": summary,
        "history": history,
      };
}

class Summary {
  Summary(
      {required this.awb,
      required this.courier,
      required this.service,
      required this.status,
      required this.date,
      required this.amount,
      required this.weight});

  String awb, courier, service, status, date, amount, weight;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        awb: json["awb"],
        courier: json["courier"],
        service: json["service"],
        status: json["status"],
        date: json["date"],
        amount: json["amount"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "awb": awb,
        "courier": courier,
        "service": service,
        "status": status,
        "date": date,
        "amount": amount,
        "weight": weight
      };
}

class Detail {
  Detail(
      {required this.origin,
      required this.destination,
      required this.shipper,
      required this.receiver});

  String origin;
  String destination;
  String shipper;
  String receiver;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
      origin: json["origin"],
      destination: json["destination"],
      shipper: json["shipper"],
      receiver: json["receiver"]);

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "shipper": shipper,
        "receiver": receiver
      };
}

class History {
  History({required this.date, required this.desc, required this.location});

  String date;
  String desc;
  String location;

  factory History.fromJson(Map<String, dynamic> json) => History(
        date: json["date"],
        desc: json["desc"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() =>
      {"date": date, "desc": desc, "location": location};
}
