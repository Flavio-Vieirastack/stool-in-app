part of 'doubts_cubit.dart';

abstract class DoubtsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DoubtsInitial extends DoubtsState {}

class DoubtsLoading extends DoubtsState {}

class DoubtsErro extends DoubtsState {
  final String errorMessage;
  DoubtsErro({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class DoubtsSucess extends DoubtsState {
  final List<InfoEntity> doubts;
  DoubtsSucess({required this.doubts});
  @override
  List<Object?> get props => [doubts,];
}
