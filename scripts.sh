cd openapi
openapi-generator generate -i openapi.yaml -g dart-dio-next
flutter pub get
flutter pub run build_runner build
