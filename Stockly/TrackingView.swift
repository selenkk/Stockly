import SwiftUI

struct TrackingView: View {
    
    let products: [Product]
    
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
                
                List(products) { product in
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(product.url)
                            .font(.headline)
                        
                        Text("Beden: \(product.size)")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle("Takip Ettiklerim")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TrackingView(products: [])
    }
}
