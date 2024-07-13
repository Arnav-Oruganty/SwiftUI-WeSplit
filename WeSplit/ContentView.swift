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
                Section{
                    TextField("Amount" , value: $check_amount , format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($is_focused)
                    
                    Picker("Number of People" , selection: $number_of_people){
                        ForEach(2..<101){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?"){
                    Picker("Tip Percentage" , selection: $tip_percentage){
                        ForEach(tip_percentages , id: \.self){
                            Text("\($0)%")
                        }
                    }
                }
                
                Section{
                    Text(contri_per_person, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if is_focused{
                    Button("Done"){
                        is_focused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

