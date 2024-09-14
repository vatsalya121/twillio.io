# twillio.io
twillio integration tutorial  for your flutter app to send messages on your watsapp using twillio

# Flutter WhatsApp Messaging Integration with Twilio

## Overview

This project demonstrates how to integrate WhatsApp messaging into a Flutter application using Twilio and a PHP backend. By following this tutorial, you will learn how to set up a simple Flutter app that communicates with the Twilio API to send WhatsApp messages.

## Prerequisites

- Flutter SDK installed
- PHP and a web server (like XAMPP or WAMP)
- A Twilio account with WhatsApp messaging enabled

## Project Setup

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/flutter-whatsapp-twilio.git
cd flutter-whatsapp-twilio
```
## 2. Flutter Configuration

1. Open the project in your preferred IDE (e.g., VS Code, Android Studio).
2. Run flutter pub get to install dependencies.
3. Configure your Flutter app to use the Twilio API by adding your Twilio credentials in the appropriate places.

## 3. PHP Backend Setup

1. Create a new directory on your web server for the PHP backend.
2. Copy the php folder from this repository to your web server's root directory.
3. Update the config.php file with your Twilio credentials:

```bash
   <?php
   define('TWILIO_SID', 'your_twilio_sid');
   define('TWILIO_AUTH_TOKEN', 'your_twilio_auth_token');
   define('TWILIO_PHONE_NUMBER', 'your_twilio_phone_number');
   ?>
```
4. Ensure your server supports PHP and that the twilio-php library is installed via Composer. You can install it using:
```bash
composer require twilio/sdk
```
5. Deploy your PHP backend on a web server and make a note of the endpoint URL.

## 4. Configure the Flutter App
1. Open lib/main.dart.
2. Replace YOUR_BACKEND_URL with the URL of your deployed PHP backend.
  
## 5. Running the App
1. Run the Flutter app on an emulator or physical device:
```bash
flutter run
```
2. Enter a phone number and message in the app to test WhatsApp messaging.

## Testing

Ensure your PHP backend is running and accessible from the Flutter app.
Test sending a message via the Flutter app and verify that it appears in the recipient's WhatsApp.

## Troubleshooting

If you encounter issues with sending messages, check the Twilio logs for any errors.
Ensure that your PHP server is properly configured and accessible from the Flutter app.
Verify that all credentials are correctly configured in both the PHP backend and Flutter app.


## Contributing
Feel free to fork the repository and submit pull requests with improvements or bug fixes.


