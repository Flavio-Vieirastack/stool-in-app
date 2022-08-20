part of 'doubts_cubit.dart';

abstract class DoubtsState extends Equatable {}

class DoubtsStates extends DoubtsState {
  final bool isLoading;
  final bool hasError;
  final bool isSucess;
  final List<InfoEntity> doubts;
  final String? errorMessage;
  DoubtsStates({
    this.isLoading = true,
    this.hasError = false,
    this.isSucess = false,
    this.doubts = const [],
    this.errorMessage,
  });

  DoubtsStates copyWith({
    bool isLoading = false,
    bool hasError = false,
    bool isSucess = false,
    List<InfoEntity> doubts = const [],
    String? errorMessage
  }) {
    return DoubtsStates(
      doubts: doubts,
      hasError: hasError,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, isSucess, doubts];
}
