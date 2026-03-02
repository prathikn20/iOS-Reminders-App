import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(title: "To Do List", items: [Reminder(title: "Get groceries"), Reminder(title: "Complete App Team Assignment"), Reminder(title: "Do my Homework 😭")], color: Color.blue.opacity(0.4))
    
    var body: some View {
        VStack {
            HStack{
                Text(page.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundStyle(page.color)
                    .cornerRadius(10)
                Spacer()
                Button{
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.largeTitle)
                        .foregroundColor(page.color)
                }
                .padding(15)
            }
            List {
                ForEach($page.items) { $reminder in
                    RemReminderRow(reminder: $reminder, themeColor: page.color)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            Button{
                page.items.append(Reminder(title: ""))
            } label: {
                HStack(){
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(page.color)
                }
                .padding(20)
            }

        }
        .sheet(isPresented: $isEditing) {
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

#Preview {
    ContentView()
}

