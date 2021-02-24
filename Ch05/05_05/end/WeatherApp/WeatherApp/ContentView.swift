//
//  ContentView.swift
//  WeatherApp
//
//  Copyright © 2021 Nyisztor, Karoly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Declare a property that represents the text entered by the user in the textfield
    @State private var input: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter location", text: $input)
                .font(.title)
            
            Divider()
            
            Text(input)
                .font(.body)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
