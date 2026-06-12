# Contributing to Flutter Portfolio V5

Thanks for your interest in improving this project.

## How you can help

- Report bugs.
- Suggest features.
- Improve documentation.
- Submit fixes or enhancements.

## Before you start

Please make sure you:

- Read the README.
- Follow the code style already used in the project.
- Check existing issues and pull requests before opening a new one.

## Development setup

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```
### Code style
# Keep widgets small and reusable.
# Prefer clear names over clever shortcuts.
# Match the existing folder structure.
# Avoid unrelated formatting changes in the same PR.
Testing
# Before submitting a pull request, run:
```bash
flutter analyze
flutter test
flutter build web --release --tree-shake-icons
```
## If your change affects deployment or hosting, verify the Firebase and Cloudflare output locally as well.
