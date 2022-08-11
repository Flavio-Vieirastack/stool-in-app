part of 'firebase_storage_cubit.dart';

abstract class FirebaseStorageState {}

class FirebaseStorageInitial extends FirebaseStorageState {}
class FirebaseStorageLoading extends FirebaseStorageState {}
class FirebaseStorageError extends FirebaseStorageState {}
class FirebaseStorageSucess extends FirebaseStorageState {}
