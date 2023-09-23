openapi-generator-cli generate \
  -i expanded/openapi.yaml \
  -g dart-dio \
  -o ../repaint_api_client \
  --additional-properties=pubAuthor=tuxsnct,pubAuthorEmail=work@tuxsnct.com,pubHomepage=https://repaint.asgs.dev/,pubLibrary=repaint_api_client,pubName=repaint_api_client,pubRepository=https://github.com/after-school-garbage-squad/repaint_api_client.git,serializationLibrary=json_serializable
cd ../repaint_api_client || exit
dart run build_runner build