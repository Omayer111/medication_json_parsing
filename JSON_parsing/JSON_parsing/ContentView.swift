import SwiftUI

// Main ContentView to display the list of medications
struct ContentView: View {
    // Use the MedicationUser array to get the users and their medications
    private var users: [MedicationUser] = MedicationUser.allUsers
    
    var body: some View {
        NavigationView {
            List {
                // Loop through each user and display their medications
                ForEach(users, id: \.userId) { user in
                    Section(header: Text("User: \(user.userId)")) {
                        // For each medication, display the medication name in a NavigationLink
                        ForEach(user.medications, id: \.medicationId) { medication in
                            NavigationLink(
                                destination: MedicationDetailView(medication: medication)
                            ) {
                                Text(medication.medicationName) // Display medication name
                                    .font(.headline)
                                    .padding(.vertical, 5)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Medications", displayMode: .large)
        }
    }
}

// Detailed view for each medication
struct MedicationDetailView: View {
    // The selected medication object passed from ContentView
    var medication: Medication
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Medication Name
            Text("Medication Name: \(medication.medicationName)")
                .font(.title)
            
            // Dosage
            Text("Dosage: \(medication.dosage)")
                .font(.body)
            
            // Amount
            Text("Amount: \(medication.amount) pills")
                .font(.body)
            
            // Start Date
            Text("Start Date: \(medication.startDate)")
                .font(.body)
            
            // Frequency
            Text("Frequency: Every \(medication.frequency)")
                .font(.body)
            
            // Time of day when medication should be taken
            Text("Time: \(medication.time)")
                .font(.body)
            
            Spacer() // Push content to the top of the screen
        }
        .padding()
        .navigationBarTitle("Medication Details", displayMode: .inline) // Title for the detail view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
