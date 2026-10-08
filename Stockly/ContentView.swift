import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
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
                    
                    // Logo
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 90, height: 90)
                        
                        Image(systemName: "bag.fill")
                            .font(.system(size: 38))
                            .foregroundStyle(.purple)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Stockly")
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("Sevdiğin ürünleri kaçırma.")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(spacing: 15) {
                        
                        TextField("E-posta", text: $email)
                            .textFieldStyle(.plain)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        SecureField("Şifre", text: $password)
                            .textFieldStyle(.plain)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        NavigationLink {
                            HomeView()
                        } label: {
                            Text("Giriş Yap")
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
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        
                        Button {
                            // Kayıt ekranını daha sonra yapacağız.
                        } label: {
                            Text("Hesabın yok mu? Kayıt ol")
                                .font(.system(size: 14))
                                .foregroundStyle(.purple)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    Text("Stockly • Ürünlerini takip et")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 15)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
