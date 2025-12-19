# Codemagic Build Instructions

## Quick Setup for Codemagic.io

### 1. Repository Setup
- Upload the `order_management_app` folder to your Git repository
- Ensure `codemagic.yaml` is in the root directory

### 2. Codemagic Configuration
- Connect your repository to Codemagic
- The build configuration will be automatically detected from `codemagic.yaml`

### 3. Build Options

#### Test Build (Recommended for first build)
- Workflow: `flutter-test-build`
- Builds APK without Firebase
- Faster build time
- Good for testing app functionality

#### Production Build
- Workflow: `flutter-production`
- Builds APK and AAB with Firebase
- Includes all features
- Ready for Play Store

### 4. Build Process
1. Select your repository in Codemagic
2. Choose the appropriate workflow
3. Start build
4. Download APK from artifacts when complete

### 5. Email Notifications
- Update email in `codemagic.yaml` to receive build notifications
- Change `developer@example.com` to your email

## Build Time
- Test build: ~10-15 minutes
- Production build: ~15-20 minutes