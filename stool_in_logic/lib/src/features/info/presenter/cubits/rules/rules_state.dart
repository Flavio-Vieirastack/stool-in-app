part of 'rules_cubit.dart';

abstract class RulesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RulesInitial extends RulesState {}

class RulesLoading extends RulesState {}

class RulesError extends RulesState {
  final String errorMessage;
  RulesError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class RulesSucess extends RulesState {
  final List<InfoEntity> rules;
  RulesSucess({required this.rules});
  @override
  List<Object?> get props => [rules];
}
