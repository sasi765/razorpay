import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
 
class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
 
class _PaymentScreenState extends State<PaymentScreen> {
  var _razorpay = Razorpay();
 
  var options;
 
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
 
    options = {
      'key': 'rzp_test_DiAnYfDtT7oIDa',
      'amount': 100 * 100,
      'name': 'Sai Gopi YT',
      'description': 'Course Free',
      'prefill': {'contact': '7981686394', 'email': 'test@razorpay.com'}
    };
 
    super.initState();
  }
 
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
 
    print("_handlePaymentSuccess payment is success " + response.paymentId);
  }
 
  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("_handlePaymentError payment is failed " + response.message);
  }
 
  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Gateway"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              _razorpay.open(options);
            },
            child: Text("Start payment")),
      ),
    );
  }
}