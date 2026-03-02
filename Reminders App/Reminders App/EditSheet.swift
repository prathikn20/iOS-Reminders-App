import SwiftUI

struct EditSheet: View {
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStack(){
                Image(systemName: "list.bullet.circle.fill")
                    .font(.system(size: 100, weight: .bold, design: .default))
                    .foregroundColor(selectedColor)
                    .padding()
                
                TextField("List Name", text: $title,)
                    .font(.system(size: 25, design: .default))
                    .foregroundColor(selectedColor)
                    .padding()
                    .background(Color((UIColor.secondarySystemBackground)).opacity(0.2))
                    .cornerRadius(10)
                    .padding()
                
            }
            .padding()
            .background(Color((UIColor.secondarySystemBackground)).opacity(0.1))
            .cornerRadius(15)
            
            VStack(){
                ColorChooser(selectedColor: $selectedColor)
            }
            .frame(width: 360, height: 200)
            .background(Color((UIColor.secondarySystemBackground)).opacity(0.1))
            .cornerRadius(15)
            
            Spacer()

        }
        .padding()
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    @Previewable @State var title: String = "Title"
    
    EditSheet(title: $title, selectedColor: $selectedColor)
        .preferredColorScheme(.dark)
}
