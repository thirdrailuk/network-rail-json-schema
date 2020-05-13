@trust-change-of-identity
Feature: Validate TRUST change of identity JSON message

  Scenario: Validate example TRUST change of identity JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0007",
            "source_dev_id": "V2WX",
            "user_id": "#WAELKNK",
            "original_data_source": "SDR",
            "msg_queue_timestamp": "1511531881000",
            "source_system_id": "TRUST"
        },
        "body": {
            "train_id": "86678V1J24",
            "current_train_id": "",
            "revised_train_id": "86417G1J24",
            "event_timestamp": "1511531880000",
            "train_file_address": "BAX",
            "train_service_code": "56609010"
        }
    }
    """
    When it's validated against "network-rail-trust-change-of-identity.schema.json"
    Then it should pass validation
