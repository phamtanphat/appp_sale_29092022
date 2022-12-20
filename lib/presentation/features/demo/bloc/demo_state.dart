part of 'demo_bloc.dart';

enum DemoStatus { initial, loading, loaded }

class DemoState {
  final DemoStatus status;
  final int so; // <--------
  final bool isBlue;
  final String text;

  const DemoState({
    this.status = DemoStatus.initial,
    this.so = 0, // <--------
    this.isBlue = true,
    this.text = "AAA",
  });

  DemoState copyWith({
    DemoStatus? status,
    int? so, // <--------
    bool? isBlue,
    String? text,
  }) {
    return DemoState(
      status: status ?? this.status,
      so: so ?? this.so, // <--------
      isBlue: isBlue ?? this.isBlue,
      text: text ?? this.text,
    );
  }
}
