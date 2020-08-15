//
//  ContentView.swift
//  joey1
//
//  Created by Benny Pollak on 5/16/20.
//  Copyright © 2020 Alben Software. All rights reserved.
//

import SwiftUI

struct RandNumView: View {
    var txt: Int? = 0
    @State var lower = "0"
    @State var upper = "10"
    @State var toggler = false
    @State var experiment: String = ""
    @State var text: String = "?"
    
    var body: some View {
        VStack {
            Group {
                TextField("Enter Here ", text: self.$lower)
                .padding([.top, .leading], 20.0)
                Text("Lower Bound is: \(lower)")
                    .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                TextField("Enter Here ", text: self.$upper)
                .padding([.top, .leading], CGFloat(20.0))
                Text("Upper Bound is: \(upper)")
                    .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                Button(action: {
                    if self.lower > self.upper {
                        self.text = "Invalid Bounds"
                    } else {
                        self.text = (String(Int.random(in: (Int(self.lower) ?? 0)-1..<(Int(self.upper) ?? 10))+1))
                    }
                })
                {
                    Text("Tap to Generate")
                        .frame(width: CGFloat(250))
                        .foregroundColor(Color.green)
                        .padding(.vertical, CGFloat(40.0))}
            }
            
            Group {
                Text(self.text)
                    .font(Font.system(size: 70.0))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.red)
                    .lineLimit(50)
                    .padding(.top, 100.0)
            }
        }
        
    }
}

struct DetailView: View {
    let title: String
    var body: some View {
        Text("This is the title: \(title)")
    }
}
struct ContentView: View {
    @State var selection : Int? = nil
    @State var number : Int = 0
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: RandNumView(txt: self.selection), tag: 1, selection: self.$selection) {
//                NavigationLink(destination: DetailView(title: "New Screen 1"), tag: 1, selection: self.$selection) {
                    Text("")
                }
                NavigationLink(destination: DetailView(title: "New Screen 2"), tag: 2, selection: self.$selection) {
                    Text("")
                }
                Button("Button 1"){
//                    self.number += 1
                    self.selection = 1
                }
                Button("Button 2"){
                    self.selection = 2
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
