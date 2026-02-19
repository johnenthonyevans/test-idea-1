# Random Number Generator App - Setup Instructions

## Overview
This is a SwiftUI iOS app that generates random numbers with fun animations and supports both light and dark modes.

## Features
- ✨ Generates random numbers from 1 to 100
- 🎨 Beautiful animations when generating numbers
- 🌓 Full light and dark mode support
- 📱 Native iOS SwiftUI app

## Quick Start with Xcode

### Option 1: Create Project in Xcode (Recommended)

1. Open Xcode
2. Create a new iOS App project:
   - Product Name: `RandomNumberApp`
   - Interface: SwiftUI
   - Language: Swift
3. Replace the contents of `ContentView.swift` with the contents from `RandomNumberApp/ContentView.swift`
4. Replace the contents of `RandomNumberAppApp.swift` with the contents from `RandomNumberApp/RandomNumberAppApp.swift`
5. Run the app in the simulator or on a device

### Option 2: Use Command Line

Run the following command to create a proper Xcode project:

```bash
# Navigate to the project directory
cd <path-to-project>

# Create a new Xcode project using xcodegen or similar tool
# Or use the setup script:
./create_xcode_project.sh
```

## Project Structure

```
RandomNumberApp/
├── RandomNumberAppApp.swift    # App entry point
├── ContentView.swift            # Main view with random number generation and animations
└── Assets.xcassets/             # Asset catalog
    ├── AppIcon.appiconset/
    └── AccentColor.colorset/
```

## Code Highlights

### Random Number Generation
The app uses Swift's `Int.random(in:)` to generate numbers between 1 and 100.

### Animation Sequence
When you tap "Generate", the app performs a multi-stage animation:
1. **Shrink & Fade**: Number shrinks and fades (0.15s)
2. **Generate**: New random number is generated
3. **Spring Bounce**: Number bounces back with rotation (0.6s)
4. **Settle**: Animation settles to normal state (0.4s)
5. **Celebratory Pulse**: Small pulse effect (0.3s)

### Light/Dark Mode Support
The app automatically detects the system color scheme using:
```swift
@Environment(\.colorScheme) var colorScheme
```

Colors adapt based on the mode:
- **Light Mode**: Red gradient, white card, light background
- **Dark Mode**: Red gradient, dark card, darker background

## Testing

To test the app:
1. Build and run in Xcode
2. Tap the "Generate" button to see the animation
3. Toggle between light and dark mode in Settings > Developer > Dark Appearance
4. Verify the UI adapts to both modes correctly

## Requirements

- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+
