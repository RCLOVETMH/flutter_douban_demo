import 'package:dio/dio.dart';
import 'package:doubanapp/network/http_config.dart';
// 静态方法只能使用静态的属性
class HttpRequest{
  // 1、创建DIO实例
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: TIMEOUT,
  );
  static final dio = Dio(baseOptions);

  static Future request(String url,{String method = "get",Map<String,dynamic> params}) async{
    // 2、发送网络请求
    Options options = Options(method: method);
    try { // 请求成功
      final result = await dio.request(url,queryParameters: params,options: options);
      return result;
    } on DioError catch(err){ // 请求失败
      throw err;
    }
  }
}
