import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../../data/api/api.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String token = GetStorage().read('token') ?? '';
  final String baseUrl = BaseUrl;

  TransactionService() {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: false,
    ));
  }

  Future<List<Transaction>?> getPendingTransactions() async {
    return await getTransactionsByStatus('pending');
  }

  Future<List<Transaction>?> getSuccessTransactions() async {
    return await getTransactionsByStatus('success');
  }

  Future<List<Transaction>?> getRejectedTransactions() async {
    return await getTransactionsByStatus('deny');
  }

  Future<List<Transaction>?> getTransactionsByStatus(String status) async {
    try {
      final response = await _dio.get(
        '$baseUrl/transactions',
        queryParameters: {
          'status': status,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data != null && response.data is List) {
          List<dynamic> jsonList = response.data;
          return jsonList.map((json) => Transaction.fromJson(json)).toList();
        } else {
          logger.e('Invalid response data format');
          return null;
        }
      } else {
        logger.e('Failed to load transactions: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      logger.e('Error getting transactions: $e');
      return null;
    }
  }
}
