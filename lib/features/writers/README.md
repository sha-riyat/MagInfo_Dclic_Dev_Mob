# Fonctionnalité de Gestion des Rédacteurs

## Description

Cette fonctionnalité permet à l'éditeur en chef de gérer tous les rédacteurs de Magazine Info. Elle implémente une architecture Feature-first avec Clean Architecture.

## Architecture

```
lib/features/writers/
├── data/
│   ├── models/
│   │   └── writer_model.dart
│   └── repositories/
│       ├── writer_database_service.dart
│       └── writer_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── writer.dart
│   └── repositories/
│       └── writer_repository.dart
└── presentation/
    ├── pages/
    │   └── writers_page.dart
    └── widgets/
        ├── writer_card.dart
        └── add_writer_dialog.dart
```

## Fonctionnalités

### CRUD Operations
- **Create** : Ajouter un nouveau rédacteur
- **Read** : Afficher la liste des rédacteurs
- **Update** : Modifier les informations d'un rédacteur
- **Delete** : Supprimer un rédacteur

### Champs du Rédacteur
- Nom complet
- Email (avec validation)
- Téléphone
- Spécialisation
- Date d'embauche
- Statut (Actif, Inactif, En congé)

### Base de Données
- Utilise SQLite via la bibliothèque `sqflite`
- Table `writers` avec tous les champs nécessaires
- Opérations asynchrones pour de meilleures performances

## Utilisation

1. Accédez à la page "Paramètres" dans l'application
2. Cliquez sur "Gestion des Rédacteurs"
3. Utilisez le bouton "+" pour ajouter un nouveau rédacteur
4. Utilisez le menu contextuel sur chaque carte pour modifier ou supprimer

## Technologies Utilisées

- **Flutter** : Framework UI
- **SQLite** : Base de données locale
- **sqflite** : Plugin Flutter pour SQLite
- **Google Fonts** : Typographie
- **Clean Architecture** : Architecture du code

## Dépendances

```yaml
dependencies:
  sqflite: ^2.3.0
  path: ^1.8.3
```
