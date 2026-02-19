import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Int = 0
    @State private var isAnimating: Bool = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    @State private var opacity: Double = 1.0
    @State private var currentColorIndex: Int = 0
    @Environment(\.colorScheme) var colorScheme

    // Color scheme support
    private let colorPalettes: [(light: (Color, Color), dark: (Color, Color))] = [
        // Blue gradient
        (light: (Color(red: 0.95, green: 0.97, blue: 1.0), Color(red: 0.85, green: 0.90, blue: 1.0)),
         dark: (Color(red: 0.1, green: 0.1, blue: 0.15), Color(red: 0.15, green: 0.15, blue: 0.25))),
        // Purple gradient
        (light: (Color(red: 0.98, green: 0.95, blue: 1.0), Color(red: 0.92, green: 0.88, blue: 1.0)),
         dark: (Color(red: 0.15, green: 0.1, blue: 0.2), Color(red: 0.2, green: 0.15, blue: 0.25))),
        // Green gradient
        (light: (Color(red: 0.95, green: 1.0, blue: 0.97), Color(red: 0.88, green: 0.98, blue: 0.92)),
         dark: (Color(red: 0.1, green: 0.15, blue: 0.12), Color(red: 0.12, green: 0.2, blue: 0.15))),
        // Pink gradient
        (light: (Color(red: 1.0, green: 0.95, blue: 0.98), Color(red: 1.0, green: 0.90, blue: 0.95)),
         dark: (Color(red: 0.2, green: 0.1, blue: 0.15), Color(red: 0.25, green: 0.12, blue: 0.18))),
        // Orange gradient
        (light: (Color(red: 1.0, green: 0.97, blue: 0.95), Color(red: 1.0, green: 0.93, blue: 0.88)),
         dark: (Color(red: 0.2, green: 0.15, blue: 0.1), Color(red: 0.25, green: 0.18, blue: 0.12))),
        // Cyan gradient
        (light: (Color(red: 0.95, green: 1.0, blue: 1.0), Color(red: 0.88, green: 0.97, blue: 0.98)),
         dark: (Color(red: 0.1, green: 0.15, blue: 0.18), Color(red: 0.12, green: 0.18, blue: 0.22)))
    ]

    private var primaryColor: Color {
        let colors: [Color] = [.blue, .purple, .green, .pink, .orange, .cyan]
        return colorScheme == .dark
            ? colors[currentColorIndex].opacity(0.9)
            : colors[currentColorIndex]
    }

    private var backgroundColor: (Color, Color) {
        let palette = colorPalettes[currentColorIndex]
        return colorScheme == .dark ? palette.dark : palette.light
    }

    private var cardColor: Color {
        colorScheme == .dark ? Color(red: 0.15, green: 0.15, blue: 0.2) : .white
    }

    var body: some View {
        ZStack {
            // Background with gradient
            LinearGradient(
                gradient: Gradient(colors: [backgroundColor.0, backgroundColor.1]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                // Title
                Text("Random Number Generator")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(primaryColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, 60)

                Spacer()

                // Number display card
                ZStack {
                    // Card background
                    RoundedRectangle(cornerRadius: 30)
                        .fill(cardColor)
                        .shadow(color: primaryColor.opacity(0.3), radius: 20, x: 0, y: 10)
                        .frame(width: 280, height: 280)

                    // Number
                    Text("\(currentNumber)")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundColor(primaryColor)
                        .scaleEffect(scale)
                        .rotationEffect(.degrees(rotation))
                        .opacity(opacity)
                }

                Spacer()

                // Generate button
                Button(action: generateRandomNumber) {
                    HStack(spacing: 12) {
                        Image(systemName: "dice.fill")
                            .font(.system(size: 24))
                        Text("Generate")
                            .font(.system(size: 22, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .frame(width: 220, height: 65)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [primaryColor, primaryColor.opacity(0.8)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(32.5)
                    .shadow(color: primaryColor.opacity(0.5), radius: 15, x: 0, y: 8)
                }
                .disabled(isAnimating)
                .scaleEffect(isAnimating ? 0.95 : 1.0)
                .padding(.bottom, 80)
            }
        }
    }

    private func generateRandomNumber() {
        guard !isAnimating else { return }

        isAnimating = true

        // Fun animation sequence
        withAnimation(.easeInOut(duration: 0.15)) {
            scale = 0.5
            opacity = 0.3
            rotation = -15
        }

        // Generate number after a brief delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            currentNumber = Int.random(in: 1...100)

            // Change to a random color
            let previousIndex = currentColorIndex
            repeat {
                currentColorIndex = Int.random(in: 0..<colorPalettes.count)
            } while currentColorIndex == previousIndex && colorPalettes.count > 1

            // Bounce back animation
            withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0)) {
                scale = 1.2
                opacity = 1.0
                rotation = 15
            }

            // Settle animation
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0).delay(0.2)) {
                scale = 1.0
                rotation = 0
            }

            // Add a celebratory pulse
            withAnimation(.easeInOut(duration: 0.3).delay(0.5)) {
                scale = 1.05
            }

            withAnimation(.easeInOut(duration: 0.2).delay(0.8)) {
                scale = 1.0
            }

            // Reset animation state
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isAnimating = false
            }
        }
    }
}

#Preview {
    ContentView()
}
