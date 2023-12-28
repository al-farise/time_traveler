import 'package:appwrite/appwrite.dart';

Client appwrite() {
  Client client = Client();
  return client
      .setEndpoint('http://10.0.2.2/v1')
      .setProject('658b7ac0f075ad0d61e4')
      .setSelfSigned(status: true);
}
