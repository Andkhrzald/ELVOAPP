# ELVO Brand — Aplikasi Flutter

Aplikasi e-commerce brand ELVO berbasis Flutter.

---

## Struktur Folder

```
lib/
├── main.dart              # Entry point aplikasi
├── app.dart               # Konfigurasi MaterialApp & tema
├── layar/                 # Halaman (screens)
│   ├── layar_login.dart   # Halaman login
│   └── layar_beranda.dart # Halaman beranda/dashboard
├── widget/                # Widget reusable
│   ├── banner_iklan.dart  # Banner promosi
│   ├── chip_kategori.dart # Chip kategori produk
│   ├── grid_produk.dart   # Grid daftar produk
│   └── bilah_pencarian.dart # Search bar
├── layanan/               # Layanan API
│   └── layanan_api.dart   # HTTP client
├── inti/                  # Core / utilitas
│   ├── ukuran_responsif.dart  # Breakpoint responsive
│   ├── tema.dart              # Tema warna aplikasi
│   └── konstanta.dart         # Konstanta global (base URL dll)
└── model/                 # Model data
    ├── model_user.dart    # Model user
    └── model_produk.dart  # Model produk
```

---

## Cara Menjalankan

### 1. Pastikan Laragon & Apache aktif

- Buka **Laragon** → klik **Start All**
- Pastikan indikator **hijau** dan Apache berjalan (cek port di kanan bawah)

### 2. Setup database

**Cara A — via Terminal Laragon (lebih cepat):**

```bash
# Buka Terminal Laragon, lalu jalankan:
"C:\laragon\bin\mysql\mysql-8.x\bin\mysql" -u root

# Di dalam MySQL, paste:
CREATE DATABASE IF NOT EXISTS db_elvo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_elvo;
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Keluar: exit
```

**Cara B — via phpMyAdmin:**

- Buka http://localhost:8080/phpmyadmin
- Klik tab **SQL**
- Copy paste isi file `C:\laragon\www\login_api\database.sql`
- Klik **Go**

### 3. Buat akun admin

```bash
php C:\laragon\www\login_api\seed.php
```

Hasil: user **admin** / **admin123** siap dipakai.

### 4. Test endpoint API

```bash
curl -X POST http://localhost:8080/login_api/login.php ^
  -d "username=admin&password=admin123"
```

Response sukses:
```json
{"status":"success","message":"Login berhasil.","data":{"id":1,"username":"admin","email":"admin@elvo.com"}}
```

> **Catatan:** `curl` hanya untuk **test sekali saja** — tidak perlu dijalankan setiap mau login. Cukup pastikan response-nya sukses, lalu tinggal pakai aplikasi Flutter-nya.

### 5. Jalankan Flutter

```bash
cd C:\elvobrand\elvoapp
flutter pub get
flutter run -d edge
```

Atau untuk Windows Desktop:

```bash
flutter run -d windows
```

Aplikasi akan terbuka di browser. Login dengan:

| Field | Isi |
|-------|-----|
| Email / Username | `admin` |
| Password | `admin123` |

---

## API Endpoint

| Method | URL | Body |
|--------|-----|------|
| POST | `http://localhost:8080/login_api/login.php` | `username`, `password` |

Base URL bisa diubah di `lib/inti/konstanta.dart`.
