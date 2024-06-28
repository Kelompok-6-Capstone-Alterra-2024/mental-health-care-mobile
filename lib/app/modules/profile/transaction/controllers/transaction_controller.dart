import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/transaction_model.dart';
import '../../data/services/transaction_service.dart';

class TransactionController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  bool isInitialized = false;

  var isLoading = true.obs;
  var pendingTransactions = <Transaction>[].obs;
  var successTransactions = <Transaction>[].obs;
  var rejectedTransactions = <Transaction>[].obs;

  // Observables to track if transactions list is empty
  var isPendingEmpty = false.obs;
  var isSuccessEmpty = false.obs;
  var isRejectedEmpty = false.obs;

  final TransactionService _transactionService = TransactionService();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabChange);
    isInitialized = true; // Setelah inisialisasi selesai
    fetchTransactions();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void _handleTabChange() {
    if (!tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          fetchPendingTransactions();
          break;
        case 1:
          fetchSuccessTransactions();
          break;
        case 2:
          fetchRejectedTransactions();
          break;
      }
    }
  }

  void fetchTransactions() {
    fetchPendingTransactions();
    fetchSuccessTransactions();
    fetchRejectedTransactions();
  }

  void fetchPendingTransactions() async {
    try {
      isLoading(true);
      var fetchedTransactions =
          await _transactionService.getPendingTransactions();
      if (fetchedTransactions != null) {
        pendingTransactions.assignAll(fetchedTransactions);
        isPendingEmpty.value = fetchedTransactions.isEmpty;
      } else {
        // Get.snackbar('Error', 'Failed to load pending transactions');
        isPendingEmpty.value = true;
      }
    } catch (e) {
      // Get.snackbar('Error', 'Failed to load pending transactions: $e');
      isPendingEmpty.value = true;
    } finally {
      isLoading(false);
    }
  }

  void fetchSuccessTransactions() async {
    try {
      isLoading(true);
      var fetchedTransactions =
          await _transactionService.getSuccessTransactions();
      if (fetchedTransactions != null) {
        successTransactions.assignAll(fetchedTransactions);
        isSuccessEmpty.value = fetchedTransactions.isEmpty;
      } else {
        // Get.snackbar('Error', 'Failed to load success transactions');
        isSuccessEmpty.value = true;
      }
    } catch (e) {
      // Get.snackbar('Error', 'Failed to load success transactions: $e');
      isSuccessEmpty.value = true;
    } finally {
      isLoading(false);
    }
  }

  void fetchRejectedTransactions() async {
    try {
      isLoading(true);
      var fetchedTransactions =
          await _transactionService.getRejectedTransactions();
      if (fetchedTransactions != null) {
        rejectedTransactions.assignAll(fetchedTransactions);
        isRejectedEmpty.value = fetchedTransactions.isEmpty;
      } else {
        // Get.snackbar('Error', 'Failed to load rejected transactions');
        isRejectedEmpty.value = true;
      }
    } catch (e) {
      // Get.snackbar('Error', 'Failed to load rejected transactions: $e');
      isRejectedEmpty.value = true;
    } finally {
      isLoading(false);
    }
  }
}
