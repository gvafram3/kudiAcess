import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudiaccess/models/user_model.dart';
import 'package:kudiaccess/providers/user_provider.dart';

final authProvider = FutureProvider<UserModel?>((ref) async {
  final auth = ref.read(userProvider.notifier);
  return await auth.loadUser();
});
