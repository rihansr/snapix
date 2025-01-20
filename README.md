# Snapix

<img src="https://github.com/rihansr/snapix/blob/main/preview.gif" width="30%" height="30%"/>

## Project Structure

### Modules

The project is divided into several modules, each responsible for a specific feature or functionality. This modular approach helps in maintaining a clean architecture and makes the codebase more manageable and scalable.

### Modules

- **Core**: Provides fundamental services and functionalities that are utilized across the entire application.
- **Features**:
    - **Gallery**: Displays photo albums with previews and full-screen viewing.
    - **Settings**: Manages application settings, including localization and theming options.
- **Shared**: Provides common functionalities such as permission handling, local storage access, and reusable widgets, all following clean architecture principles.

### Dependency Injection

We use `get_it` and `injectable` for dependency injection to manage the dependencies across different modules. This ensures that the dependencies are easily testable and configurable.

### State Management

The application uses `flutter_bloc` for state management, which helps in managing the state of the application in a predictable manner.

## Getting Started

### Download

You can download the latest version of the application from the following links:

- [Google Drive](https://drive.google.com/file/d/1jGHhNYIJRc_JLyMj3UgX9FxPiUp1GinJ/view?usp=sharing)

### Prerequisites

Ensure you have the following installed on your system:

- Flutter SDK: [Installation Guide](https://docs.flutter.dev/get-started/install)
- Dart SDK: [Installation Guide](https://dart.dev/get-dart)

### Steps

1. Clone the repository:
    ```sh
    git clone https://github.com/rihansr/snapix.git
    cd snapix
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the application:
    ```sh
    flutter run
    ```
