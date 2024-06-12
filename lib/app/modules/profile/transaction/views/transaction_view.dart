import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mindease/constant/constant.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TransactionView'),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: ClipRRect(
                child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Neutral.light2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TabBar(
                      labelColor: Neutral.light1,
                      dividerColor: Neutral.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Primary.mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tabs:  [
                        Tab(
                          child: Text(
                            'Berhasil',
                            style: TextStyle(color: Neutral.light1),
                          )
                        ),
                        Tab(
                          child: Text(
                            'Diproses',
                            style: TextStyle(color: Neutral.light1),
                          )
                        ),
                        Tab(
                          child: Text(
                            'Ditolak',
                            style: TextStyle(color: Neutral.light1),
                          )
                        ),
                      ],
                    )),
              )),
        ),
        body: const Center(
          child: Text(
            'TransactionView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
