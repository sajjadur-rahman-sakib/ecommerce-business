import 'package:ecommerce/data/models/payment_method.dart';
import 'package:ecommerce/presentation/state_holders/payment_gateway_webview.dart';
import 'package:ecommerce/presentation/state_holders/payment_method_list_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<PaymentMethodListController>().getPaymentMethodList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: GetBuilder<PaymentMethodListController>(
        builder: (paymentMethodListController) {
          if (paymentMethodListController.inProgress) {
            return const CenteredCircularProgressIndicator();
          }

          if (paymentMethodListController.errorMessage != null) {
            return Center(
              child: Text(paymentMethodListController.errorMessage!),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildPaySummaryRow(
                    title: 'Total',
                    amount:
                        '${paymentMethodListController.paymentMethodResponseData!.total}',
                  ),
                  _buildPaySummaryRow(
                    title: 'VAT',
                    amount:
                        '${paymentMethodListController.paymentMethodResponseData!.vat}',
                  ),
                  _buildPaySummaryRow(
                    title: 'Payable',
                    amount:
                        '${paymentMethodListController.paymentMethodResponseData!.payable}',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 8,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: paymentMethodListController
                            .paymentMethodResponseData!.paymentMethod?.length ??
                        0,
                    itemBuilder: (context, index) {
                      final PaymentMethod paymentMethod =
                          paymentMethodListController
                              .paymentMethodResponseData!.paymentMethod![index];

                      return ListTile(
                        title: Text(paymentMethod.name!),
                        leading: Image.network(paymentMethod.logo!),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Get.to(
                            () => PaymentGatewayWebView(
                              gatewayUrl: paymentMethod.redirectGatewayURL!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaySummaryRow({required String title, required String amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          '\$$amount',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
