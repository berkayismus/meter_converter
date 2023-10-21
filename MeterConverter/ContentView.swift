//
//  ContentView.swift
//  MeterConverter
//
//  Created by Berkay Çaylı on 13.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    
    let units = ["meter","kilometer","mil"]
    @State private var selectedInputUnit = ""
    
    @State private var selectedOutputUnit = ""
    @State private var result = 0.0
    
    @FocusState private var isFocused: Bool
    
  

    
    var inputValueInMeter : Double {
        if selectedInputUnit == "kilometer" {
           return input * 1000
        } else if selectedInputUnit == "mil" {
            return (input * 1.60) * 1000
        } else {
            return input
        }
        
    }
    
    var ouputValue : Double {
        if selectedOutputUnit == "kilometer" {
            return inputValueInMeter / 1000
        } else if selectedOutputUnit == "mil" {
            return inputValueInMeter / 1000 / 1.60
        } else {
            return inputValueInMeter
        }
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    TextField("Enter the value", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Select Input Unit",selection: $selectedInputUnit) {
                        ForEach(units,id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.navigationLink)
                    
                    
                }
                
                Section("Output") {
                    Picker("Select Output Unit",selection: $selectedOutputUnit) {
                        ForEach(units,id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    
             
                    Section("Result") {
                        Text(ouputValue, format: .number)

                    }
                }
                
            }.navigationTitle("MeterConverter")
                .toolbar {
                    if isFocused {
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
               
        }
        
  
        
   
    }
}

#Preview {
    ContentView()
}
