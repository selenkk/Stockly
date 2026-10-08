import SwiftUI

struct HomeView: View {
    
    @State private var products: [Product] = []
    
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
            
            VStack(spacing: 25) {
                
                Spacer()
                
                Image(systemName: "bag.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.purple)
                
                Text("Hoş geldin! 💜")
                    .font(.system(size: 30, weight: .bold))
                
                Text("Takip etmek istediğin ürünleri\nburadan ekleyebilirsin.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                NavigationLink {
                    AddProductView { product in
                        products.append(product)
                    }
                } label: {
                    Text("Ürün Ekle")
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
                
                NavigationLink {
                    TrackingView(products: products)
                } label: {
                    Text("Takip Ettiklerim")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.purple)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                }
                
                Spacer()
            }
            .padding(30)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
