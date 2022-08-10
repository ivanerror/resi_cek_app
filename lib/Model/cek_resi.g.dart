// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_resi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CekResi _$CekResiFromJson(Map<String, dynamic> json) {
  return CekResi(
    status: json['status'] as int,
    message: json['message'] as String,
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CekResiToJson(CekResi instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
