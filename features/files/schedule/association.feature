@association
Feature: Validate Association JSON

  Scenario: Validate create association JSON
    Given The following JSON:
    """
    {
        "JsonAssociationV1": {
            "transaction_type": "Create",
            "main_train_uid": "W57970",
            "assoc_train_uid": "W56712",
            "assoc_start_date": "2020-05-23T00:00:00Z",
            "assoc_end_date": "2020-12-12T00:00:00Z",
            "assoc_days": "0000010",
            "category": "NP",
            "date_indicator": "S",
            "location": "DARTFD",
            "base_location_suffix": null,
            "assoc_location_suffix": null,
            "diagram_type": "T",
            "CIF_stp_indicator": "P"
        }
    }
    """
    When it's validated against "network-rail-schedule-association.schema.json"
    Then it should pass validation

  Scenario: Validate create association JSON with base location suffix
    Given The following JSON:
    """
    {
        "JsonAssociationV1": {
            "transaction_type": "Create",
            "main_train_uid": "C66501",
            "assoc_train_uid": "C64937",
            "assoc_start_date": "2019-12-15T00:00:00Z",
            "assoc_end_date": "2020-05-10T00:00:00Z",
            "assoc_days": "0000001",
            "category": "NP",
            "date_indicator": "S",
            "location": "NTNG",
            "base_location_suffix": "2",
            "assoc_location_suffix": null,
            "diagram_type": "T",
            "CIF_stp_indicator": "P"
        }
    }
    """
    When it's validated against "network-rail-schedule-association.schema.json"
    Then it should pass validation

  Scenario: Validate create association JSON with association location suffix
    Given The following JSON:
    """
    {
        "JsonAssociationV1": {
            "transaction_type": "Create",
            "main_train_uid": "C64581",
            "assoc_train_uid": "C68123",
            "assoc_start_date": "2019-12-16T00:00:00Z",
            "assoc_end_date": "2020-05-15T00:00:00Z",
            "assoc_days": "1111100",
            "category": "JJ",
            "date_indicator": "S",
            "location": "NTNG",
            "base_location_suffix": null,
            "assoc_location_suffix": "2",
            "diagram_type": "T",
            "CIF_stp_indicator": "P"
        }
    }
    """
    When it's validated against "network-rail-schedule-association.schema.json"
    Then it should pass validation

  Scenario: Validate create association JSON with empty category and date indicator
    Given The following JSON:
    """
    {
        "JsonAssociationV1": {
            "transaction_type": "Create",
            "main_train_uid": "Y33291",
            "assoc_train_uid": "Y33306",
            "assoc_start_date": "2019-12-15T00:00:00Z",
            "assoc_end_date": "2020-05-10T00:00:00Z",
            "assoc_days": "0000001",
            "category": "  ",
            "date_indicator": " ",
            "location": "NWCSTLE",
            "base_location_suffix": null,
            "assoc_location_suffix": null,
            "diagram_type": "T",
            "CIF_stp_indicator": "C"
        }
    }
    """
    When it's validated against "network-rail-schedule-association.schema.json"
    Then it should pass validation

  Scenario: Validate delete association JSON
    Given The following JSON:
    """
    {
        "JsonAssociationV1": {
            "transaction_type": "Delete",
            "main_train_uid": "C34137",
            "assoc_train_uid": "W56429",
            "assoc_start_date": "2020-05-25T00:00:00Z",
            "location": "DARTFD",
            "base_location_suffix": null,
            "diagram_type": "T",
            "CIF_stp_indicator": "C"
        }
    }
    """
    When it's validated against "network-rail-schedule-association.schema.json"
    Then it should pass validation