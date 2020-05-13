@trust-activation
Feature: Validate TRUST activation JSON message

  Scenario: Validate example TRUST activation JSON
    Given The following JSON:
    """
    {
        "header": {
            "msg_type": "0001",
            "source_dev_id": "",
            "user_id": "",
            "original_data_source": "TSIA",
            "msg_queue_timestamp": "1511528234000",
            "source_system_id": "TRUST"
        },
        "body": {
            "schedule_source": "C",
            "train_file_address": null,
            "schedule_end_date": "2017-12-08",
            "train_id": "775F25MP24",
            "tp_origin_timestamp": "2017-11-24",
            "creation_timestamp": "1511528234000",
            "tp_origin_stanox": "",
            "origin_dep_timestamp": "1511535420000",
            "train_service_code": "25470001",
            "toc_id": "25",
            "d1266_record_number": "00000",
            "train_call_type": "AUTOMATIC",
            "train_uid": "C21373",
            "train_call_mode": "NORMAL",
            "schedule_type": "O",
            "sched_origin_stanox": "77301",
            "schedule_wtt_id": "5F25M",
            "schedule_start_date": "2016-12-12"
        }
    }
    """
    When it's validated against "network-rail-trust-activation.schema.json"
    Then it should pass validation
