//
//  ReminderDetailView.swift
//  Reminders App
//
//  Created by Prathik Nekkanti on 3/9/26.
//

import SwiftUI

struct ReminderDetailView: View {
    // TODO: Fill in necessary bindings (Hint: you need 4)
    @State private var isEditing = false
    @Binding var reminder: Reminder
    @Binding var isPresented: Bool
    @Binding var page: RemindersPage
   
    var body: some View {
        VStack {
            // TODO: Recreate the view in the write-up video
            VStack(){
                Text(reminder.description)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                    .frame(height: 50)
                VStack(alignment: .leading, spacing: 5){
                    Text("Title & Description")
                        .font(.headline)
                        .foregroundColor(page.color)
                        .padding(.leading, 5)


                    VStack(spacing: 0){
                        HStack{
                            Text("Title")
                                .frame(width: 90, alignment: .leading)
                            
                            TextField("", text: $reminder.title)
                        }
                        .padding(10)
                        
                        Divider()
                            .padding(.leading)
                        
                        HStack{
                            Text("Description")
                                .frame(width: 90, alignment: .leading)
                            
                            TextField("", text: $reminder.description, axis: .vertical)
                        }
                        .padding(10)
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(15)
                }
                

                VStack(alignment: .leading, spacing: 5){
                    Text("Date")
                        .font(.headline)
                        .foregroundColor(page.color)
                        .padding(.leading, 5)
                    
                    HStack{
                        Text("Date")
                        DatePicker("", selection: $reminder.date)
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(15)
                }
            }
            .padding(.top, 175)
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground)).ignoresSafeArea()
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.title3)
                        .foregroundStyle(page.color)
                }
            }
        }
        // TODO: Add Toolbar for Todo Info
        .sheet(isPresented: $isEditing) {
            // We will add the EditSheet back in once we have our bindings!
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
        //TODO: Add NavigationTitle
        .navigationTitle(reminder.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var dummyReminder = Reminder(title: "Test Task", description: "Test Description", date: Date())
    @Previewable @State var dummyIsPresented = true
    @Previewable @State var dummyPage = RemindersPage(
        title: "To Do List",
        items: [],
        color: .blue 
    )
    
    NavigationStack {
        ReminderDetailView(
            reminder: $dummyReminder,
            isPresented: $dummyIsPresented,
            page: $dummyPage
        )
    }
}
