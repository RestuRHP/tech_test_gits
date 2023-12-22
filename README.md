## Question 1 - Done

## Question 2 - ??

## Question 3 - Done

```dart
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
}
```

### 1.
``` dart
final template = {'(': ')', '{': '}', '[': ']'};
```

Template variable yang nanti akan digunakan untuk menentukan open/close bracket keys=open values=close,

### 2.
``` dart
List<String> tempOpenBracket = [];
==================================

if (template.keys.contains(currentChar)) {
    tempOpenBracket.add(currentChar);
}
```
Baris kode tersebut untuk mencari sebuah character openBracket dengan kunci `template.keys`
dan dan jika true maka akan menambahkan currentChar kedalam variable `tempOpenBracket`

### 3.
```dart
else if (template.values.contains(currentChar)) {
  if (tempOpenBracket.isEmpty || template[tempOpenBracket.last] != currentChar) {
    return 'NO';
  } else {
    tempOpenBracket.removeLast();
  }
}
```
`template.values.contains(currentChar)`
kondisi ini untuk mentukan `currentChar` sebuah close bracket atau bukan `template.values` jika `true` proses selanjutnya
akan dijalankan.

```dart
if (tempOpenBracket.isEmpty || template[tempOpenBracket.last] != currentChar) {
  return 'NO';
} else {
  tempOpenBracket.removeLast();
}
```
kondisi untuk menentukan apakah `tempOpenBracket` sudah kosong `tempOpenBracket.isEmpty` karna jika kosong berarti close bracket 
saat ini tidak akan ada pasanggan nya, dan mengcheck close bracket dari template `template[tempOpenBracket.last] != currentChar`
berdasarkan keys yang terakhir ditambahkan kedalam `tempOpenBracket` kenapa harus yang terakhir? karna diindex terakhir seharusnya adalah 
open bracket yang masih belum memiliki pasangan. bisa dilihat dari contoh variable ini,

```dart
print(balanceBracket('{ [ ( ) ] }'));
print(balanceBracket('{ ( ( [ ] ) [ ] ) [ ] }'));
```
contoh variable diatas akan menampilkan output balanceBracket `Yes`, `bisa dilihat karakter sebelum close bracket
yang pertama` yaitu ex1 di `[2]` dan ex2 `[3]` adalah character open bracket yang akan menjadi pasangan dari close bracket itu sendiri dan juga yang terakhir
ditambahkan kedalam variable `tempOpenBracket` dan index terakhir ini akan dihapus jika sudah memiliki pasangannya `tempOpenBracket.removeLast();`.

### 4.
```dart
return tempOpenBracket.isEmpty ? 'YES' : 'NO';
```
jika seluruh value dari `tempOpenBracket` sudah habis/kosong maka artinya open bracket yang ada
sudah memiliki pasangan masing" atau sudah balance