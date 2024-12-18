//
//  UserModel.swift
//  MedicationReminderApp
//
//  Created by omayer on 18/12/24.
//

import Foundation

// Person struct is replaced with MedicationUser to reflect the user of medications
struct MedicationUser: Codable {
    let userId: String          // Unique user identifier
    let medications: [Medication]  // Array of medications assigned to the user
    
    // Generate samples
    static let allUsers: [MedicationUser] = Bundle.main.decode(file: "medication_json(1).json")
    static let sampleUser: MedicationUser = allUsers[0]
}

// Medication struct to reflect the medication data
struct Medication: Codable {
    let medicationId: String    // Unique identifier for each medication
    let medicationName: String  // Name of the medication (e.g., "Aspirin")
    let dosage: String          // Dosage (e.g., "500mg", "1 tablet")
    let amount: Int             // Number of doses or pills (e.g., 30 pills)
    let startDate: String       // Start date (in "YYYY-MM-DD" format)
    let frequency: String       // Frequency (e.g., "1 day", "2 days", "3 days")
    let time: String            // Time of day (e.g., "morning", "evening", etc.)
}

// Sample Address struct remains unchanged
struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

// PhoneNumber struct remains unchanged
struct PhoneNumber: Codable {
    let type, number: String
}

extension Bundle {
    // A generic decode method to load JSON data from the bundle
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
