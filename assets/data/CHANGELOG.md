# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Notes

## [Unreleased]

## [1.4.0] - 2023-10-14

### Changed
- feat: firebase as new backend for questions
- feat: questions are subdivided into decks for different topics

## [1.3.2] - 2023-04-10

### Changed
- feat: adapt work in progress image.

## [1.3.1] - 2023-04-07

### Added
- content: new projects added.

### Changed
- feat: blog posts and projects are sorted by date.
- docs: link to version files updated.

## [1.3.0] - 2023-03-05

### Added
- feat: url strategy with working in-app links for removing hash.

## [1.2.0] - 2023-03-03

### Added
- Added learning page to side drawer.

### Changed
- Fix: Wrap link buttons at bottom of page to avoid overflows.
- Fix: Wrapping buttons in learning page.

## [1.1.1] - 2023-02-22

### Changed
- Fix: changed url strategy back since linking does not work.

## [1.1.0] - 2023-02-22

### Added
- Learning system
- Contact details
- Replaced projects with first actual entry.
- Replaced blogs with first actual entry.

### Changed
- Fix: assets involve images of the top level as well.
- Fix: emojis are not displayed accordingly.
- Removed hash from url.
- Some cosmetic changes.
- Removed placeholder.

## [1.0.1] - 2023-02-19

### Changed
- Fix: assets involve images of the top level as well.
- Fix: emojis are not displayed accordingly.

## [1.0.0] - 2023-02-19

### Changed
- Landing contains content.
- Actual experiences added.
- Preparations for serving the application using a custom domain.

## [0.1.0] - 2023-02-05

### Pull Requests
- [!3](https://github.com/Ronho/personal-website/pull/3): Remove search bar file.
- [!2](https://github.com/Ronho/personal-website/pull/2): Update version and changelog.
- [!1](https://github.com/Ronho/personal-website/pull/1): Remove old implementation of the search
bars.
- **Note**: Some changes have not been part of a pull request.

### Changed

- Search bar adapts to mobile.
- PWA title contains the name.
- Experiences are lazy loaded to reduce lags.
- New logo. (It's art, not trash!)
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

[unreleased]: https://github.com/Ronho/personal-website/compare/v1.4.0...HEAD
[1.4.0]: https://github.com/Ronho/personal-website/tree/v1.4.0
[1.3.2]: https://github.com/Ronho/personal-website/tree/v1.3.2
[1.3.1]: https://github.com/Ronho/personal-website/tree/v1.3.1
[1.3.0]: https://github.com/Ronho/personal-website/tree/v1.3.0
[1.2.0]: https://github.com/Ronho/personal-website/tree/v1.2.0
[1.1.1]: https://github.com/Ronho/personal-website/tree/v1.1.1
[1.1.0]: https://github.com/Ronho/personal-website/tree/v1.1.0
[1.0.1]: https://github.com/Ronho/personal-website/tree/v1.0.1
[1.0.0]: https://github.com/Ronho/personal-website/tree/v1.0.0
[0.1.0]: https://github.com/Ronho/personal-website/tree/v0.1.0
[0.0.1]: https://github.com/Ronho/personal-website/tree/v0.0.1