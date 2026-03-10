import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(
        title: "To Do List",
        items: [
            Reminder(title: "Get groceries", description: "", date: Date()),
            Reminder(title: "Complete App Team Assignment", description: "", date: Date()),
            Reminder(title: "Do my Homework 😭", description: "", date: Date())
        ],
        color: Color.blue.opacity(0.4)
    )
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text(page.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(page.color)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                List {
                    ForEach($page.items) { $reminder in
                        NavigationLink {
                                ReminderDetailView(reminder: $reminder, isPresented: $isEditing, page: $page)
                        } label: {
                            HStack {
                                RemReminderRow(reminder: $reminder, themeColor: page.color)
                                Spacer()
                                if reminder.isCompleted {
                                    Text("Completed")
                                        .foregroundStyle(.secondary)
                                } else {
                                    Text(reminder.date, style: .relative)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        
                    }
                    .onDelete { indexSet in
                        page.items.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
            }
            
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
            
            .overlay(alignment: .bottomTrailing) {
                Button {
                    page.items.append(Reminder(title: "", description: "", date: Date()))
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(page.color)
                        .background(Circle().fill(Color.white))
                }
                .padding(20)
            }
            
            .sheet(isPresented: $isEditing) {
                EditSheet(title: $page.title, selectedColor: $page.color)
            }
        }
    }
}
    
    #Preview {
        ContentView()
    }
    
