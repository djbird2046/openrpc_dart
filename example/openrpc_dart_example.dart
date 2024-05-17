import 'package:openrpc_dart/openrpc_dart.dart';
import 'dart:io';

void main() async {
  List<String> jsonFileNameList = [];
  jsonFileNameList.add("api-with-examples-openrpc.json");
  jsonFileNameList.add("empty-openrpc.json");
  jsonFileNameList.add("link-example-openrpc.json");
  jsonFileNameList.add("metrics-openrpc.json");
  jsonFileNameList.add("params-by-name-petstore-openrpc.json");
  jsonFileNameList.add("petstore-expanded-openrpc.json");
  jsonFileNameList.add("petstore-openrpc.json");
  jsonFileNameList.add("simple-math-openrpc.json");

  String currentWorkingDirectory = Directory.current.path;
  jsonFileNameList.forEach((jsonFileName) async {
    print("FILE_NAME: $jsonFileName");
    String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
    OpenRPCLoader openRPCLoader = OpenRPCLoader();
    OpenRPC openRPC = await openRPCLoader.load(jsonPath);
    print("title: ${openRPC.info.title}");
  });
}

