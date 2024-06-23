import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mindease/constant/constant.dart';

import '../../data/models/transaction_model.dart';
import '../controllers/transaction_controller.dart';
import 'components/custom_transaction_card.dart';

class TransactionView extends GetView<TransactionController> {
  TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaksi',
            style: medium.copyWith(fontSize: 16, color: Primary.darker),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Chevron.svg',
              width: 26,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: ClipRRect(
                child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 36,
                    decoration: BoxDecoration(
                      color: Neutral.light2,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TabBar(
                      labelColor: Neutral.light1,
                      dividerColor: Neutral.transparent,
                      unselectedLabelColor: Neutral.dark3,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Primary.mainColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      controller: controller.isInitialized
                          ? controller.tabController
                          : null,
                      tabs: [
                        Tab(text: 'Pending'),
                        Tab(text: 'Success'),
                        Tab(text: 'Rejected'),
                      ],
                    )),
              )),
        ),
        body: Obx(() {
          if (!controller.isInitialized) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return TabBarView(
              controller: controller.tabController,
              children: [
                _buildTransactionsList(
                    controller.pendingTransactions, controller.isPendingEmpty),
                _buildTransactionsList(
                    controller.successTransactions, controller.isSuccessEmpty),
                _buildTransactionsList(controller.rejectedTransactions,
                    controller.isRejectedEmpty),
              ],
            );
          }
        }),
      ),
    );
  }
}

Widget _buildTransactionsList(List<Transaction> transactions, RxBool isEmpty) {
  if (isEmpty.value) {
    return Center(child: Text('Transaksi kosong'));
  } else if (transactions.isEmpty) {
    return Center(child: Text('No transactions found'));
  } else {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: ScrollController(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactions.length, // Updated to use length
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final doctorName = transaction.consultation.doctor.name;
                final startDate = transaction.consultation.startDate;
                final endDate = transaction.consultation.endDate;
                final formattedDate =
                    'Tanggal: ${startDate.toLocal()} - ${endDate.toLocal()}';
                return CustomTransactionCard(
                  image: 'assets/images/doctor.png',
                  doctor: doctorName,
                  date: 'Tanggal : $formattedDate',
                  price: 'Rp. ${transaction.price}',
                  status: transaction.status,
                  colorStatus: Success.mainColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
