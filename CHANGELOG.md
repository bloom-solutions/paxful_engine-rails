# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.1.1]
### Changed
- Update `paxful_client` to 1.2

## [1.1.0]
### Changed
- Fetch completed trades until the last trade it gets is a fresh one.

## [1.0.0]
### Added
- Update `paxful_client` to 1.0

## [0.9.1]
### Fixed
- Format datetime to use local timezone

## [0.9.0]
### Changed
- Added `fiat` and `crypto` amounts to index view
- Removed `buyer` and `seller` from index view
- Show readable BTC format

## [0.8.1]
### Fixed
- Fix typo

## [0.8.0]
### Changed
- Show completed trades on `/paxful_engine/trades` by default with option
to include non-successful ones.

## [0.7.0]
### Added
- Show `completed_at` date of a paxful trade
- Sort by both `completed_at` and `created_at`

## [0.6.0]
### Changed
- Use `factory_bot_rails`
- Allow host app to use defined factory

## [0.5.0]
### Added
- Install factory_bot
- Add convenience methods on `PaxfulEngine::Trade`

## [0.4.0]
### Added
- Add `on_failure_callback` that runs when a trade cannot be created

## [0.3.1]
### Fixed
- Apply status highlight in `trades#show`

## [0.3.0]
### Added
- Highlight status of trade (green if successful; red otherwise)
- Add message if no trades were found

## [0.2.0]
### Added
- Add route to show list of trades `/trades`
- Add route to show detail per trade `/trades/:id`

## [0.1.0]
- Initial commit
- Rename gem from `paxful_rails` to `paxful_engine-rails`
