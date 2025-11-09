```markdown
# Flutter Project - Clean Architecture dengan Riverpod

Aplikasi Flutter yang dikembangkan dengan **Clean Architecture** dan **Riverpod** sebagai state management utama. Struktur berbasis fitur untuk kode yang modular dan mudah dikembangkan.

## 📁 Struktur Folder

```
lib/
├── features/           # Modul berbasis fitur
│   └── auth/          # Contoh: Fitur Autentikasi
│       ├── data/              # Lapisan Data
│       │   ├── auth_api.dart
│       │   ├── auth_model.dart
│       │   └── auth_repository_impl.dart
│       ├── domain/            # Lapisan Domain
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/      # Lapisan Presentasi
│           ├── auth_provider.dart
│           └── login_screen.dart
├── main.dart          # Entry point aplikasi
└── router.dart        # Konfigurasi routing
```

## 🏗️ Arsitektur Clean Architecture

### **Domain Layer**
- **Entities**: Model bisnis inti
- **Repositories**: Interface untuk akses data
- **Usecases**: Logika bisnis spesifik

### **Data Layer**
- **API**: Komunikasi dengan external services
- **Models**: Data transfer objects
- **Repository Implementations**: Implementasi repository interface

### **Presentation Layer**
- **Providers**: State management dengan Riverpod
- **Screens**: UI components dan pages

## 🔄 Alur Data

```
UI → Provider → Usecase → Repository → Data Source
```

## 🚀 Memulai

```bash
# Clone repository
git clone <repository-url>

# Install dependencies
flutter pub get

# Run aplikasi
flutter run
```

## 📦 Dependencies Utama

- `flutter_riverpod` - State management
- `dio` - HTTP client
- `freezed` - Data classes
- `flutter_hooks` - Widget lifecycle
