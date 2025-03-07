# Tic-Tac-Toe - Flutter

This project is a simple implementation of the classic game Tic-Tac-Toe, built using Flutter.  It supports both single-player (against a basic AI) and two-player modes.  The app is designed to be responsive and uses Flutter's theming capabilities for easy customization.

## Demo
https://github.com/user-attachments/assets/4480ed19-53d4-4275-8e80-497659c8f6a2

## Features

*   **Two Game Modes:**
    *   **Single Player:** Play against a computer opponent.  The AI uses a simple strategy:
        1.  Win if possible.
        2.  Block the player from winning.
        3.  Choose a random empty cell.
    *   **Two Player:**  Play against another person on the same device.

*   **Dynamic Theming:** The app's color scheme responds to changes in the Flutter theme. You can easily customize the look and feel.

*   **Game Logic:**
    *   Detects wins (horizontal, vertical, and diagonal).
    *   Detects draws.
    *   Resets the game after a win or draw.
    *   Clear visual feedback for the current player and winning moves.

*   **UI:**
    *   Clean and intuitive user interface.
    *   Uses `GridView` for a responsive board layout.
    *   `AlertDialog` for displaying game results (win/draw).
    *   Custom widgets (`MyBox`, `PlayerBox`, `MyAppBar`, `MyAlertDialog`) for better organization and reusability.
      
## Getting Started (for contributors)

### Prerequisites

*   **Flutter SDK:**  You'll need to have the Flutter SDK installed on your machine.  Follow the official Flutter installation guide: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
*   **Dart SDK:** The Dart SDK is typically installed along with Flutter.
*   **Emulator or Device:**  You'll need either an Android emulator, iOS simulator, or a physical device connected to your computer to run the app.

### Running the Project

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/AbrarAbe/tic-tac-toe
    cd tic_tac_toe  # (Replace with the actual directory name)
    ```

2.  **Get Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the App:**
    ```bash
    flutter run
    ```
    This command will build and run the app on your connected device or emulator.  If you have multiple devices connected, you might need to specify the target device using the `-d` flag (e.g., `flutter run -d <device_id>`).

## Project Structure

The project is organized as follows:

*   `lib/`: Contains the Dart source code.
    *   `core/`:  Contains the logic and functions of the game.
        *   `logic/`:  Contains the game logic implementations.
        *   `theme/`:  Contains the game logic implementations.
    *   `features/`:  Contains the main features of the game.
        *   `screens/`:  Contains the screen implementations.
        *  `components/`: Reusable widgets.
    * `main.dart`:  The entry point of the application.

## Dependencies

This project uses the standard Flutter libraries.  There are no external third-party packages beyond what comes with a basic Flutter project.

*   `flutter/material.dart`: Provides the Material Design widgets.

## AI Notes

The single-player AI is intentionally basic. It doesn't use advanced algorithms like Minimax. This makes the game beatable for a human player, and keeps the code simpler for learning purposes.  Improving the AI would be a good next step for expanding the project.  Possible improvements:

*   **Minimax Algorithm:** Implement the Minimax algorithm for a more challenging AI.
*   **Difficulty Levels:**  Allow the user to select different difficulty levels (e.g., Easy, Medium, Hard), perhaps by adjusting the depth of the Minimax search.

## Contributing

Contributions are welcome!  If you find any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is open-source and is distributed under the [MIT License](LICENSE). See the `LICENSE` file for details.

## Contact

*   [AbrarAbe](<https://github.com/AbrarAbe>)
*   <abrar.abe01@gmail.com>
