# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.2] - 2020-09-04

### Changed

- Removed resource limits.

## [1.1.1] - 2020-08-12

### Fixed

- Lower validating webhook timeout from 5s to 3s, which was disrupting leader election [#43](https://github.com/giantswarm/gatekeeper-app/pull/43)

## [1.1.0] - 2020-08-07

### Added

- Add Prometheus labels/annotations to GateKeeper service to enable automatic
  scraping by GS Prometheus [#41](https://github.com/giantswarm/gatekeeper-app/pull/41)

## [1.0.0] - 2020-07-06

### Removed

- Remove check-ignore-label.gatekeeper.sh from validating webhook [#34](https://github.com/giantswarm/gatekeeper-app/pull/34)

## [0.3.2] - 2020-07-03

- Increase memory limit to 1024 Mb.

## [0.3.1] - 2020-05-20

- Moving CRDs into a separate directory

## [0.3.0] - 2020-04-15

- Fix labels & selectorLabels in chart

## [0.2.2] - 2020-04-08

- Add patch which removes an upstream podAnnotation

## [0.2.1] - 2020-04-08

- Sync with upstream
- Update container image to v3.1.0-beta.8

## [0.2.0] - 2020-03-12

- Update container image to v3.1.0-beta.7

## [0.1.6] - 2020-02-24

- Fix internal release process.

## [0.1.5] - 2020-02-11

## Added

- Use giantswarm docker image.

## [0.1.4] - 2020-02-06

### Added

- Bump version to v3.1.0-beta.5.
- Remove custom modifications.

### Fixed

- Fix internal release process.

## [0.1.3] - 2020-02-03

### Fixed

- Fix internal release process.

## [0.1.2] - 2020-02-03

### Fixed

- Fix internal release process.

## [0.1.1] - 2020-02-03

### Fixed

- Fix internal release process.

## [0.1.0] - 2020-01-30

### Added

- Add helm charts.
- Add script to sync upstream changes in the helm chart.

[Unreleased]: https://github.com/giantswarm/gatekeeper-app/compare/v1.1.2...HEAD
[1.1.2]: https://github.com/giantswarm/gatekeeper-app/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/giantswarm/gatekeeper-app/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/giantswarm/gatekeeper-app/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/giantswarm/gatekeeper-app/compare/v0.3.2...v1.0.0
[0.3.2]: https://github.com/giantswarm/gatekeeper-app/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/giantswarm/gatekeeper-app/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/giantswarm/gatekeeper-app/compare/v0.2.2...v0.3.0
[0.2.2]: https://github.com/giantswarm/gatekeeper-app/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/giantswarm/gatekeeper-app/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.6...v0.2.0
[0.1.6]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/giantswarm/gatekeeper-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/gatekeeper-app/tag/v0.1.0
