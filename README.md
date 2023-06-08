# ny_times

NY Times Flutter project.

## Getting Started

This project is created for personal use only to practice Flutter.

* Libraries and techniques used:
  1. GetX to take care of the dependencies (DI).
  2. GetConnect from GetX to build a custom HTTP client.
  3. Manual JSON decoding.
  4. EasyLoading to show a progress bar.
  5. ResponsiveBuilder to control the sizing for different devices and platforms if needed later.
  6. mockito for unit testing.

* How to run the project?
  - Note: You must create your own application here: https://developer.nytimes.com/, enable the required API (Most Popular API), and then get your own API key and paste it in the Constants class (apiKey).<br><br>
  
  1. Clone the source code using Git into your IDE, ex: Android Studio.
  2. After cloning, install the required libraries in the project (Your IDE should take care of this step).
  3. Create a new virtual device (Android device) or you can use your own physical device (Android also).
  4. After running the virtual device (Emulator) or connecting your own physical device, you can hit the green run button to run the app (You must select the target device first).
  5. If you want to run the web version of the app, you must install Chrome first and then hit the green run button to run the app (You must select the target device/platform first).

* How to run test coverage?
  - Run the following commands in the Terminal:<br><br>
  
  1. flutter test --coverage
  2. genhtml coverage/lcov.info -o coverage/html (Note: On macOS you need to have lcov installed on your system (`brew install lcov`)).
  3. open coverage/html/index.html