final template = {
  'a': 1,
  'b': 2,
  'c': 3,
  'd': 4,
  'e': 5,
  'f': 6,
  'g': 7,
  'h': 8,
  'i': 9,
  'j': 10,
  'k': 11,
  'l': 12,
  'm': 13,
  'n': 14,
  'o': 15,
  'p': 16,
  'q': 17,
  'r': 18,
  's': 19,
  't': 20,
  'u': 21,
  'v': 22,
  'w': 23,
  'x': 24,
  'y': 25,
  'z': 26,
};

List<int> calculateWeights(String s) {
  List<int> result = [];
  String currentChar = s[0];
  int currentWeight = template[currentChar]!;
  result.add(currentWeight);

  for (int i = 1; i < s.length; i++) {
    final char = s[i];
    if (char == currentChar) {
      currentWeight += template[char]!;
    } else {
      currentChar = char;
      currentWeight = template[char]!;
    }
    result.add(currentWeight);
  }
  return result;
}

List<String> weightedStrings(String s, List<int> queries) {
  List<int> listSub = calculateWeights(s);
  List<String> results = [];
  for (int query in queries) {
    if (listSub.contains(query)) {
      results.add('Yes');
    } else {
      results.add('No');
    }
  }
  return results;
}

void main() {
  print(weightedStrings('abbcccd', [1, 3, 9, 8]));
  print(weightedStrings('abbcccdsdsd', [1, 3, 9, 8, 10, 19]));
}
