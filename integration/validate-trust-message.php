<?php

require_once __DIR__ . '/_bootstrap.php';

$messageType = $argv[1] ?? false || die('Please specify a message type' . PHP_EOL);
$schema = $argv[2] ?? false || die('Please specify a schema file' . PHP_EOL);

try {
    get_trust_messages_from_type($messageType, function ($message) use ($schema) {
        validate_against_schema($message, $schema);
    });
} catch (\Exception $e) {
    echo $e->getMessage() . PHP_EOL;
    exit(1);
}
