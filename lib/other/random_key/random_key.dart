import 'dart:math';

final class RandomKey {
  const RandomKey._();
  //
  static String generate() {
    const keyLength = 16;
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!%&';
    //
    Random random = Random();
    String key = '';
    //

    for (int i = 0; i < keyLength; i++) {
      int index = random.nextInt(chars.length);
      key += chars[index];
    }

    return key;
  }
}
