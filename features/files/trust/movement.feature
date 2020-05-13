@trust-movement
Feature: Validate TRUST movement JSON message

  Scenario: Validate example TRUST movement JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0003",
            "source_dev_id": "VLA5",
            "user_id": "#QHPA026",
            "original_data_source": "SDR",
            "msg_queue_timestamp": "1511528232000",
            "source_system_id": "TRUST"
        },
        "body": {
            "train_id": "515G531I24",
            "current_train_id": "",
            "original_loc_stanox": "",
            "original_loc_timestamp": "",
            "event_source": "MANUAL",
            "event_type": "DEPARTURE",
            "gbtt_timestamp": "",
            "actual_timestamp": "1511524620000",
            "planned_event_type": "DEPARTURE",
            "planned_timestamp": "1511524620000",
            "reporting_stanox": "52701",
            "loc_stanox": "52701",
            "next_report_stanox": "52226",
            "next_report_run_time": "9",
            "timetable_variation": "0",
            "variation_status": "ON TIME",
            "auto_expected": "true",
            "correction_ind": "false",
            "delay_monitoring_point": "true",
            "toc_id": "79",
            "division_code": "79",
            "offroute_ind": "false",
            "direction_ind": "",
            "route": "",
            "line_ind": "",
            "platform": "",
            "train_file_address": null,
            "train_service_code": "25936005",
            "train_terminated": "false"
        }
    }
    """
    When it's validated against "network-rail-trust-movement.schema.json"
    Then it should pass validation
