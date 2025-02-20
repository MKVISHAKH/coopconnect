<?php
// This function is needed, because php doesn't have support for base64UrlEncoded strings
function base64UrlEncode($text)
{
    return str_replace(
        ['+', '/', '='],
        ['-', '_', ''],
        base64_encode($text)
    );
}

$authConfigString = file_get_contents("./flutter-odmanager-firebase-adminsdk-utkbv-c24164c60f.json");


// Parse service account details
$authConfig = json_decode($authConfigString);


// Read private key from service account details
$secret = openssl_get_privatekey($authConfig->private_key);


// Create the token header
$header = json_encode([
    'typ' => 'JWT',
    'alg' => 'RS256'
]);


// Get seconds since 1 January 1970
$time = time();


// Allow 1 minute time deviation between client en server (not sure if this is necessary)
$start = $time - 60;
$end = $start + 3600;
// echo $start;
// Create payload
$payload = json_encode([
    "iss" => $authConfig->client_email,
    "scope" => "https://www.googleapis.com/auth/firebase.messaging",
    "aud" => "https://oauth2.googleapis.com/token",
    "exp" => $end,
    "iat" => $start
]);


// Encode Header
$base64UrlHeader = base64UrlEncode($header);


// Encode Payload
$base64UrlPayload = base64UrlEncode($payload);


// Create Signature Hash
$result = openssl_sign($base64UrlHeader . "." . $base64UrlPayload, $signature, $secret, OPENSSL_ALGO_SHA256);


// Encode Signature to Base64Url String
$base64UrlSignature = base64UrlEncode($signature);


// Create JWT
$jwt = $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;


//-----Request token, with an http post request------
$options = array('http' => array(
    'method'  => 'POST',
    'content' => 'grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion='.$jwt,
    'header'  => "Content-Type: application/x-www-form-urlencoded"
));
$context  = stream_context_create($options);
$responseText = file_get_contents("https://oauth2.googleapis.com/token", false, $context);


$response = json_decode($responseText);
if (isset($response->access_token)) {
    $accessToken = $response->access_token;
    echo "Access Token: " . $accessToken;
} else {
    echo "Failed to obtain access token.";
}
//echo "Access Token2: " . $accessToken;
$notification=[
    'message'=>[
        'token'=>'cU-OsDZwQ8OF4N7by-ilxg:APA91bHIOq4OdKDOkoktWxLfFECLyRYsLLagUdc4iZiYzCGei8a7GIon6I-AA9h4Lh3KXxxEN6CsZMWWQh2Do5QvACuDoB9WUCEBtB99NDMBl2V-UxBQ0EcYwJbcW8i8oS4EhGTZ31zN',
        'notification'=>[
            'title'=>'Hello',
            'body'=>'world'
        ]
    ]
];
print_r($notification) ;
//Send the push notification
$ch=curl_init();
curl_setopt($ch,CURLOPT_URL,'https://fcm.googleapis.com/v1/projects/flutter-odmanager/messages:send');
curl_setopt($ch,CURLOPT_POST,true);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
curl_setopt($ch,CURLOPT_HTTPHEADER,[
    'Authorization: Bearer ' .$accessToken,
    'Content-Type:application/json'
]);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($notification));


// Enable verbose output for debugging
curl_setopt($ch, CURLOPT_VERBOSE, true);


// Specify the path to the CA certificates file
curl_setopt($ch, CURLOPT_CAINFO, 'E:\od\odmanager Firebase\ca_cert\cacert.pem');


// Execute the cURL request and get the response
$response = curl_exec($ch);


// Check for cURL errors
if (curl_errno($ch)) {
    $error_msg = curl_error($ch);
    echo "cURL Error: " . $error_msg;
}


// Close the cURL session
curl_close($ch);


// Print the response
echo "Response: " . json_encode($response);


// Optionally, decode the JSON response for better readability
$response_decoded = json_decode($response, true);
echo "Decoded Response: " . print_r($response_decoded, true);
// curl_setopt($ch,CURLOPT_POSTFIELDS,json_encode($notification));
// $response=curl_exec($ch);
// echo $response;
// curl_close($ch);
//echo json_encode($response);
// echo json_encode($response);
?>
