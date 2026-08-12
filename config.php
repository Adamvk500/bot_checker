<?php
// Configuración simulada para que el bot no dé errores de conexión
function getDbConfig() {
    return [
        'host' => '127.0.0.1',
        'username' => 'root',
        'password' => '',
        'database' => 'test'
    ];
}

// Configuración de tu bot de Telegram
function getBotToken() {
    return "5456276655:AAFt3u9hGVZxA72kBJrTc9W-Bmp7CWjLJBA";
}

function getOwnerId() {
    return "123456789"; 
}

function getGoogleTranslateApiKey() {
    return ""; 
}
