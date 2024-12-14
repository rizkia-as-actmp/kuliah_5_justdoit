import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justdoit/src/features/authentication/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_service.g.dart';

@riverpod
Future<dynamic> login(
  Ref ref, {
  required String email,
  required String password,
}) async {
  // NOTE: watch(nameProvider).ping() = method ping dari nilai yang ada di provider
  // NOTE: read(nameProvider.notifier).ping() = method ping yang dimiliki notifier
  //final respose = ref.watch(authRepositoryProvider).ping();
  final respose = ref.watch(userRepositoryProvider).loginUser(email, password);

  //print(respose);

  return respose;
}
