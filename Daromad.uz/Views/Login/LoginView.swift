//
//  LoginView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 18/05/25.
//
//
//  ProfileBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 05/05/25.
//

import SwiftUI

struct LoginView: View {
    
 
    @State var phoneNumber = "93-555-33-22"
    @State private var user: User? = .mock

    
    var body: some View {
        List {
            Section {
                ZStack(alignment: .bottomTrailing) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.brown)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.primary, Color.accentColor)
                    }
                    .buttonStyle(.borderless)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(EmptyView())
                .frame(maxWidth: .infinity)
                .padding(.vertical)
            }
            
            Section {
                if let firstName = user?.firstName {
                    Text(firstName)
                        
                }
            } header: { Text("First Name") }
                
            
            Section {
                if let lastName = user?.lastName {
                    Text(lastName)
                }
            } header: { Text("Last Name") }
            
            Section {
                HStack(spacing: 12 ) {
                    Text("+998")
                    Divider()
                    if let phoneNumber = user?.phoneNumber {
                        TextField("Phone Number", text: $phoneNumber)
                            .keyboardType(.numberPad)
                            .textContentType(.telephoneNumber)
                    }
                }
                .padding(.horizontal)
                .listRowInsets(EdgeInsets())
                
            } header: {
                HStack() {
                    Text("Phone Number")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("update the Phone Number")
                            .font(.caption)
                            .foregroundStyle(.blue)
                        
                    }
                }
            }
            
            Section {
                Button("Delete Account") {
                    
                    
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.delete)
                
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(EmptyView())

            
            Section {
                Button("Save") {
                    
                    
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.large)
                
            }
            
            .listRowInsets(EdgeInsets())
            .listRowBackground(EmptyView())

        }
    }
}
#Preview {
    LoginView()
}

struct LargeButtonStyle: ButtonStyle {

    @Environment(\.isEnabled) var isEnabled
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18, weight: .semibold  ))
            .padding()
            .foregroundStyle(isEnabled ? (configuration.role == .destructive ? Color.red : Color.white) : Color(.tertiaryLabel))
            .frame(maxWidth: .infinity)
            .background{
                Group {
                    if isEnabled {
                        if configuration.isPressed {
                            RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
                        } else {
                            RoundedRectangle(cornerRadius: 12).fill(Color(.blue))
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
                    }
                }
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.bouncy, value: configuration.isPressed)

   }

}

struct DeleteButtonStyle: ButtonStyle {

    @Environment(\.isEnabled) var isEnabled
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .padding()
            .foregroundStyle(Color.red)
            .frame(maxWidth: .infinity)
            .background{
                Group {
                    if isEnabled {
                        if configuration.isPressed {
                            RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
                        } else {
                            RoundedRectangle(cornerRadius: 12).fill(Color(.white))
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
                    }
                }
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.bouncy, value: configuration.isPressed)

   }

}

extension ButtonStyle where Self == LargeButtonStyle {
    static var large: Self { LargeButtonStyle() }
    }
extension ButtonStyle where Self == DeleteButtonStyle {
    static var delete: Self { DeleteButtonStyle() }
    }


#Preview {
    LoginView()
}
