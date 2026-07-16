import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';

class PaymentScreen{
  const PaymentScreen();

  // ignore: constant_identifier_names
  static const String CLIENT_ID = "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
  // ignore: constant_identifier_names
  static const String SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";

  void payWithEsewa() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test, // LIVE later
          clientId: CLIENT_ID,
          secretId: SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: "P001",
          productName: "Test Product",
          productPrice: "300", callbackUrl: '',
        ),
        onPaymentSuccess: (result) {
          print("SUCCESS: $result");
          verifyTransaction(result);
        },
        onPaymentFailure: (data) {
          print("FAILED: $data");
        },
        onPaymentCancellation: (data) {
          print("CANCELLED: $data");
        },
      );
    } catch (e) {
      print("ERROR: $e");
    }
  }

  void verifyTransaction(EsewaPaymentSuccessResult result) async {
    print("Verify transaction here: ${result.refId}");

    // You will call API here (optional but recommended)
  }

}