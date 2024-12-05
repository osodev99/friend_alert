import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_equis/src/shared/shared.dart';

abstract class AuthData {
  static Future<void> signUp({required UserModel user}) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('users').insert(user.toJson());
    } on PostgrestException catch (pgError) {
      throw pgError.message;
    } catch (e) {
      throw e.toString();
    }
  }
}
