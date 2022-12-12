List<String> listParse(String text) {
  return text.replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').split(',').toList();
}
