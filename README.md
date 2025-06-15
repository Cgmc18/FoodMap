# FoodMap 🍽️

Aplicativo mobile para descoberta e avaliação de restaurantes, desenvolvido em Flutter.

## 📋 Pré-requisitos

- Flutter SDK (^3.29.2)
- Android Studio ou VS Code com extensões Flutter
- Android SDK para desenvolvimento Android

## 🚀 Instalação

```bash
# Instalar dependências
flutter pub get

# Executar o aplicativo
flutter run
```

## 📱 Funcionalidades

- **Descoberta de Restaurantes**: Explore restaurantes por categoria
- **Mapa**: Visualize a localização dos restaurantes
- **Sistema de Avaliações**: Avalie e comente sobre os restaurantes
- **Autenticação**: Login e cadastro de usuários

## 📁 Estrutura do Projeto

```
lib/
├── core/               # Utilitários e configurações
├── presentation/       # Telas e widgets da interface
├── routes/            # Rotas do aplicativo
├── theme/             # Configuração de temas
└── widgets/           # Componentes reutilizáveis
```

## 🏗️ Build para Produção

```bash
# Android
flutter build apk --release

# iOS (macOS necessário)
flutter build ios --release
```

## 🛠️ Tecnologias

- [Flutter](https://flutter.dev) & [Dart](https://dart.dev)
- Material Design
- GetX para gerenciamento de estado