<?php

use Swaggest\JsonSchema\Schema;
use TrainjunkiesPackages\QueueSubscriber\NetworkRail\Topics\Trust as TrustTopic;
use TrainjunkiesPackages\QueueSubscriber\Stomp\Message;
use TrainjunkiesPackages\QueueSubscriber\Stomp\OptionsBuilder;

require_once __DIR__ . '/../vendor/autoload.php';

function type_checker($type, $schema, $data)
{
    if (strpos($data, $type) === 0) {
        validate_against_schema($data, $schema);
    }
}

function validate_against_schema($data, $schemaName)
{
    $jsonSchemaObject = json_decode(
        file_get_contents(
            realpath($schemaName)
        )
    );

    Schema::import($jsonSchemaObject)->in(
        json_decode($data)
    );
}

function networkrail_simple_client()
{
    $options = (new OptionsBuilder)
        ->withUsername(getenv('NETWORKRAIL_USERNAME'))
        ->withPassword(getenv('NETWORKRAIL_PASSWORD'))
        ->withHost(getenv('NETWORKRAIL_HOST'))
        ->withPort(getenv('NETWORKRAIL_PORT'))
        ->build();

    return new \TrainjunkiesPackages\QueueSubscriber\Stomp\Subscription(
        new \TrainjunkiesPackages\QueueSubscriber\Client($options)
    );
}

function get_trust_messages_from_type($type, callable $callback)
{
    networkrail_simple_client()
        ->consume(
            TrustTopic::MOVEMENT_ALL,
            function (Message $message) use ($type, $callback) {
                $json = json_decode($message->getBody(), true);
                $messages = array_filter($json, function ($item) use ($type, $callback) {
                    return $item['header']['msg_type'] === $type;
                });

                foreach ($messages as $message) {
                    $callback(json_encode($message));
                }
            }
        );
}
