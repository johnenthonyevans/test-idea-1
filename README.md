# Random Number Generator - iOS App

A beautiful iOS mobile app that generates random numbers with fun animations and automatic light/dark mode support!

## Features

- 🎲 **Random Number Generation**: Generates random numbers from 1 to 100
- ✨ **Fun Animations**: Multi-stage animation sequence including shrink, bounce, rotate, and pulse effects
- 🌓 **Dark Mode**: Always-on dark mode with red accent theme
- 🎨 **Beautiful UI**: Modern SwiftUI design with square elements, gradients, shadows, and smooth transitions
- 📱 **Native iOS**: Built with SwiftUI for optimal performance and native feel

## Design

### Square Photo Aesthetic
- All interactive elements use square dimensions for visual consistency
- 280x280 number display card
- 150x150 generate button
- Clean, geometric design with red accent theme
- Dark mode optimized for comfortable viewing

## Getting Started

See [SETUP.md](SETUP.md) for detailed setup instructions.

### Quick Start

1. Open Xcode
2. Create a new iOS App project (SwiftUI)
3. Copy the Swift files from `RandomNumberApp/` directory:
   - `RandomNumberAppApp.swift`
   - `ContentView.swift`
4. Run the app!

## How It Works

### Animation Sequence
When you tap the "Generate" button:
1. Current number shrinks and fades out (0.15s)
2. New random number is generated
3. Number springs back with a bounce and rotation (0.6s)
4. Settles into final position (0.4s)
5. Celebratory pulse animation (0.3s)

### Color Scheme
The app features a dark mode design with red accents:
- Always-on dark mode using `.preferredColorScheme(.dark)`
- Primary color: Red (RGB: 0.9, 0.2, 0.2)
- Background: Dark gradient
- Card: Dark gray theme
- Square button and display elements for geometric consistency

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Project Structure

```
RandomNumberApp/
├── RandomNumberAppApp.swift     # App entry point (@main)
├── ContentView.swift             # Main view with number display and generation logic
└── Assets.xcassets/              # Asset catalog
    ├── AppIcon.appiconset/       # App icon
    └── AccentColor.colorset/     # Accent color
```

## Technical Details

### State Management
- Uses `@State` for reactive UI updates
- Manages animation state to prevent overlapping animations
- Tracks current number, scale, rotation, and opacity

### Animation
- Spring animations for natural bounce effect
- Easing animations for smooth transitions
- Chained animations with delays for sequence

### Theming
- Environment-based color scheme detection
- Computed properties for adaptive colors
- Gradient backgrounds and shadows

## Future Enhancements

Potential features to add:
- [ ] Custom number range selection
- [ ] History of generated numbers
- [ ] Multiple animation styles
- [ ] Sound effects
- [ ] Share generated numbers
- [ ] Widget support

## License

MIT License - feel free to use and modify!

---

**Enjoy generating random numbers with style!** 🎲✨
