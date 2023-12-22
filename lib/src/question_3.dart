void main() {
  print(balanceBracket('{ [ ( ) ] }'));
  print(balanceBracket('{ [ ( ] ) }'));
  print(balanceBracket('{ ( ( [ ] ) [ ] ) [ ] }'));
}

String balanceBracket(String input) {
  final template = {'(': ')', '{': '}', '[': ']'};
  List<String> tempOpenBracket = [];

  for (int i = 0; i < input.length; i++) {
    final currentChar = input[i];
    if (template.keys.contains(currentChar)) {
      tempOpenBracket.add(currentChar);
    } else if (template.values.contains(currentChar)) {
      if (tempOpenBracket.isEmpty || template[tempOpenBracket.last] != currentChar) {
        return 'NO';
      } else {
        tempOpenBracket.removeLast();
      }
    }
  }
  return tempOpenBracket.isEmpty ? 'YES' : 'NO';
}
