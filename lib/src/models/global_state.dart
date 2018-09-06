import 'package:meta/meta.dart';

@immutable
class GlobalState {
  static const String STATE_KEY = 'global';
  final int loading;

  GlobalState({this.loading = 0});

  GlobalState copyWith({int loading}) {
    return GlobalState(
      loading: loading ?? this.loading,
    );
  }

  factory GlobalState.fromJson(Map<String, dynamic> json) => GlobalState(
        loading: json['loading'] ?? false,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'loading': loading,
      };

  @override
  String toString() {
    return '{loading: $loading}';
  }
}
