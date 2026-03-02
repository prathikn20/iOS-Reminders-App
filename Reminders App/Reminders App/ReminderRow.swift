//
//  ReminderRow.swift
//  
//
//  Created by Prathik Nekkanti on 3/1/26.
//

import SwiftUI

struct RemReminderRow: View {
    @Binding var reminder: Reminder
    var themeColor: Color
    
    var body: some View {
        HStack{
            Button{
                reminder.isCompleted.toggle()
            } label: {
                (reminder.isCompleted ? Image(systemName : "circle.fill") : Image(systemName : "circle"))
                    .foregroundColor(themeColor)
            }
            .font(.title2)
            TextField("", text: $reminder.title)
                .foregroundColor(!reminder.isCompleted ? .black : .black.opacity(0.5))
        }
    }
}
