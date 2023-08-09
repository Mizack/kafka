<?php
require 'vendor/autoload.php';
$config = \Kafka\ConsumerConfig::getInstance();
$config->setMetadataRefreshIntervalMs(10);
$config->setMetadataBrokerList('127.0.0.1:9092');
$config->setGroupId('teste');
$config->setBrokerVersion('1.0.0');
$config->setTopics(['teste']);
$consumer = new \Kafka\Consumer();

$consumer->start(function($topic, $part, $message) {
    var_dump($message);
});