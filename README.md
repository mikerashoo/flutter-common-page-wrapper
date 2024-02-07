# Flutter Common Loading Skeleton

This Flutter project provides a common loading skeleton and error handling wrapper for pages. It includes sample implementations like fetching items from a JSON file, displaying a list, and showing item details.

## Features

- **PageWrapper Widget:** A reusable widget for handling common loading, error, and success states.
- **SampleItemService:** A service class to fetch sample items from a JSON file.
- **SampleItemListView:** Displays a list of sample items with loading and error handling.
- **SampleItemDetailsView:** Displays details for a selected sample item.

## Getting Started

1. Clone the repository:

    ```bash
    git clone https://github.com/mikerashoo/flutter-common-page-wrapper.git
    ```

2. Navigate to the project directory:

    ```bash
    cd flutter-common-page-wrapper
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

## Structure

The project structure follows best practices for a Flutter project:

- **lib/:** Contains the main Dart code.
  - **models/:** Data models for the application.
  - **services/:** Service classes for fetching data.
  - **widgets/:** Reusable UI components.
  - **wrappers/:** PageWrapper widget and related files.
  - **screens/:** Views for different screens.
- **assets/:** Contains static assets, such as the sample_items.json file.

## Usage

- **PageWrapper:** Use the `PageWrapper` widget to handle loading, error, and success states in your pages. Customize loading and error UI as needed.

- **SampleItemService:** Modify the service class to fetch data from your desired source.

- **SampleItemListView and SampleItemDetailsView:** Customize these views to display your data in a list and show details.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

