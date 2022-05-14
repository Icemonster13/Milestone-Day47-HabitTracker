//
//  Activity.swift
//  47-HabitTracker
//
//  Created by Michael & Diana Pascucci on 5/9/22.
//

import Foundation

struct HabitItem: Codable, Identifiable, Equatable {

    // MARK: PROPERTIES
    var id = UUID()
    let title: String
    let description: String
    var timesCompleted: Int = 0
    
    // MARK: METHODS
    static func == (lhs: HabitItem, rhs: HabitItem) -> Bool {
        return lhs.title == rhs.title
    }
}

final class Habits: ObservableObject {

    // MARK: PROPERTIES
    @Published var items = [HabitItem]() {  // Creates an array of 'HabitItem'
        
        didSet {
            if let encodedItems = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "Habits")
            }
        }
    }
    
    // MARK: INITIALIZER
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
