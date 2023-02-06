import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/lib/base/providers/strings/provider.g.dart';

@riverpod
StringsProvider strings(StringsRef ref) => StringsProvider();

class StringsProvider {
  String capitalizeFirstLetters(String name) {
    return name.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    if (limitTo > split.length) {
      limitTo = split.length;
    }
    for (var i = 0; i < limitTo; i++) {
      if (split[i].isNotEmpty) {
        buffer.write(split[i][0]);
      }
    }

    return buffer.toString();
  }
}
