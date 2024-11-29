import 'dart:convert';

import 'package:crud_bloc/login/model/login_req_model.dart';
import 'package:crud_bloc/login/model/login_resp_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<LoginRespModel> login(String userName, String password) async {
    var url = "https://crud.theharshgupta.com/api/v1/user/login";

    LoginReqModel loginReqModel =
        LoginReqModel(username: userName, password: password);
    http.Response response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginReqModel.toJson()));

    try {
      if (response.statusCode == 200) {
        //var resp = response.body;

        return LoginRespModel.fromJson(jsonDecode(response.body));
      } else {
        return LoginRespModel();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
