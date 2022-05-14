//
//  AddView.swift
//  47-HabitTracker
//
//  Created by Michael & Diana Pascucci on 5/9/22.
//

import SwiftUI

struct HabitAddView: View {
    
    // MARK: PROPERTIES
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(title: title, description: description)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

// MARK: PREVIEW
struct HabitAddView_Previews: PreviewProvider {
    static var previews: some View {
        HabitAddView(habits: Habits())
    }
}
