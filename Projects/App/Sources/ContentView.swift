import SwiftUI
import FeatureA
import FeatureB

struct ContentView: View {
    @State private var inputValue: Int = 4
    @State private var userName: String = "Tuist User"

    private let featureA = FeatureAService()
    private let featureB = FeatureBService()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Selective Testing Sample")
                    .font(.title)
                    .padding()

                // FeatureA Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Feature A")
                        .font(.headline)

                    TextField("Enter name", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Text(featureA.greetUser(userName))
                        .padding()

                    Text(featureA.processData(inputValue))
                        .padding()
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)

                // FeatureB Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Feature B")
                        .font(.headline)

                    Stepper("Value: \(inputValue)", value: $inputValue, in: 1...100)
                        .padding(.horizontal)

                    Text(featureB.calculate(inputValue, 3))
                        .padding()

                    Text(featureB.welcomeMessage(for: userName))
                        .padding()
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)

                Spacer()
            }
            .padding()
            .navigationBarTitle("Selective Testing", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
