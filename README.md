# counter_7

## Stateless Widget vs Stateful Widget

Stateless widget adalah sebuah widget yang tidak pernah berubah. Sedangkan ketika sebuah widget bisa berubah ketika _user_ berinteraksi dengan widget tersebut itu adalah stateful widget. Contoh dari stateless widget adalah Icon, IconButton, dll. sedangkan untuk stateful widget ada Checkbox, Radio, Slider, InkWell, Form, dll.

## Widget yang digunakan

`FloatingActionButton` yang di bind dengan function untuk increment dan decrement untuk menambah dan mengurangi counter
`Text` untuk menampilkan text
`Row` untuk membuat childnya sejajar. behaviour nya seperti flex dengan direction row
`Visibility` untuk hide child. 
`Padding` untuk membuat space kosong. dalam tugas ini diberikan space kosong dikiri 30 px

## SetState dan Variabel yang terdampak

SetState berfungsi untuk memberi tahu bahwa ada internal state yang berubah kemudian mengakibatkan adanya re-build sehingga ketika state yang berubah adalah state yang ditampilkan maka state tersebut akan berubah juga pada tampilannya.

Dalam tugas ini, contohnya adalah variable `_counter` yang valuenya bisa berubah ketika function increment dan decrement dipanggil

## Const vs Final

`const` digunakan untuk deklarasi variable _immutable_ dan harus sudah diketahui valuenya saat compile time
`final` digunakan untuk deklarasi variable _immutable_ dan valuenya boleh sudah atau belum diketahui saat compile time

## Implementasi

1. run command `flutter create counter_7`
2. Kemudian ke lib/main.dart 
3. Menambahkan widget row pada floatingActionButton
4. Tambah floatingActionButton widget di row, sehingga ada 2 floatingActionButton
5. Buat function yang bisa melakukan decrement pada counter
6. Bind decrement functionnya pada onPressed props di button decrement dan bind function increment pada onPressed props di button increment
7. Pada function decrement handle ketika `_counter` < 0 maka tidak bisa decrement, else bisa
8. Kemudian buat widget Text dan tambahkan handler ternary, ketika counter genap maka keluarkan Text Genap, else Text Ganjil

