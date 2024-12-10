rm -r lib/api
openapi-generator-cli generate -i api-specification/specification-user-app.yaml -g dart-dio -o lib/api --additional-properties=modelNameSuffix=Dto,serializationLibrary=json_serializable
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs --verbose

#!/bin/bash

PUBSPEC_FILE="lib/api/pubspec.yaml"
if [[ -f "$PUBSPEC_FILE" ]]; then   
    sed -i '' "s/sdk: '>=2.17.0 <4.0.0'/sdk: '^3.5.0'/" "$PUBSPEC_FILE"
    echo "Updated SDK version in pubspec.yaml"
fi
