@tiploc
Feature: Validate Tiploc JSON

  Scenario: Validate full create Tiploc JSON
    Given The following JSON:
    """
    {
        "TiplocV1": {
            "transaction_type": "Create",
            "tiploc_code": "MACLSFD",
            "nalco": "287100",
            "stanox": "32571",
            "crs_code": "MAC",
            "description": "MACCLESFIELD",
            "tps_description": "MACCLESFIELD"
        }
    }
    """
    When it's validated against "network-rail-schedule-tiploc.schema.json"
    Then it should pass validation

  Scenario: Validate partial create Tiploc JSON
    Given The following JSON:
    """
    {
        "TiplocV1": {
            "transaction_type": "Create",
            "tiploc_code": "BRSS533",
            "nalco": "320701",
            "stanox": "81405",
            "crs_code": null,
            "description": null,
            "tps_description": "BRISTOL TM SIG 533"
        }
    }
    """
    When it's validated against "network-rail-schedule-tiploc.schema.json"
    Then it should pass validation

  Scenario: Validate create staff Tiploc JSON
    Given The following JSON:
    """
    {
        "TiplocV1": {
            "transaction_type": "Create",
            "tiploc_code": "CANTCAR",
            "nalco": "381675",
            "stanox": null,
            "crs_code": null,
            "description": null,
            "tps_description": "STAFF CAR (DO NOT DELETE)"
        }
    }
    """
    When it's validated against "network-rail-schedule-tiploc.schema.json"
    Then it should pass validation

  Scenario: Validate delete Tiploc JSON
    Given The following JSON:
    """
    {
        "TiplocV1": {
            "transaction_type": "Delete",
            "tiploc_code": "HIGBRNT"
        }
    }
    """
    When it's validated against "network-rail-schedule-tiploc.schema.json"
    Then it should pass validation