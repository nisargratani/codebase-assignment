## Codebase Assignment

#### Requirements

Here are some things you need to prepare for code to setup:

1. Flutter SDK Stable (Latest Version) [Install](https://flutter.dev/docs/get-started/install)
2. Android Studio [Install](https://developer.android.com/studio)
3. Visual Studio Code (Optional) [Install](https://code.visualstudio.com/)
4. **Dart** and **Flutter** extensions:
    - **Intellij Platform** users ([Dart](https://plugins.jetbrains.com/plugin/6351-dart)
      , [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter) )
    - **Visual Studio Code**
      users ([Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)
      , [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) )

#### Setup

To set up your project based on this boilerplate, you need to do some of the steps you need to do.

Here are the steps for setting up a Project with this Flutter-Works boilerplate:

**Step 1:**

In this step you need to download(cloning) the files from this repository to your local computer:

``` bash
git clone <project url>
```

Or

``` bash
git clone <project url>
```

**Step 2:**

The next step is to open the folder that has been downloaded / cloned into a cli application such
as `bash`, `cmd`, `terminal` .

After cloning the repo and follow these steps to setup the project.

flutter pub get

flutter pub run build_runner build

## Architecture

The architecture of the template facilitates separation of concerns and avoids tight coupling
between it's various layers. The goal is to have the ability to make changes to individual layers
without affecting the entire app. This architecture is an adaptation of concepts
from [`Hexagonal`](./wiki/ARCHITECTURE.md)
& [`The Clean Architecture`](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
.

### Layers

The architecture is separated into the following layers

The architecture is separated into the following layers


    - [`domain`](core/domain): Use cases for individual pieces of work.
    - [`data`](core/data): Repositories to manage various data sources.
    - [`shared`](core/shared): Common items for core module shared between [`domain`](core/domain)
      & [`data`](core/data).

    - [`network-retrofit`](infrastructure/network-retrofit): [Retrofit](https://pub.dev/packages/retrofit)
      as the Database provider

Each layer has a `di` directory to manage Dependency Injection for that layer.

## Libraries & Tools Used

- Dependency Injection - Riverpod
- Network - [Retrofit](https://pub.dev/packages/retrofit)
- Reactive Caching and Data-binding Framework - [RiverPod](https://riverpod.dev/)
- Bloc Framework - [Bloc](https://pub.dev/packages/flutter_bloc)
- [Navigation](https://docs.flutter.dev/development/ui/navigation)
- Localisation - [Flutter Intl](https://www.jetbrains.com/help/idea/managing-plugins.html)
