import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final String _baseUrl = 'http://127.0.0.1:8000/api/';

  Future<Map<String, dynamic>> register({
    required String email,
    required String name,
    required String password,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}register',
      queryParameters: {
        "name": name,
        "email": email,
        "password": password,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}login',
      queryParameters: {
        "email": email,
        "password": password,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> resend({
    required String email,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}resend',
      queryParameters: {
        "email": email,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> verify({
    required String code,
    required String token,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}verification',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
      queryParameters: {
        "code": code,
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getGroups({
    required String token,
  }) async {
    var response = await _dio.get(
      '${_baseUrl}getgroups',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getUsers({
    required String token,
    String? query,
  }) async {
    final endpoint = query != null ? 'getuser?query=$query' : 'getuser';
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> createGroup({
    required String token,
    required String name,
    required List<int> userIds,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}createGroup', // استخدام POST
      data: {
        // تمرير البيانات في الطلب
        'name': name,
        'members': userIds,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // التوكن للمصادقة
          'Content-Type': 'application/json', // تحديد نوع المحتوى
        },
      ),
    );

    return response.data; // إرجاع البيانات الناتجة
  }

  Future<Map<String, dynamic>> getUsersIn({
    required String token,
    required int id,
  }) async {
    var response = await _dio.get(
      '${_baseUrl}getuserin/$id', // استخدام POST
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // التوكن للمصادقة
        },
      ),
    );

    return response.data; // إرجاع البيانات الناتجة
  }

  Future<Map<String, dynamic>> getFiles({
    required String token,
    required int id,
  }) async {
    var response = await _dio.get(
      '${_baseUrl}getfiles/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // التوكن للمصادقة
        },
      ),
    );

    return response.data; // إرجاع البيانات الناتجة
  }

  Future<Map<String, dynamic>> uploadFile(
      {required int groupId, required File file, required String token}) async {
    // إعداد بيانات الـ Multipart
    FormData formData = FormData.fromMap({
      'group_id': groupId,
      'file': await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });

    // إرسال الطلب
    Response response = await _dio.post(
      '${_baseUrl}requestfileaddition',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> inCheckFiles({
    required String token,
    required List<int> idsList,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}incheckfiles', // استخدام POST
      data: {"file_ids": idsList},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // التوكن للمصادقة
          'Content-Type': 'application/json', // تحديد نوع المحتوى
        },
      ),
    );

    return response.data; // إرجاع البيانات الناتجة
  }

  Future<Map<String, dynamic>> checkout({
    required int id,
    required File file,
    required String token,
  }) async {
    try {
      // التحقق من صحة المدخلات
      if (!file.existsSync()) {
        throw Exception("File does not exist.");
      }
      if (token.isEmpty) {
        throw Exception("Token is empty.");
      }

      // إعداد بيانات الـ Multipart
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      // إرسال الطلب
      Response response = await _dio.post(
        '${_baseUrl}outcheckfile/$id',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // التحقق من نجاح الطلب
      if (response.statusCode == 200) {
        return response.data; // نجاح العملية
      } else {
        throw Exception(
            "Failed to upload file. Status code: ${response.statusCode}");
      }
    } catch (e) {
      // معالجة الأخطاء
      print("Error during file checkout: $e");
      return {
        'success': false,
        'message': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> checkoutWithoutFile({
    required int id,
    required String token,
  }) async {
    // إرسال الطلب
    Response response = await _dio.post(
      '${_baseUrl}outcheckfilewhitoutchange/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data; // نجاح العملية
  }

  Future<Map<String, dynamic>> getChanged({
    required int id,
    required String token,
    required File file,
  }) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });

    // إرسال الطلب
    Response response = await _dio.get(
      '${_baseUrl}change_files/$id',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data; // نجاح العملية
  }

  Future<List<dynamic>> backupFiles({
    required int id,
    required String token,
  }) async {
    // إرسال الطلب إلى API
    Response response = await _dio.get(
      '${_baseUrl}backsup_files/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    // التحقق من البيانات المرجعة
    if (response.data is List) {
      return response.data; // إذا كانت البيانات قائمة، قم بإرجاعها.
    } else {
      throw Exception('Unexpected response format: ${response.data}');
    }
  }

  Future<Map<String, dynamic>> getMembers({
    required String token,
    required int id,
  }) async {
    try {
      // استدعاء الطلب باستخدام _dio
      var response = await _dio.get(
        '${_baseUrl}getmembers/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      // إذا كان الطلب ناجحًا، إرجاع البيانات
      return response.data;
    } on DioException catch (e) {
      // التقاط أخطاء Dio
      if (e.response != null) {
        // إذا كانت الاستجابة موجودة
        print('خطأ في الاستجابة: ${e.response?.data}');
        print('كود الحالة: ${e.response?.statusCode}');
        return {
          'error': true,
          'message': e.response?.data['message'] ?? 'خطأ غير متوقع',
        };
      } else {
        // إذا لم يكن هناك استجابة (مثلاً انقطاع الشبكة)
        print('خطأ في الاتصال: ${e.message}');
        return {
          'error': true,
          'message': 'فشل في الاتصال بالسيرفر. تحقق من اتصالك بالإنترنت.',
        };
      }
    } catch (e) {
      // التقاط الأخطاء العامة
      print('خطأ غير متوقع: $e');
      return {
        'error': true,
        'message': 'حدث خطأ غير متوقع.',
      };
    }
  }

  Future<Map<String, dynamic>> getRequestsFiles({
    required String token,
    required int id,
  }) async {
    try {
      // استدعاء الطلب باستخدام _dio
      var response = await _dio.get(
        '${_baseUrl}getrequsetfiles/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      // إذا كان الطلب ناجحًا، إرجاع البيانات
      return response.data;
    } on DioException catch (e) {
      // التقاط أخطاء Dio
      if (e.response != null) {
        // إذا كانت الاستجابة موجودة
        print('خطأ في الاستجابة: ${e.response?.data}');
        print('كود الحالة: ${e.response?.statusCode}');
        return {
          'error': true,
          'message': e.response?.data['message'] ?? 'خطأ غير متوقع',
        };
      } else {
        // إذا لم يكن هناك استجابة (مثلاً انقطاع الشبكة)
        print('خطأ في الاتصال: ${e.message}');
        return {
          'error': true,
          'message': 'فشل في الاتصال بالسيرفر. تحقق من اتصالك بالإنترنت.',
        };
      }
    } catch (e) {
      // التقاط الأخطاء العامة
      print('خطأ غير متوقع: $e');
      return {
        'error': true,
        'message': 'حدث خطأ غير متوقع.',
      };
    }
  }

  Future<Map<String, dynamic>> approve({
    required String token,
    required int id,
  }) async {
    try {
      // استدعاء الطلب باستخدام _dio
      var response = await _dio.post(
        '${_baseUrl}approvefilerequest/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      // إذا كان الطلب ناجحًا، إرجاع البيانات
      return response.data;
    } on DioException catch (e) {
      // التقاط أخطاء Dio
      if (e.response != null) {
        // إذا كانت الاستجابة موجودة
        print('خطأ في الاستجابة: ${e.response?.data}');
        print('كود الحالة: ${e.response?.statusCode}');
        return {
          'error': true,
          'message': e.response?.data['message'] ?? 'خطأ غير متوقع',
        };
      } else {
        // إذا لم يكن هناك استجابة (مثلاً انقطاع الشبكة)
        print('خطأ في الاتصال: ${e.message}');
        return {
          'error': true,
          'message': 'فشل في الاتصال بالسيرفر. تحقق من اتصالك بالإنترنت.',
        };
      }
    } catch (e) {
      // التقاط الأخطاء العامة
      print('خطأ غير متوقع: $e');
      return {
        'error': true,
        'message': 'حدث خطأ غير متوقع.',
      };
    }
  }

  Future<Map<String, dynamic>> invite({
    required String token,
    required int groupId,
    required List<int> membersIds,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}invitemembergroup', // استخدام POST
      data: {
        // تمرير البيانات في الطلب
        'groupId': groupId,
        'members': membersIds,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // التوكن للمصادقة
          'Content-Type': 'application/json', // تحديد نوع المحتوى
        },
      ),
    );
    print(response.data);
    return response.data; // إرجاع البيانات الناتجة
  }
}
