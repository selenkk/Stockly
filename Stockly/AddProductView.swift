import SwiftUI

struct AddProductView: View {
    
    @State private var productURL = ""
    @State private var selectedSize = "S"
    
    @Environment(\.dismiss) private var dismiss
    
    let sizes = ["XS", "S", "M", "L", "XL"]
    
    let onAdd: (Product) -> Void
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [
                    Color(red: 0.98, green: 0.95, blue: 0.97),
                    Color(red: 0.94, green: 0.91, blue: 0.98)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 25) {
                
                Text("Ürün Ekle")
                    .font(.system(size: 32, weight: .bold))
                
                Text("Takip etmek istediğin ürünün linkini ekle.")
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Ürün Linki")
                        .font(.headline)
                    
                    TextField("https://...", text: $productURL)
                        .textFieldStyle(.plain)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Beden")
                        .font(.headline)
                    
                    HStack(spacing: 10) {
                        
                        ForEach(sizes, id: \.self) { size in
                            
                            Button {
                                selectedSize = size
                            } label: {
                                Text(size)
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(
                                        selectedSize == size
                                        ? Color.purple
                                        : Color.white
                                    )
                                    .foregroundStyle(
                                        selectedSize == size
                                        ? .white
                                        : .primary
                                    )
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 12)
                                    )
                            }
                        }
                    }
                }
                
                Button {
                    
                    let newProduct = Product(
                        url: productURL,
                        size: selectedSize
                    )
                    
                    onAdd(newProduct)
                    dismiss()
                    
                } label: {
                    Text("Takibe Başla")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                }
                
                Spacer()
            }
            .padding(30)
        }
        .navigationTitle("Ürün Ekle")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddProductView { product in
            print(product.url)
        }
    }
}
