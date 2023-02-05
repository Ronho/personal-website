# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Notes

## [Unreleased]

## [0.1.0] - 2023-02-05

**Pull Requests:** #1, #2

### Changed

- Search bar adapts to mobile.
- PWA title contains the name.
- Experiences are lazy loaded to reduce lags.
- New logo.
- Language drop down does not show underline on mobile.
- Use `SearchDelegate` instead of own search bar widget.

## [0.0.1] - 2023-01-18

### Added

- Initialization of the CHANGELOG.md.

### Changed

- Footer does not fill remaining space.
- Max 9 elements are returned by search.
- Searchbar extends over full screen on small screen sizes and is now represented by a button.
- Search bar does not update state.
- Add locale button to side drawer on small screens.
- Search bar retrieves focus automatically.
- Blog posts now contain bodyReference instead of body. bodyReference references md file inside the
`assets/data/blogs/` directory.

[unreleased]: https://github.com/Ronho/personal-website/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/Ronho/personal-website/tree/v0.1.0
[0.0.1]: https://github.com/Ronho/personal-website/tree/v0.0.1
