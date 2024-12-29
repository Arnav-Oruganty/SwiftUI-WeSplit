//
//  ContentView.swift
//  WeSplit
//
//  Created by Arnav Oruganty on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var check_amount = 0.0
    @State private var number_of_people = 2
    @State private var tip_percentage = 20
    @State private var showAlert = false
    @FocusState private var is_focused: Bool
    
    let tip_percentages = [5,10,15,20,25]
    
    var contri_per_person: Double{
        let people_count = Double(number_of_people) + 2
        let tip = Double(tip_percentage)
        
        let total_amount = check_amount + (check_amount)*tip/100
        let contri = total_amount / people_count
        
        return contri
    }
    
    var body: some View{
        NavigationStack{
            Form{
                Section ("Enter total expense incurred."){
                    TextField("Amount" , value: $check_amount , format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .keyboardType(.decimalPad)
                        .focused($is_focused)
                }
                //TODO: Use add users feature to count people to calculate payment per person
                Section ("How many people to split between?"){
                    HStack {
                        Spacer()
                        Text("\(number_of_people)")
                            .font(.system(size: 40, weight: .bold, design: .default))
                        Picker("", selection: $number_of_people){
                            ForEach(2..<101 , id: \.self){
                                Text("\($0)")
                            }
                        }
                        Spacer()
                    }
                }
                //TODO: Add users feature to add users from a pre existing saved list or add new users to seamlessly split payments.
                //Code Add users feature here, or use MVVM for ease.
                
                Section("How much tip do you want to leave?"){
                    VStack{
                        Spacer()
                        Text("\(tip_percentage)")
                            .font(.system(size: 40, weight: .bold, design: .default))
                        Picker("" , selection: $tip_percentage){
                            ForEach(tip_percentages , id: \.self){
                                Text("\($0)%")
                            }
                        }
                        .pickerStyle(.segmented)
                        Spacer()
                    }
                }
                
                Section ("Final contribution per person"){
                        Text(contri_per_person, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .font(.system(size: 60, weight: .bold, design: .default))
                }
                
                //TODO: Implement logic to send payments to added users, AFTER 'Add Users' functionality is added
                Section {
                    
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if is_focused{
                    Button("Split"){
                        is_focused = false
                    }
                }
            }
            Button(action: {
                showAlert = true
                
            }) {
                Text("Send Payemnt Request")
                    .font(.headline)
                    .foregroundColor(.white)         // Make text white
                    .frame(maxWidth: UIScreen.main.bounds.width - 100.0)      // Make the button expand horizontally
                    .padding()
                    .background(Color.black)         // Black background
                    .cornerRadius(10)               // Rounded edges
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Attention"),
                    message: Text("Payment request sent!"),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

