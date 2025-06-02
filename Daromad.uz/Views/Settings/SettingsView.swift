//
//  SettingsView.swift
//  Daromad.uz
//
//  Created by Murodjon Turobov on 18/05/25.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var nameClient: String = "Murodjon Turobov"
    @State private var roleClient: String = "Client"
    @State private var isNotificationsEnabled: Bool = true
    @State private var selectedLanguage: Language = .uzbek
    @State private var showLanguagePicker: Bool = false
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(nameClient)
                                .font(.system(size: 18, weight: .semibold))
                            Text(roleClient)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                        }
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 12))
                    .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 0)
                    
                    Text("Main Settings")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, 24)
                    HStack {
                        Image("Bell_light")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Text("Notifications")
                        Spacer()
                        Toggle("", isOn: $isNotificationsEnabled)
                            .labelsHidden()
                        
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 12))
                    
                    HStack {
                        Image("User_alt_light")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Text("Log in as an Expert")
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 12))
                    
                    Text("Additional Settings")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, 24)
                    
                    VStack {
                       
                            HStack {
                                Image("globe_light")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                
                                Text("Language")
                                Spacer()
                                
                                Picker(selection: $selectedLanguage, label: Text(selectedLanguage.rawValue)) {
                                    ForEach(Language.allCases) { lang in
                                        Text(lang.rawValue).tag(lang)
                                    }
                                }
                                .labelsHidden()
                                .pickerStyle(.menu) // yoki .automatic
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 12))
                            
                      
                        
                        Divider().padding(.horizontal)
                        Button(action: {
                            print("Share tapped")
                        }) {
                            HStack {
                                
                                Image("group_share_light")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                Text("Share")
                                Spacer()
                                
                            }
                        }
                        .padding(14)
                        Divider().padding(.horizontal)
                        Button(action: {
                            print("Privacy tapped")
                        }) {
                            HStack {
                                
                                Image("Chield_check_light")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                Text("Privacy Policy")
                                    
                                Spacer()
                                
                            }
                        }
                        .padding(14)
                        Divider().padding(.horizontal)
                        Button(action: {
                            print("User Agreement tapped")
                        }) {
                            HStack {
                                
                                Image("External")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                Text("User Agreement")
                                Spacer()
                            }
                        }
                        .padding(14)
                    }
                        .foregroundColor(.primary)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 12))
        }
                
             
                HStack {
                    Image("Sign_out_squre_light")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.red)
                    
                    Text("Log Out")
                        .foregroundStyle(.red)
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 12))
                }
                .font(.system(size: 18))
                .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
                .background(Color(UIColor.systemGroupedBackground))
        
        
            }
    
           
        }
    

#Preview {
    NavigationStack {
        SettingsView()
    }
}
