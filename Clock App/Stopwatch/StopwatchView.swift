//
//  ContentView.swift
//  Clock App
//
//  Created by me on 16/08/2023.
//

import SwiftUI

struct StopwatchView: View {
    
    @State private var time = 0.0
    @State private var isRuning = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(time, specifier: "%.1f")")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .padding()
            
            HStack {
                Button {
                    time = 0.0
                    isRuning = false
                } label: {
                    Circle()
                        .frame(width: 90 , height: 90)
                        .foregroundColor(.gray)
                        .overlay(
                        Text("Reset")
                            .foregroundColor(.white)
                            .bold()
                        )
                }
                .padding()
                Spacer()
                
                Button {
                    isRuning.toggle()
                } label: {
                    Circle()
                        .frame(width: 90 , height: 90)
                        .foregroundColor(isRuning ? .red : .green)
                        .overlay(
                            Text(isRuning ? "Stop" : "Start")
                            .foregroundColor(.white)
                            .bold()
                        )
                }
                .padding()
            }
            
        }
        .preferredColorScheme(.dark)
        .onReceive(timer, perform: { _ in
            if isRuning == true {
                time += 0.1
            }
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
