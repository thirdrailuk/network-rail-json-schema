# Trainjunkies - Network Rail JSON Schema

[![Build Status](https://travis-ci.com/trainjunkies-packages/network-rail-json-schema.svg?branch=master)](https://travis-ci.com/trainjunkies-packages/network-rail-json-schema)

JSON Schema documents for Network Rail Open Datafeeds.

## Schemas
### Schedule

| Feed        | Schema                                          |
| ----------- | ----------------------------------------------- |
| Timetable   | `network-rail-schedule-timetable.schema.json`   |
| Association | `network-rail-schedule-association.schema.json` |
| Tiploc      | `network-rail-schedule-tiploc.schema.json`      |
| Schedule    | `network-rail-schedule-schedule.schema.json`    |

### TRUST

| Feed                | Schema                                              |
| ------------------- | --------------------------------------------------- |
| Train Activation    | `network-rail-trust-activation.schema.json`         |
| Train Cancellation  | `network-rail-trust-cancellation.schema.json`       |
| Train Movement      | `network-rail-trust-movement.schema.json`           |
| Train Reinstatement | `network-rail-trust-reinstatement.schema.json`      |
| Change of Origin    | `network-rail-trust-change-of-origin.schema.json`   |
| Change of Identity  | `network-rail-trust-change-of-identity.schema.json` |
| Change of Location  | `network-rail-trust-change-of-location.schema.json` |


## Development

Copy and complete `.env.dist` to `.env` with desired NROD feed credentials.

The development environment and dependencies are managed with [Docker](https://www.docker.com/get-started). In the same directory as the checked out cloned repository, run the below command to start the Docker Compose environment.

```bash
docker-compose up -d --build
```

Login to the `app` container begin development.
```
docker-compose run --rm app sh
```

Install the [Composer](https://getcomposer.org/) dependencies and execute the [Behat](https://behat.org/en/latest/) test suite.
```
composer.phar install
composer.phar behat
```

## Authors

- **Ben McManus** - [bennoislost](https://github.com/bennoislost)

See also the list of [contributors](https://github.com/trainjunkies-packages/data-feeds-queue-subscriber/contributors) who participated in this project


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

- [https://groups.google.com/forum/#!forum/openraildata-talk](https://groups.google.com/forum/#!forum/openraildata-talk)
- [https://wiki.openraildata.com/](https://wiki.openraildata.com/)
