# git-users-list
 
A simple OAuth app that lists git hub users

## APP Preview

![App Preview](/app.gif)

## User Interface

The application is built using SwiftUI, ensuring a modern and intuitive user interface.

## Components

Custom UI components and modifiers can be found in the `UI/Components` folder. Feel free to explore and reuse these components in different parts of the application.

## Accessibility/Localization

- Colors are currently accessible.
- Text is localized to support a global audience.

## Tokens

The application leverages Color, text, and font tokens for consistent styling throughout the app.

## Features

Explore the following key features:

- **OAuth Feature:** Authenticate using github.
- **Github Users Feature:** Discover all users on github
- **User Details Feature:** Dig deeper and get to know your favorite users.

## Architecture (MVVM-C)

The Movie App follows the MVVM-C (Model-View-ViewModel-Coordinator) architecture:

- **Router:** Utilizes a custom router object named `Router` for easy navigation with a navigation stack.
- **Coordinator:** The app coordinator is the base and entry point where all feature routes/views are registered.
- **ViewModels:** Business logic resides in observable view models.
- **UI Layer:** Implemented in SwiftUI.
- **Dependency Injection:** The router is injected via the environment.

![DataFlow](/DataFlow.drawio.png)

## Networking

The networking layer utilizes async/await APIs and is structured into requests, responses, and a client.

## Testing

Unit tests are available for the view models, promoting code reliability and maintainability.

## Getting Started

1. Clone the repository.
2. Add your `Client ID` and `Client Secret` to the `AppConfig.xconfig` file.
3. Explore and contribute to the project!

Feel free to reach out if you have any questions or need further assistance. Happy coding!
