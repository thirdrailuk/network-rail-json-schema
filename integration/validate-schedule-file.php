<?php

require_once __DIR__ . '/_bootstrap.php';

$scheduleFile = $argv[1] ?? false || die('Please specify a schedule file' . PHP_EOL);

foreach (file($scheduleFile) as $line) {
    try {
        type_checker('{"JsonTimetableV1"', 'network-rail-schedule-timetable.schema.json', $line);
        type_checker('{"TiplocV1"', 'network-rail-schedule-tiploc.schema.json', $line);
        type_checker('{"JsonAssociationV1"', 'network-rail-schedule-association.schema.json', $line);
        type_checker('{"JsonScheduleV1"', 'network-rail-schedule-schedule.schema.json', $line);
    } catch (\Exception $e) {
        echo "FAILED Validation: " . PHP_EOL;
        echo $line . PHP_EOL . PHP_EOL;

        die($e->getMessage());
    }
}
