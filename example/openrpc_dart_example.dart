import 'package:openrpc_dart/openrpc_dart.dart';
import 'dart:io';

void main() async {
  List<String> jsonFileNameList = [
    "api-with-examples-openrpc.json",
    "empty-openrpc.json",
    "link-example-openrpc.json",
    "metrics-openrpc.json",
    "params-by-name-petstore-openrpc.json",
    // "petstore-expanded-openrpc.json",    //allOf, oneOf, anyOf UNSUPPORTED
    "petstore-openrpc.json",
    "simple-math-openrpc.json"
  ];

  String currentWorkingDirectory = Directory.current.path;
  jsonFileNameList.forEach((jsonFileName) async {
    print("FILE_NAME: $jsonFileName");
    String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
    OpenRPCLoader openRPCLoader = OpenRPCLoader();
    OpenRPC openRPC = await openRPCLoader.loadFromFile(jsonPath);
    print("title: ${openRPC.info.title}");
  });
}

