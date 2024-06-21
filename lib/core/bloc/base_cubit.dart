
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../network/api_response.dart';
import '../resources/data_state.dart';

abstract class BaseCubit extends Cubit<DataState>{
  BaseCubit() : super(UnInitState());

  executeSuccess<T>(Future<T> Function() invoke, {Function(T)? onSuccess}) async {
    try {
      emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
      if(onSuccess != null){
        onSuccess.call(response);
      }
    } catch (e) {
      print('error $e');
      emit(DataFailed(e));
      rethrow;
    }
  }

  executeDoubleSuccess<T>(Future<T> Function() invoke1, Future<T> Function() invoke2, {Function(T,T)? onSuccess }) async {
    try {
      emit(DataLoading());
      final response1 = await invoke1();
      final response2 = await invoke2();
      if(onSuccess!=null){
        onSuccess(response1, response2);
      } else {
        emit(DoubleDataSuccess(data1: response1, data2: response2));
      }
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }

  executeSuccessNotLoading<T>(Future<T> Function() invoke) async {
    try {
     // emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }
  executeBuilder<T>(Future<T> Function() invoke,
      {bool isRefresh = true, required ValueChanged<T> onSuccess , ValueChanged ? onError}) async {
    try {
      if(isRefresh){
        emit(DataLoading());
      }
      final response = await invoke();
      print('response  sscc $response');
      onSuccess(response);
    } catch (e) {
      if(onError!=null){
        onError(e);
      }else {
        emit(DataFailed(e));
      }
      rethrow;
    }
  }
  executeListener<T>(Future<T> Function() invoke,
      {required ValueChanged<T> onSuccess}) async {
    try {
      emit(LoadingStateListener());
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      print(e);
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  executeEmitterListener(Future<dynamic> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit((SuccessStateListener(v.toString())));
    });
  }

  executeEmitterData(Future<ApiResponse> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit(DataSuccess(v));
    });
  }

  executeEmitterSuccess(Future<dynamic> Function() invoke, {Function(dynamic)? onSuccess}) {
    executeListener(() => invoke(), onSuccess: (v) {
      onSuccess?.call(v);
      emit(SuccessState());
    });
  }
}