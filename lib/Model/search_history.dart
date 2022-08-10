// ignore_for_file: non_constant_identifier_names

class SearchHistoryModel {
  int? id;
  String resi_id;
  String courier;
  String created_date;
  String updated_date;

  SearchHistoryModel({
    this.id,
    required this.resi_id,
    required this.courier,
    required this.created_date,
    required this.updated_date,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "resi_id": resi_id,
      "courier": courier,
      "created_date": created_date,
      "updated_date": updated_date
    };
  }

  @override
  String toString() {
    return 'resi_id : $resi_id, courier: $courier, createdDate: $created_date, updateDate: $updated_date';
  }
}
