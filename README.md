# Flutter Portfolio V5

A modern Flutter web portfolio with a clean component-based structure, responsive sections, and CI/CD deployment support for Firebase Hosting and Cloudflare Pages.

## Features

- Flutter web frontend.
- Modular section-based layout.
- Reusable widgets and theming.
- Responsive design.
- Firebase Hosting deployment.
- Cloudflare Pages deployment.
- GitHub Actions CI/CD.

## Project structure

```text
lib/
├─ app_state.dart
├─ app_data.dart
├─ app_theme.dart
├─ widgets/
└─ sections/
assets/images/
web/index.html
public/_redirects
firebase.json
.firebaserc
.github/workflows/
```
## Requirements
# Flutter stable.
#Firebase CLI.
# Node.js.
# Git.
# Optional: Cloudflare Pages account.
# Local setup
 ```bash
$flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```
# Build for release
```bash
flutter build web --release --tree-shake-icons
```
# The production web output is generated in build/web.
# Firebase Hosting
  Firebase Hosting can serve your Flutter web app directly from the generated web output, and Firebase also supports a     Flutter framework-aware setup [web:45][web:42].
# Firebase setup
```bash
firebase experiments:enable webframeworks
firebase init hosting
```
# Deploy to Firebase
```bash
firebase deploy
```
# If you are using the CI workflow, the deployment can be handled automatically through GitHub Actions.
## Cloudflare Pages
 Cloudflare Pages can host the same Flutter web output as a static site, and _redirects is used for client-side routing   support [web:430][web:422][web:414].
# Build output
# .Build directory: build/web
# .Redirect file: public/_redirects
# Redirects file
```bash
/*    /index.html   200
```
# Deploy to Cloudflare Pages
  You can connect the repository to Cloudflare Pages and deploy the build/web output through your CI workflow or Pages   project settings.
 GitHub Actions
 This repository includes workflows for:
General CI checks.
Web build and deploy.
Android build.
iOS build.
Typical flow:
Run analysis and tests.
Build Flutter web.
Deploy to Firebase Hosting.
Deploy to Cloudflare Pages.
Secrets
Set these GitHub secrets as needed:
Firebase
FIREBASE_SERVICE_ACCOUNT
FIREBASE_PROJECT_ID
Cloudflare
CLOUDFLARE_API_TOKEN
CLOUDFLARE_ACCOUNT_ID
CLOUDFLARE_PAGES_PROJECT_NAME
Deployment order
Recommended release order:
# flutter analyze

 flutter test
flutter build web --release --tree-shake-icons
Deploy to Firebase Hosting
Deploy to Cloudflare Pages
Verify live site behavior
Notes
 
 # build/ is generated and should not be committed.
public/_redirects is required for Cloudflare SPA routing.
firebase.json controls Firebase Hosting behavior.
Keep all workflows in .github/workflows/.
