@trust-cancellation
Feature: Validate TRUST cancellation JSON message

  Scenario: Validate example TRUST cancellation JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0002",
            "source_dev_id": "",
            "user_id": "",
            "original_data_source": "SDR",
            "msg_queue_timestamp": "1511528427000",
            "source_system_id": "TRUST"
        },
        "body": {
            "train_file_address": null,
            "train_service_code": "22721000",
            "orig_loc_stanox": "",
            "toc_id": "88",
            "dep_timestamp": "1511527680000",
            "division_code": "88",
            "loc_stanox": "87701",
            "canx_timestamp": "1511528400000",
            "canx_reason_code": "YI",
            "train_id": "871B26MK24",
            "orig_loc_timestamp": "",
            "canx_type": "EN ROUTE"
        }
    }
    """
    When it's validated against "network-rail-trust-cancellation.schema.json"
    Then it should pass validation
