import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mindease/constant/constant.dart';

import '../controllers/transaction_controller.dart';
import 'components/custom_transaction_card.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
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
                      tabs: [
                        const Tab(
                          text: 'Berhasil',
                        ),
                        const Tab(
                          text: 'Diproses',
                        ),
                        const Tab(
                          text: 'Ditolak',
                        ),
                      ],
                    )),
              )),
        ),
        body: TabBarView(children: [
          //succes tab bar view
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const CustomTransactionCard(
                      image: 'assets/images/doctor.png',
                      doctor: 'Dr. Andy Sp.KJ',
                      date: 'Tanggal : April 12, 2024, 08:00 - 08:46',
                      price: 'Rp. 200.000',
                      status: 'Sukses',
                      colorStatus: Success.mainColor,
                    );
                  },
                ),
              ],
            ),
          ),
          //proses tab bar view
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const CustomTransactionCard(
                      image: 'assets/images/doctor.png',
                      doctor: 'Dr. Andy Sp.KJ',
                      date: 'Tanggal : April 12, 2024, 08:00 - 08:46',
                      price: 'Rp. 200.000',
                      status: 'Diproses',
                      colorStatus: Warning.mainColor,
                    );
                  },
                ),
              ],
            ),
          ),
          // ditolak tab bar view
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const CustomTransactionCard(
                      image: 'assets/images/doctor.png',
                      doctor: 'Dr. Andy Sp.KJ',
                      date: 'Tanggal : April 12, 2024, 08:00 - 08:46',
                      price: 'Rp. 200.000',
                      status: 'Ditolak',
                      colorStatus: Error.mainColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
