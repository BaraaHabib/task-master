
part of extensions;

extension StringExt on String{

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  Color toHex() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}
