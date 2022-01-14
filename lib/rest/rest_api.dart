import 'dart:convert';
import 'dart:io';

Future readResponse(
    HttpClientResponse resp,
    Function(dynamic jsonDyn) successTrue,
    Function(dynamic message) successFalse) async {
  try {
    String jsonStr = await utf8.decodeStream(resp);
    // ignore: unnecessary_null_comparison
    if (jsonStr != null) {
      dynamic jsonDyn = json.decode(jsonStr);
      if (jsonDyn["success"]) {
        successTrue(jsonDyn);
      } else {
        successFalse(jsonDyn);
      }
    }
  } catch (e) {
    Map data = {
      "message": "Sunucu iletişimi yok.",
      "name_surname": "",
      "tc": ""
    };
    successFalse(data);
  }
}

Future userLogin(
    String hastaTC,
    String hastaParola,
    Function(dynamic jsonDyn) successTrue,
    Function(dynamic message) successFalse) async {
  HttpClient httpClient = new HttpClient();
  try {
    HttpClientRequest req =
        await httpClient.postUrl(Uri.parse("http://10.0.2.2:3000/user/login"));
    req.headers.set('content-type', 'application/json');
    Map data = {'hastaTC': hastaTC, 'hastaParola': hastaParola};
    req.add(utf8.encode(json.encode(data)));
    HttpClientResponse resp = await req.close();

    if (resp.statusCode == 200) {
      await readResponse(resp, successTrue, successFalse);
    } else {
      data = {"message": "Sunucu iletişimi yok.", "name_surname": "", "tc": ""};
      successFalse(data);
    }
  } catch (e) {
    Map data = {
      "message": "Sunucu iletişimi yok.",
      "name_surname": "",
      "tc": ""
    };
    successFalse(data);
  } finally {
    httpClient.close();
  }
}

Future saveUser(
    String tc,
    String pass,
    String name,
    String unvan,
    Function(dynamic jsonDyn) successTrue,
    Function(dynamic message) successFalse) async {
  HttpClient httpClient = new HttpClient();
  try {
    HttpClientRequest req = await httpClient
        .postUrl(Uri.parse("http://10.0.2.2:3000/user/register"));
    req.headers.set('content-type', 'application/json');
    Map data = {'tc': tc, 'pass': pass, "name": name, "unvan": unvan};
    req.add(utf8.encode(json.encode(data)));
    HttpClientResponse resp = await req.close();

    if (resp.statusCode == 200) {
      await readResponse(resp, successTrue, successFalse);
    } else {
      data = {"message": "Sunucu iletişimi yok.", "name_surname": "", "tc": ""};
      successFalse(data);
    }
  } catch (e) {
    Map data = {
      "message": "Sunucu iletişimi yok.",
      "name_surname": "",
      "tc": ""
    };
    successFalse(data);
  } finally {
    httpClient.close();
  }
}

Future getDoktor(Function(dynamic jsonDyn) successTrue,
    Function(dynamic message) successFalse) async {
  HttpClient httpClient = new HttpClient();
  try {
    HttpClientRequest req = await httpClient
        .postUrl(Uri.parse("http://10.0.2.2:3000/user/get-doktor"));
    req.headers.set('content-type', 'application/json');
    Map data = {};
    req.add(utf8.encode(json.encode(data)));
    HttpClientResponse resp = await req.close();

    if (resp.statusCode == 200) {
      await readResponse(resp, successTrue, successFalse);
    } else {
      data = {"message": "Sunucu iletişimi yok.", "name_surname": "", "tc": ""};
      successFalse(data);
    }
  } catch (e) {
    Map data = {
      "message": "Sunucu iletişimi yok.",
      "name_surname": "",
      "tc": ""
    };
    successFalse(data);
  } finally {
    httpClient.close();
  }
}

Future getDoktorUzmanlik(Function(dynamic jsonDyn) successTrue,
    Function(dynamic message) successFalse) async {
  HttpClient httpClient = new HttpClient();
  try {
    HttpClientRequest req = await httpClient
        .postUrl(Uri.parse("http://10.0.2.2:3000/user/get-uzmanlik"));
    req.headers.set('content-type', 'application/json');
    Map data = {};
    req.add(utf8.encode(json.encode(data)));
    HttpClientResponse resp = await req.close();

    if (resp.statusCode == 200) {
      await readResponse(resp, successTrue, successFalse);
    } else {
      data = {"message": "Sunucu iletişimi yok.", "name_surname": "", "tc": ""};
      successFalse(data);
    }
  } catch (e) {
    Map data = {
      "message": "Sunucu iletişimi yok.",
      "name_surname": "",
      "tc": ""
    };
    successFalse(data);
  } finally {
    httpClient.close();
  }
}

/*Future UserSignup(
    String hastaTC,
    String hastaParola,
    String hastaAd,
    Function(dynamic jsonDyn) successTrue,
    Function(dynamic message) successFalse) async {
  HttpClient httpClient = new HttpClient();
  try {
    HttpClientRequest req =
        await httpClient.getUrl(Uri.parse("http://10.0.2.2:3000/user/register"));
    req.headers.set('content-type', 'application/json');
    Map data = {'hastaTC': hastaTC, 'hastaAd': hastaAd, 'hastaParola': hastaParola};
    req.add(utf8.decode(json.decode(data)));
    HttpClientResponse resp = await req.close();

    if (resp.statusCode == 200) {
      await readResponse(resp, successTrue, successFalse);
    } else {
      data = {"message": "Sunucu iletişimi yok.", "name_surname": "", "tc": ""};
      successFalse(data);
    }
  } catch (e) {
    Map data = {
      "message": "Sunucu iletişimi yok.",
      "name_surname": "",
      "tc": ""
    };
    successFalse(data);
  } finally {
    httpClient.close();
  }
}*/
