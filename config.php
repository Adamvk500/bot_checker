<?php
// Configuración de la base de datos
function getDbConfig() {
    return [
        'host' => '://alwaysdata.com', // ⚠️ IMPORTANTE: Mira la nota abajo para cambiar esto
        'username' => 'arturo',
        'password' => '15112003Aa!',
        'database' => 'arturo_dior'
    ];
}

// Configuración de Telegram
function getBotToken() {
    return "5456276655:AAFt3u9hGVZxA72kBJrTc9W-Bmp7CWjLJBA";
}

function getOwnerId() {
    return "TU_TELEGRAM_ID"; 
}

function getGoogleTranslateApiKey() {
    return "TU_API_KEY_DE_GOOGLE"; 
}
