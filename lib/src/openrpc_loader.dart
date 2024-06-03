import 'dart:convert';
import 'dart:io';
import 'model/components.dart';
import 'model/open_rpc.dart';
import 'model/schema.dart';

class OpenRPCLoader {
  Map<String, dynamic>? componentsJson;
  Map<String, dynamic>? schemasJson;

  Future<OpenRPC> load(String jsonString) async {
    Map<String, dynamic> openRPCMap = jsonDecode(jsonString);
    componentsJson = openRPCMap["components"];
    if (componentsJson != null) {
      schemasJson = componentsJson!["schemas"];
      if (schemasJson != null) {
        SchemasSingleton.initInstance(schemasJson!);
      }
      ComponentsSingleton.initInstance(componentsJson!);
    }
    OpenRPC openRPC = OpenRPC.fromJson(openRPCMap);
    return openRPC;
  }

  Future<OpenRPC> loadFromFile(String jsonPath) async {
    File file = File(jsonPath);
    String jsonString = await file.readAsString();
    return await load(jsonString);
  }
}