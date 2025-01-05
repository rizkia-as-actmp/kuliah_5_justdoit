# Domain Model :clipboard:

## **Apa Itu Domain Model?** :mag:

Domain model adalah representasi dari sebuah objek dari dunia nyata. Domain sendiri mengacu pada sebuah area concern atau cakupan dari sebuah permasalahan yang ingin diselesaikan dalam sebuah sistem.

<br>

## **Business Logic: Model, Service, atau Controller?** :gear:

Ada banyak pandangan mengenai di mana sebaiknya business logic ditempatkan. Berikut adalah beberapa pandangan yang sering digunakan:

### **Pandangan MVC** :books:
1. **Model hanya sebagai representasi data:**  
   Dalam pendekatan ini, model hanya bertugas untuk merepresentasikan data. Semua business logic ditangani oleh controller, yang juga bertugas untuk mempopulasi model.
   
2. **Fat Model, Skinny Controller:**  
   Pendekatan ini menempatkan sebagian besar business logic pada model. Selain menjadi representasi data, model juga bertanggung jawab untuk menghasilkan dirinya sendiri. Controller hanya bertugas sebagai perantara tanpa menangani business logic.

### **Pandangan Clean Architecture** :triangular_ruler:
Dalam clean architecture, business logic ditempatkan pada **service**. Model hanya bertugas untuk merepresentasikan data tanpa memuat business logic.

<br>

## **Apa yang Saya Gunakan?** :thinking:

Saya menggunakan pendekatan di mana:

- **Model hanya merepresentasikan data.**  
- **Business logic dikelola oleh service.**  
- **Controller berperan sebagai pengontrol UI dan media perantara antara UI dengan service.**

<br>

## **Created And Updated** :building_construction:

Pada level kode, model diproduksi oleh repository melalui proses konversi unstructured data (seperti JSON) dari sumber luar. Model dapat diubah atau dimodifikasi oleh **service** yang berada pada layer application.

<br>

## Referensi :books:

- [Code with Andrea: Flutter App Architecture - Domain Model](https://codewithandrea.com/articles/flutter-app-architecture-domain-model/)
- [Code with Andrea: Comparison of Flutter App Architectures](https://codewithandrea.com/articles/comparison-flutter-app-architectures/)
- [StackOverflow: Controller Logic vs Service/Business Layer Logic](https://stackoverflow.com/questions/42840869/controller-logic-vs-service-business-layer-logic)
- [StackOverflow: What's the Role of the Model in MVC?](https://stackoverflow.com/questions/8406822/whats-the-role-of-the-model-in-mvc)
