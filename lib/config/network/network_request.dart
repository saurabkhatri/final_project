import 'package:dio/dio.dart';
import 'package:final_project/features/joke_headlines/BinitaModel.dart';

import 'api_endpoints.dart';

class NetworkRequest {

  final dio = Dio();

  Future  getjokeHeading() async{


    final response = await dio.get(ApiEndpoints.jokeHeadLines);

    if(response.statusCode == 200 || response.statusCode == 201){

      ///Success
      return BinitaModel.fromJson(response.data);

    }
    else {

      ///failure
      return [];
    }

    print("NEWS Response");
    print(response);
    }
}
