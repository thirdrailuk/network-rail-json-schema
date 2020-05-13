@trust-reinstatement
Feature: Validate TRUST reinstatement JSON message

  Scenario: Validate example TRUST reinstatement JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0005",
            "source_dev_id": "LYUD",
            "user_id": "#QRP0059",
            "original_data_source": "TRUST DA",
            "msg_queue_timestamp": "1511528258000",
            "source_system_id": "TRUST"
        },
        "body": {
            "train_id": "321P42MP24",
            "current_train_id": "",
            "reinstatement_timestamp": "1511528220000",
            "dep_timestamp": "1511533980000",
            "loc_stanox": "32530",
            "original_loc_timestamp": "",
            "original_loc_stanox": "",
            "toc_id": "20",
            "division_code": "20",
            "train_service_code": "21734000",
            "train_file_address": null
        }
    }
    """
    When it's validated against "network-rail-trust-reinstatement.schema.json"
    Then it should pass validation
