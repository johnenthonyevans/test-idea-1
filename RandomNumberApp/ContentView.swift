import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Int = Int.random(in: 1...100)
    @State private var isAnimating: Bool = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    @State private var opacity: Double = 1.0

    private var primaryColor: Color {
        Color(red: 0.9, green: 0.2, blue: 0.2).opacity(0.9)
    }

    private var backgroundColor: (Color, Color) {
        (Color(red: 0.15, green: 0.1, blue: 0.1), Color(red: 0.2, green: 0.12, blue: 0.12))
    }

    private var cardColor: Color {
        Color(red: 0.15, green: 0.15, blue: 0.2)
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
                    VStack(spacing: 8) {
                        Image(systemName: "dice.fill")
                            .font(.system(size: 32))
                        Text("Generate")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [primaryColor, primaryColor.opacity(0.8)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(30)
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
