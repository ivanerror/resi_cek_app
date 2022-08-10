import 'package:resi_cek_app/Model/cek_resi.dart';
import 'package:resi_cek_app/constant/constant.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = API_URL;
  final _apiKeys = API_KEYS;

  Future<CekResi?> getCekResi(
      {required String resiId, required String courier}) async {
    CekResi? cekResi;

    try {
      Response cekResiData = await _dio.get(
          '${_baseUrl}v1/track?api_key=$_apiKeys&courier=$courier&awb=$resiId');

      cekResi = CekResi.fromJson(cekResiData.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return cekResi;
  }
}
