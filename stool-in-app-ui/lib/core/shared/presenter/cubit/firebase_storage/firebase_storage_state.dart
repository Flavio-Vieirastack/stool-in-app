part of 'firebase_storage_cubit.dart';

abstract class FirebaseStorageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FirebaseStorageInitial extends FirebaseStorageState {}

class FirebaseStorageLoading extends FirebaseStorageState {}

class FirebaseStorageError extends FirebaseStorageState {}

class FirebaseStorageSucess extends FirebaseStorageState {
  final String userUrlImage;
  FirebaseStorageSucess({required this.userUrlImage});

  @override
  List<Object?> get props => [userUrlImage];
}

class FirebaseStorageCompressError extends FirebaseStorageState {
  final String errorMessage;
  FirebaseStorageCompressError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
