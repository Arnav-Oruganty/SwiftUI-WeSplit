//
//  ContentView 2.swift
//  WeSplit
//
//  Created by Tanmay Dabhade on 12/29/24.
//


import SwiftUI

struct ButtonComp: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button(action: {
                showAlert = true
            }) {
                Text("Show Alert")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width - 20.0, height: 200, alignment: .center)
                    .padding()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Hello, SwiftUI!"),
                    message: Text("You just triggered an alert."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
    }
}

struct ButtonComp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComp()
    }
}
