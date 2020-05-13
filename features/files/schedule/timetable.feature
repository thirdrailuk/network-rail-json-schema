@timetable
Feature: Validate Timetable JSON

  Scenario: Validate full Timetable JSON
    Given The following JSON:
    """
    {
        "JsonTimetableV1": {
            "classification": "public",
            "timestamp": 1506381255,
            "owner": "Network Rail",
            "Sender": {
                "organisation": "Rockshore",
                "application": "NTROD",
                "component": "SCHEDULE"
            },
            "Metadata": {
                "type": "full",
                "sequence": 1930
            }
        }
    }

    """
    When it's validated against "network-rail-schedule-timetable.schema.json"
    Then it should pass validation

  Scenario: Validate update Timetable JSON
    Given The following JSON:
    """
    {
        "JsonTimetableV1": {
            "classification": "public",
            "timestamp": 1589151880,
            "owner": "Network Rail",
            "Sender": {
                "organisation": "Rockshore",
                "application": "NTROD",
                "component": "SCHEDULE"
            },
            "Metadata": {
                "type": "full",
                "sequence": 2888
            }
        }
    }
    """
    When it's validated against "network-rail-schedule-timetable.schema.json"
    Then it should pass validation