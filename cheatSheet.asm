yak bismillahirrahmanirrahim

Assalamualaikum warahmatullahi wabarakatuh

sudo apt install nasm
sudo apt install yasm
sudo apt install geany
sudo apt-get install gcc-multilib

buka Geany -> Build -> Set Build Commands -> ganti isi Compile yg nasm “%f” ->
yasm %f -f elf32 -g dwarf2 -l %e.lst && gcc -o %e -m32 %e.o

Hallo

Selamat Belajar :) :v 

Template pake scanf printf fflush(extern extern) :
;panggil bantuan bahasa C (scanf, printf, fflush)
extern printf
extern fflush
extern scanf
 
section .data
    ;fmtScan itu variabel   ;"%d %d" karena mau input 2, kalo mau 1->"%d"
fmtScan db "%d %d", 0  
    
;fmtPrint itu variabel(bebas)   ;outputnya 1->"%d"    ;10 itu newline 
fmtPrint db "%d", 10, 0  
    
;matrik itu variabel ;input matriks -> 7,11,10,6,5,8,9,2,1,3,12,4
matrik  dd 7, 11, 10, 6     
dd 5, 8, 9, 2
           dd 1, 3, 12, 4
     
section .bss
 ilkomerz resd 1    ;declare ilkomerz(variabel)
 dahsyat resd 1    ;declare dahsyat(variabel)
 
section .text
    global main
         
main:        ;fungsi main
;input
 ;scanf("%d %d", &ilkomerz, &dahsyat)
 push dahsyat         ;variabel
 push ilkomerz     ;variabel
 push fmtScan     ;"%d %d"
 call scanf          ;panggil scanf
 add esp, 12          ;4 dikali dengan banyaknya push(ada 3) ;reason dikali 4? karena untuk bytes
 
 ;output
 ;printf("%d", eax)
 push eax  ;print eax
 push fmtPrint ;"%d"
 call printf  ;panggil printf
 add esp, 8  ;4 dikali dengan banyaknya push(ada 2) ;reason dikali 4?karena untuk bytes


exit:        ;fungsi exit
    buat ngebersihin
 push 0    
     call fflush     
    
    ;return 0
 mov eax, 1
 mov ebx, 0
 int 0x80


Tabel keisengan



disarankan
diharuskan 
dilarang 
eax (Tokoh Utama)
hasil aritmatika
hasil perkalian dan pembagian
-
ebx






ecx


counter pas looping
pas looping, jangan disuruh buat yg lain
edx


hasil sisa pembagian
pas pembagian, jangan di suruh buat yg lain
esl, edi




pas string
sesi uas muehehe
                            Sumber : Bang Ivan 50


Pindahan
mov eax, 10          ;eax = 10
mov ebx, 2          ;ebx = 2
mov eax, ebx          ;eax = ebx
mov eax, [ilkomerz]     ;eax = nilai variabel ilkomerz
Pertambahan
add eax, ebx         ;eax=eax+ebx
add ebx, eax         ;ebx=ebx+eax
add eax, 10         ;eax=eax+10
add 
Pengurangan
sub eax, ebx         ;eax=eax-ebx
sub ebx, eax         ;ebx=ebx-eax
sub eax, 10         ;eax=eax-10

Perkalian
mul ebx          ;eax=eax*ebx
mul ecx          ;eax=eax*ecx
Pembagian
mov edx, 0     ;saat pembagian jangan lupakan ini    ;karena edx buat sisa pembagian
div ebx      ;eax = eax/ebx        ;edx = eax%ebx
div ecx        ;eax = eax/ecx        ;edx = eax%ecx

Lompat Lompat
jmp     asal lompat ke fungsi
jae     jump above equal     >=
ja     jump above          >
jb     jump bellow          <
jbe     jump bellow equal     <=
je    jump equal        ==
jne    /buat ngirim paket/    jump not equal    !=
#receh



Penggunaan:
cmp eax, ebx         ;ngebandingin eax dengan ebx
jae fungsi1         ;eax >= ebx  kalo true lompat ke fungsi1

cmp ecx, 10         ;ngebandingin ecx dengan 10
jb fungsi2         ; ecx < 10  kalo true lompat ke fungsi2

cmp ebx, eax        ;ngebandingin ebx dengan eax
jbe fungsi3        ; ebx <= eax kalo true lompat ke fungsi3

jmp exit        ;langsung lompat ke fungsi exit
Looping
loop         looping  
loopnz         looping not zero

loop fungsi1         ;ngelooping sampe ecxnya 0 di fungsi1
loopnz fungsi2         ;selama ecx tidak 0, looping di fungsi2

misal1:
;10+9+8+7+6+5+4+3+2+1+0
main:
mov ecx, 10
mov eax, 0

fungsi1:
    add eax, ecx
    loop fungsi1

    push eax
    push fmtPrint
    call printf
    add esp, 8
exit:
 push 0    
     call fflush     

 mov eax, 1
 mov ebx, 0
 int 0x80

misal2:
;10+9+8+7+6+5+4+3+2+1
main:
mov ecx, 10
mov eax, 0

fungsi1:
    add eax, ecx
    loopnz fungsi1

    push eax
    push fmtPrint
    call printf
    add esp, 8
exit:
push 0    
     call fflush     

 mov eax, 1
 mov ebx, 0
 int 0x80

Matriks // GAMASUK UTSP KYKNYA
sebelum matriks, array dulu, gatau array masuk utsp atau gak

array[0]    ->    dword[0]    -> dword[dahsyat]
array[1]    ->    dword[4]    -> dword[dahsyat+4]
array[2]    ->     dword[8]    -> dword[dahsyat+8]
dst

matriks di assembly, tidak seperti matriks di C
jadi matriks di Assembly itu tetep seperti array 1 Dimensi biasa

misal 3x4
5, 2, 4, 9
4, 2, 3, 1
6, 4, 11, 10


kalo di C            kalo di asm
[0][0],[0][1],[0][2],[0][3]        0,4,8,12
[1][0],[1][1],[1][2],[1][3]        16,20,24,28
[2][0],[2][1],[2][2],[2][3]        32,36,40,44

matrik[0][0]              [matrik]        5
matrik[0][1]              [matrik+4]        2
matrik[0][2]              [matrik+8]        4    
matrik[0][3]              [matrik+12]        9
matrik[2][2]              [matrik+40]        11

buat yang array kenapa kali 4
http://prnt.sc/er4z29 
https://www.youtube.com/watch?v=ls4QpZD2Cow 

rumus matriks

M(baris)xN(kolom)
matriks[X][Y]

4N X + 4 Y

misal
3x4

16X + 4Y    
























NO.7 HURUF MUTU

extern printf
extern fflush
extern scanf
 
section .data
    scan db "%d %d %d %d",0
    prin db "%d", 10, 0
    prina db "A", 10,0
    prinb db "B",10,0
    princ db "C", 10, 0
    prind db "D", 10,0
    prine db "E", 10,0
     
section .bss
    a resd 1
    b resd 1
    c resd 1
    d resd 1
 
section .text
    global main
         
main:
    push d
    push c
    push b
    push a
    push scan
    call scanf
    add esp, 20         
    
    mov eax, [a]
    add eax, [b]
    add eax, [c]
    add eax, [d]
    
    mov edx, 0
    mov ecx, 4
    div ecx        ;udah dapet hasilnya
    
    cmp eax, 80
    jae labela
    
    cmp eax, 60
    jae labelb
    
    cmp eax, 50
    jae labelc
    
    cmp eax, 40
    jae labeld
    
labele:
    push prine
    call printf
    add esp, 4
    jmp exit
    
labeld:
    push prind
    call printf
    add esp, 4
    jmp exit
    
labelc:
    push princ
    call printf
    add esp, 4
    jmp exit
    
labelb:
    push prinb
    call printf
    add esp, 4
    jmp exit

labela:
    push prina
    call printf
    add esp, 4
    jmp exit
    
exit:
    push 0
    call fflush
    
    mov eax, 1
    mov ebx, 0
    int 0x80

SOURCE YG 4 SOAL dari Pak AURIZA

Balok
extern printf
extern fflush
extern scanf
 
section .data
    fmtScan db "%d %d %d", 0x`
    fmtPrint db "%d", 10, 0x
     
section .bss
 bil1 resd 1
 bil2 resd 1
 bil3 resd 1
 
section .text
    global main
         
main:
 push bil3
 push bil2
 push bil1
 push fmtScan
 call scanf
 add esp, 16
 
 mov eax, [bil1]
 mov ebx, [bil2]
 mul ebx
 mov ebx, [bil3]
 mul ebx
 
 push eax
 push fmtPrint
 call printf
 add esp, 8
 
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80

## catatan: kalo coba perkalian pake register edx, hasilnya 0, kenapa ???
Yaudah jangan pake edx.



2. Faktorial

extern printf
extern fflush
extern scanf
 
section .data
    fmtScan db "%d", 0
    fmtPrint db "%d", 10, 0
     
section .bss
 bil1 resd 1
 
section .text
    global main
         
main:
 ;input
 push bil1
 push fmtScan
 call scanf
 add esp, 8
 
 mov ecx, [bil1]  
 mov eax, 1  ;buat hasil
 
looping:
 mul ecx   ;eax=eax*ecx
 loopnz looping ;looping selama bukan nol
 
 push eax
 push fmtPrint
 call printf
 add esp, 8
 
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80



3. Tekanan Ban

extern printf
extern fflush
extern scanf
 
section .data
    fmtScan db "%d", 0
    fmtkempes db "kempes", 10, 0
    fmtpas db "pas", 10, 0
    fmtkeras db "keras", 10, 0
     
section .bss
 bil1 resd 1
 
section .text
    global main
         
main:
 ;input
 push bil1
 push fmtScan
 call scanf
 add esp, 8
 
 mov eax, [bil1]
 
 cmp eax, 35
 ja keras
 
 cmp eax, 29
 jae pas
 
kempes:
 push fmtkempes
 call printf
 add esp, 4
 jmp exit
 
pas:
 push fmtpas
 call printf
 add esp, 4
 jmp exit
 
keras:
 push fmtkeras
 call printf
 add esp, 4
 jmp exit
 
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80

## KALO KALIAN PUNYA CARA MIKIR IF NYA SENDIRI, SILAHKAN TAPI JANGAN SAMPE BINGUNG SENDIRI
## biasain untuk ngebuat kondisi yang ga membingungkan, dan prinsip asm bekerja sekuensial, mengecek satu satu kebawah. MANFAATKAN JUMP jika ingin melewati barisan kode.
Trivia : bisa jump ke atas juga

4. Diagonal Matriks // gamasuk utsp

extern printf
extern fflush
extern scanf
 
section .data
    fmtScan db "%d", 0
    fmtPrint db "%d",10,0
    mat      dd 17, 14, 24, 11, 18
          dd 21, 6, 14, 19, 25
           dd 10, 2, 20, 12, 7
           dd 3, 15, 23, 5, 1
           dd 8, 4, 9, 16, 2
     
section .bss
 a resd 1
 
section .text
    global main
         
main:
 ;input
 push a
 push fmtScan
 call scanf
 add esp, 8
 
 mov eax,[a]
 mov ebx, 24
 mul ebx
 mov ebx, [mat+eax]
 
 push ebx
 push fmtPrint
 call printf
 add esp, 8
 
 
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80

GOOD LUCK UTSP NYA GAN, JANGAN PASRAH YA ASM TIDAK SESULIT DASPROK KOK
CONTOH SOAL 

Hitung panjang sisi dari persegi dengan diberikan input luas sisinya
Input    :400
Output    :20
Input     :25
Output    :5


Buatlah deret fibonacci (1,1,2,3,5,8,...) dipisah dengan new line
    Contoh inputan    :16
    Output            : 1
  1
  2
  3
  5
  8
  12    
Penjelasan : pencetakan angka akan berhenti ketika deret selanjutnya lebih besar dari    pada inputan.

3.    Kelipatan 9, hitung jumlah dari 0 sampai n. Penjumlahan akan berhenti jika kelipatan 9 lebih besar daripada input-an
    Input:
        20
    Output:
        27 (Maksudnya: 0+9+18)

4. Buatlah program untuk mengecek keprimaan bilangan.
Contoh inputan     : 7
    Contoh Output         : PRIMA
    Contoh Input         : 4
    Contoh Output         : BUKAN PRIMA 

5. Membuat tingkat IQ berdasarkan data yang diberikan.
    IQ 201-250    Davinci
    IQ 151-200    Habibi
    IQ 101-150    Normies
    IQ 51-100    Wibu
    IQ 0-50    Itu IQ atau nomor sepatu
    SEMUA kalimat harus tercetak.
    Input        :49
    Output        :Itu IQ atau nomor sepatu

6. Buatlah program untuk menghitung faktorial dari suatu bilangan
    Input    :     5
    Output    :     120

7. Buatlah program untuk mengecek bilangan Ganjil atau Genap.
Contoh inputan     : 7
    Contoh Output         : Ganjil
    Contoh Input         : 4
    Contoh Output         : Genap

Eklips ORKOM NYA AUTO A minnnn
