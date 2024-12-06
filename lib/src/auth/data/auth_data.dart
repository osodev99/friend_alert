import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_equis/src/shared/shared.dart';

abstract class AuthData {
  static Future<UserModel> signUp({required UserModel user}) async {
    try {
      final supabase = Supabase.instance.client;
      final resp = await supabase
          .from('app_users')
          .insert(user.toJsonSupabase())
          .select();
      return UserModel.fromJson(resp.first);
    } on PostgrestException catch (pgError) {
      throw pgError.message;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<UserModel> signIn({
    required String email,
    required String phone,
  }) async {
    try {
      final supabase = Supabase.instance.client;
      final resp = await supabase
          .from('app_users')
          .select()
          .eq('email', email)
          .eq('phone', phone);
      return UserModel.fromJson(resp.first);
    } on PostgrestException catch (pgError) {
      throw pgError.message;
    } catch (e) {
      throw e.toString();
    }
  }
}
