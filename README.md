# Dota Heroes iOS App - README

## Introduction
Dota Heroes is an iOS app written in Swift 5 that provides information about heroes from the popular game Dota 2. This README document aims to provide an overview of the app's architecture, file interactions, features, technologies used, installation instructions, and how to contribute to the project.

## Architecture
The Dota Heroes iOS app follows the MVP (Model-View-Presenter) architecture pattern, which provides a clear separation of concerns and promotes modularity and testability. The main components of the architecture are:

- **Model**: Represents the data and business logic of the app. It includes entities like `Hero` and data access services like `HeroService`.
- **View**: Responsible for displaying the user interface and handling user interactions. It consists of view controllers, views, and interface components.
- **Presenter**: Acts as the intermediary between the model and the view. It retrieves data from the model and formats it for presentation in the view. It also handles user interactions and updates the model accordingly.

The architecture promotes loose coupling between components and allows for easier maintenance and testing of individual components.

## File Interactions
The Dota Heroes iOS app consists of several key files and directories that interact with each other. Here's an overview of the important files and their interactions:

- **Models**: Contains the `Hero` struct, which represents a Dota 2 hero. This model is used by the app to store and display hero information.

- **Services**: Contains the `HeroService` class, which handles the retrieval of hero data from the OpenDota API. The service communicates with the API using REST calls and returns the data to the presenter.

- **View Controllers**: The app has two main view controllers:
  - `HeroesListViewController`: Displays a list of heroes in a table view. It communicates with the presenter to retrieve and display hero data.
  - `HeroDetailViewController`: Shows detailed information about a selected hero. It receives the hero data from the presenter and updates the view accordingly.

- **Presenters**: The app has two main presenters:
  - `HeroesListPresenter`: Retrieves hero data from the `HeroService` and formats it for presentation in the `HeroesListViewController`.
  - `HeroDetailPresenter`: Receives a selected hero from the `HeroesListViewController` and prepares it for display in the `HeroDetailViewController`.

- **Dependencies**: The app uses dependency injection to provide the necessary dependencies to each component. Dependencies are injected into the presenters through their initializers, allowing for easier testing and modularity.

## Features
- Displays a list of Dota 2 heroes in a table view.
- Allows users to view detailed information about each hero in a separate detail view.
- Fetches hero data from the OpenDota API.
- Implements MVP (Model-View-Presenter) architecture.
- Utilizes REST API for data retrieval.
- Supports unit testing and UI testing.
- Implements dependency injection for enhanced modularity.
- Adheres to the delegate and protocol pattern for inter-component communication.
- Implements programmatic UI using UIKit.
- Uses Swift Package Manager for package management.
- Utilizes REALM SWIFT for local storage.

## Technologies Used
- Swift 5
- UIKit
- REST API
- Unit Testing
- UI Testing
- MVP Architecture
- Dependency Injection
- Delegate and Protocol Pattern
- Programmatic Swift
- Swift Package Manager
- REALM SWIFT (Local Storage)

## Installation
To run the app locally, follow these steps:

1. Ensure you have Xcode 14.0 or later installed on your machine.
2. Clone the repository using the following command:
`git clone https://github.com/ayodejiayankola/DotaHeroes-iOS.git`
3. Navigate to the project directory in the terminal.
4. Open `DotaHeroes-iOS.xcodeproj` in Xcode.
5. Build and run the app using the Xcode simulator or a connected iOS device.

**Note:** If you want to test the implementation using REALM DB, switch to the `task-integrate-realm-db` branch by typing the following command:
`git checkout task-integrate-realm-db`

## Contribution
Contributions to Dota Heroes are welcome! If you encounter any bugs or have feature requests, please open an issue on the [repository](https://github.com/ayodejiayankola/DotaHeroes-iOS/issues).

## License
Dota Heroes is available under the MIT license. For more information, refer to the [LICENSE](https://github.com/ayodejiayankola/DotaHeroes-iOS/blob/main/LICENSE) file.

## Acknowledgments
Dota Heroes utilizes the OpenDota API to fetch hero data. Special thanks to the OpenDota team for providing this valuable resource! API URL: [https://api.opendota.com/api/heroStats](https://api.opendota.com/api/heroStats)
