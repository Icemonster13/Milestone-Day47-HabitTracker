//
//  ContentView.swift
//  47-HabitTracker
//
//  Created by Michael & Diana Pascucci on 5/9/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: PROPERTIES
    @StateObject var habits = Habits()  // Creates a new instance of the class 'Habits'
    @State private var showingAddView = false
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink(destination: HabitDetailView(habits: self.habits, habitItem: item)) {
                        Text(item.title)
                            .font(.headline)
                        Spacer()
                        Text("\(item.timesCompleted)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    // let habit = HabitItem(title: "Test", description: "Test Text")
                    // habits.items.append(habit)
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                HabitAddView(habits: habits)
            }
        }
        
    }
    
    // MARK: METHODS
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
