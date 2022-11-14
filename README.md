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
7. Pada function decrement handle ketika `_counter` > 0 maka bisa decrement, else tidak bisa
8. Kemudian buat widget Text dan tambahkan handler ternary, ketika counter genap maka keluarkan Text Genap, else Text Ganjil

# Assignment 8

## Navigator.push vs Navigator.pushReplacement
Pada `Navigator.pushReplacement` akan me-replace halaman sekarang dengan halaman baru sedangkan pada `Navigator.push` menambahkan rute lain ke atas tumpukan screen (stack) yang sekarang<br>

## Widgets
`Card` -> untuk membuat card<br>
`SizedBox` -> membuat fixed size box<br>
`TextFormField` -> untuk input field<br>
`DropdownButtonFormField` -> untuk membuat dropdown yang bisa divalidasi<br>
`Spacer` -> untuk membuat space pada flexible widget<br>

## Events
`onPressed` -> event yang terjadi ketika user telah selesai menekan<br>
`onTap` -> event yang terjadi ketika sesaat setelah klik<br>
`onChanged` -> event yang terjadi ketika ada perubahan<br>
## Cara Kerja Navigator
Navigator menggunakan paradigma `stack` yaitu last in first out. Stack ini digunakan untuk layar. Misalnya push suatu layar maka yang ditampilkan adalah top of stack dari stack layar tersebut.

## Implementasi
1. Membuat drawer.dart yang berisi widget `Drawer` dengan routing ke counter_7, form, show_budget
2. Membuat form dengan input berupa String untuk judul, int untuk nominal, String untuk jenis, dan DateField untuk date(demo)
3. Judul dan nominal menggunakan `TextFormField`, jenis menggunakan `DropdownButtonFormField`, dan DateField menggunakan `showDatePicker`
4. Setelah itu buat handler yang menerima judul, nominal, jenis, dan date untuk ditambahkan ke static list
5. buat model `Budget` dan static list pada file terpisah
6. Iterasi static list yang menyimpan list budget dan tampilkan di card

