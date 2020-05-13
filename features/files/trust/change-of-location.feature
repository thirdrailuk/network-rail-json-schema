@trust-change-of-location
Feature: Validate TRUST change of location JSON message

  Scenario: Validate example TRUST change of location JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0008",
            "source_dev_id": "VNHY",
            "user_id": "#PEE0031",
            "original_data_source": "TOPS",
            "msg_queue_timestamp": "1511532209000",
            "source_system_id": "TRUST"
        },
        "body": {
            "train_id": "174M37CF24",
            "current_train_id": "",
            "event_timestamp": "1511532180000",
            "loc_stanox": "36108",
            "dep_timestamp": "1511528640000",
            "original_loc_stanox": "36169",
            "original_loc_timestamp": "1511528640000",
            "train_file_address": "BDI",
            "train_service_code": "56461882"
        }
    }
    """
    When it's validated against "network-rail-trust-change-of-location.schema.json"
    Then it should pass validation
