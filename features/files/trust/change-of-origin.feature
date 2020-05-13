@trust-change-of-origin
Feature: Validate TRUST change of origin JSON message

  Scenario: Validate example TRUST change of origin JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0006",
            "source_dev_id": "V3HS",
            "user_id": "#QRP0059",
            "original_data_source": "SDR",
            "msg_queue_timestamp": "1511528282000",
            "source_system_id": "TRUST"
        },
        "body": {
            "train_id": "321P42MP24",
            "current_train_id": "",
            "coo_timestamp": "1511528280000",
            "reason_code": "TH",
            "dep_timestamp": "1511540100000",
            "loc_stanox": "16416",
            "original_loc_timestamp": "",
            "original_loc_stanox": "",
            "toc_id": "20",
            "division_code": "20",
            "train_service_code": "21734000",
            "train_file_address": null
        }
    }
    """
    When it's validated against "network-rail-trust-change-of-origin.schema.json"
    Then it should pass validation
