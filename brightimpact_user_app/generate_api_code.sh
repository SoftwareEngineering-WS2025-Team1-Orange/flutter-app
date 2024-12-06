rm -r lib/api
openapi-generator-cli generate -i api-specification/specification-user-app.yaml -g dart-dio -o lib/api --additional-properties=modelNameSuffix=Dto,serializationLibrary=json_serializable
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs --verbose
