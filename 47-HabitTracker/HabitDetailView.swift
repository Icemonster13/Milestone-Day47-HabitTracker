//
//  ActivityView.swift
//  47-HabitTracker
//
//  Created by Michael & Diana Pascucci on 5/9/22.
//

import SwiftUI

struct HabitDetailView: View {
    
    // MARK: PROPERTIES
    @ObservedObject var habits: Habits
    var habitItem: HabitItem
    
    @State private var timesCompleted: Int = 0
    
    // MARK: BODY
    var body: some View {
        VStack {
            Spacer()
            Text("Description")
                .font(.title.bold())
            Text(habitItem.description)
                .frame(width: 300, height: 200, alignment: .center)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Spacer()
            Stepper("Completed times: \(timesCompleted)", value: $timesCompleted, in: 0...1000)
                .padding()
            Spacer()
        }
        .onAppear {
            self.timesCompleted = self.habitItem.timesCompleted
        }
        .onDisappear {
            if let index = self.habits.items.firstIndex(where: { $0 == self.habitItem }) {
                self.habits.items.remove(at: index)
                var tempHabit = self.habitItem
                tempHabit.timesCompleted = self.timesCompleted
                self.habits.items.insert(tempHabit, at: index)
            }
        }
    }
}

// MARK: PREVIEW
struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habits: Habits(), habitItem: HabitItem(title: "Title", description: "Description"))
    }
}
