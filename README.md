# openrpc_dart
An OpenRPC JSON Spec Parser for dart, from: https://spec.open-rpc.org/
- OpenRPC version: 1.3

## Features

- Load OpenRPC json file, and convert to dart object

## Usage

According to `/example/openrpc_dart_example.dart`

```dart
String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
OpenRPCLoader openRPCLoader = OpenRPCLoader();
OpenRPC openRPC = await openRPCLoader.load(jsonPath);
```