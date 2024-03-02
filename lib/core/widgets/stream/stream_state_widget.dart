import 'package:flutter/cupertino.dart';

import '../../commen/common_state.dart';
import '../../components/base_stateless_widget.dart';
import '../../components/loading_widget.dart';

///  Created by harbey on 9/19/2023.
class StreamStateWidget<T> extends BaseStatelessWidget {
  final Widget Function(BuildContext context, T data) builder;
  final StreamState<T> stream;
  final T? initialData;
  final Function()? onReload;
  final bool isBottomSheetData;
  final String? emptyMessage;

  StreamStateWidget({
    super.key,
    required this.builder,
    required this.stream,
    this.initialData,
    this.onReload,
    this.emptyMessage,
    this.isBottomSheetData = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isFirstTime = true;
    return StreamBuilder<T>(
        stream: stream.stream,
        initialData: initialData,
        builder: (context, snapshot) {
          // if(snapshot.connectionState == ConnectionState.waiting){
          //   return const LoadingView();
          // }
          if (snapshot.data != null) {
            if ((snapshot.data is List && snapshot.data.toString() == '[]')) {
              return emptyMessage != null ? Text(emptyMessage ?? '' , ) :
              const SizedBox.shrink();
            } else {
              return builder(context, snapshot.data as T);
            }
          } else if ((snapshot.data is List && snapshot.data == []) ||
              snapshot.error != null ||
              snapshot.data == null ||
              snapshot.data == []) {
            print('snapshot.SizedBox: ${snapshot.data}');
            return const SizedBox.shrink();
          }
          // This condition is added to handle the case when the stream is pagination data
          // else if ((snapshot.data != null && (snapshot.data == ''))) {
          //   return ErrorPlaceHolderWidget(
          //     exception: EmptyListException(),
          //     onClickReload: onReload,
          //   );
          // } else if (snapshot.data != null && (snapshot.data is List && snapshot.data != [])) {
          //   return builder(context, snapshot.data as T);
          // } else if (snapshot.error != null) {
          //   return ErrorPlaceHolderWidget(
          //     exception: snapshot.error ?? EmptyListException(),
          //     onClickReload: onReload,
          //   );
          // }
          return const LoadingView();
        });
  }
}
