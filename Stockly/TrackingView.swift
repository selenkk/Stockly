import SwiftUI

struct TrackingView: View {
    
    @Binding var products: [Product]
    
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
            
            if products.isEmpty {
                
                VStack(spacing: 20) {
                    
                    Image(systemName: "bell.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.purple)
                    
                    Text("Takip Edilen Ürünler")
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("Henüz takip ettiğin bir ürün yok.")
                        .foregroundStyle(.secondary)
                }
                .padding()
                
            } else {
                
                ScrollView {
                    
                    VStack(spacing: 15) {
                        
                        ForEach(products) { product in
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                HStack {
                                    
                                    Image(systemName: "bag.fill")
                                        .font(.system(size: 25))
                                        .foregroundStyle(.purple)
                                    
                                    Text("Takip Edilen Ürün")
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Button {
                                        products.removeAll { item in
                                            item.id == product.id
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                            .foregroundStyle(.red)
                                    }
                                }
                                
                                Divider()
                                
                                Text(product.url)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                                
                                HStack {
                                    
                                    Text("Beden")
                                        .foregroundStyle(.secondary)
                                    
                                    Spacer()
                                    
                                    Text(product.size)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(.purple)
                                }
                                
                                Text("Stok bekleniyor...")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(20)
                            .background(Color.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20)
                            )
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("Takip Ettiklerim")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TrackingView(products: .constant([]))
    }
}
