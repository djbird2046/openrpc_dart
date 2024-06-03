# openrpc_dart
An OpenRPC JSON Spec Parser for dart, from: https://spec.open-rpc.org/
- OpenRPC version: 1.3

## Features

- Load OpenRPC json file, and convert to dart object

## Usage

According to `/example/openrpc_dart_example.dart`

- From JSON String
```dart
Future<void> main() async {
  String jsonString = "{...OpenRPC String...}";
  OpenRPCLoader openRPCLoader = OpenRPCLoader();
  OpenRPC openRPC = await openRPCLoader.load(jsonString);
}
```
- From JSON File
```dart
Future<void> main() async {
  String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
  OpenRPCLoader openRPCLoader = OpenRPCLoader();
  OpenRPC openRPC = await openRPCLoader.loadFromFile(jsonPath);
}
```