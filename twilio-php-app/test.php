<?php
require 'vendor/autoload.php'; // This will autoload the Twilio SDK

use Twilio\Rest\Client;

// Twilio credentials (replace with your actual credentials)
$sid = 'XXXXX';
$token = 'XXXXXX';
$twilio = new Client($sid, $token);

// Get the POST data from the Flutter app
$data = json_decode(file_get_contents('php://input'), true);
$recipient = $data['recipient'] ?? ''; // WhatsApp recipient number (e.g., whatsapp:+123456789)
$message = $data['message'] ?? '';     // Message to send

if ($recipient && $message) {
    try {
        // Send WhatsApp message
        $response = $twilio->messages
                           ->create(
                               $recipient,
                               [
                                   "from" => "whatsapp:+14155238886", // Twilio Sandbox WhatsApp number
                                   "body" => $message
                               ]
                           );

        echo json_encode(['success' => true, 'message' => 'Message sent successfully', 'sid' => $response->sid]);
    } catch (Exception $e) {
        // Handle errors
        http_response_code(500);
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    }
} else {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'Invalid input']);
}
