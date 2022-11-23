//
//  ContentView.swift
//  TravelPackage
//
//  Created by Ahmad Syarifuddin Randiko on 23/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    @State private var isShowingBottomsheet = false
    
    var body: some View {
        ZStack {
            Image("bg-iphone")
                .resizable()
                .ignoresSafeArea()
            
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 0){
                    Button{
                        isShowingAlert.toggle()
                    } label: {
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .font(.system(size: 22))
                            .background{
                                Circle()
                                    .frame(width: 48, height: 48)
                                    .opacity(0.1)
                                    .foregroundColor(.black)
                            }
                    }.alert(isPresented: $isShowingAlert){
                        Alert(title: Text("Not yet available"), message: Text("Currently on active development"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                    Text("Travel")
                        .foregroundColor(.white)
                        .font(.system(size: 24, design: .rounded))
                        .padding(.vertical, 24)
                    Spacer()
                    Button{
                        isShowingBottomsheet.toggle()
                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .renderingMode(.original)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .background{
                                Circle()
                                    .frame(width: 48, height: 48)
                                    .opacity(0.1)
                                    .foregroundColor(.black)
                            }
                    }.sheet(isPresented: $isShowingBottomsheet) {
                        HStack{
                            Text("Pink Beach, Flores")
                                .foregroundColor(.black)
                                .font(.system(size: 24,weight: .bold, design: .rounded))
                            Spacer()
                            Image(systemName: "star.fill").renderingMode(.original).foregroundColor(.yellow)
                            Text("4.8")
                                .foregroundColor(.black)
                                .font(.system(size: 18,weight: .bold, design: .rounded))
                        }
                        .padding(.horizontal,16)
                        
                        HStack{
                            FacilityView(title: "Walk", iconColor: .green, icon: "figure.walk.motion")
                            FacilityView(title: "Food", iconColor: .orange, icon: "fork.knife.circle.fill")
                            FacilityView(title: "Stays", iconColor: .blue, icon: "house.fill")
                            FacilityView(title: "Ride", iconColor: .purple, icon: "sailboat.fill")
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        
                        
                        VStack(alignment: .leading, spacing: 0){
                            Text("About Destination")
                                .foregroundColor(.black)
                                .font(.system(size: 20,weight: .bold, design: .rounded))
                                .padding(.bottom, 8)
                            Text("Pink Beach, or Pantai Merah, as it aptly named, is one of seven pink beaches on the planet. This was awesome~")
                                .foregroundColor(.black)
                                .font(.system(size: 16,weight: .regular, design: .rounded))
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        
                        HStack{
                            Text("$81,39")
                                .foregroundColor(.blue)
                                .font(.system(size: 24,weight: .bold, design: .rounded))
                            Spacer()
                            Link(destination: URL(string: "https://www.google.com/maps?cid=11470303954556706768")! ){
                                HStack(alignment: .center) {
                                    Image(systemName: "bag")
                                        .font(.system(size: 22))
                                        .foregroundColor(.white)
                                    
                                    Text("Join Tour")
                                        .font(.system(size: 22, weight: .regular, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical,16)
                                .padding(.horizontal,24)
                                .background{
                                    LinearGradient(colors: [.purple,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                                }
                                .cornerRadius(30)
                            }
                            
                        }.padding(.horizontal, 16)
                        
                            .presentationDetents([.medium, .fraction(0.6)])
                    }
                } // - HStack
                .padding(.bottom, 24)
                
                Text("Start your\nadventure\nand go\ntravel now")
                    .font(.system(size: 40, weight: .bold, design: .rounded ))
                    .foregroundColor(.white)
                    .padding(.bottom, 16)
                
                Text("Discover local destinations beauty with Bluesky and travel with pride.")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                Spacer()
            } // - VStack
            .padding(.horizontal, 26)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FacilityView: View {
    var title: String
    var iconColor: Color
    var icon: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(iconColor)
            
            Text(title)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .foregroundColor(.black)
                .padding(.top,8)
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 60)
        .padding(.vertical,24)
        .background(.cyan.opacity(0.1))
        .cornerRadius(10)
    }
}
