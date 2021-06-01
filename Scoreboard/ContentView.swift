//
//  ContentView.swift
//  Scoreboard
//
//  Created by Ryan Remaly on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Scorecard(score: 9, name: "Tenno Boys", cardColor: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
            Scorecard(score: 6, name: "Fryman", cardColor: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
            Scorecard(score: 5, name: "Buttery", cardColor: Color(#colorLiteral(red: 0.9226120114, green: 0, blue: 0.05532784015, alpha: 1)))
            Scorecard(score: 4, name: "Bender", cardColor: Color(#colorLiteral(red: 0, green: 0.8588615656, blue: 0, alpha: 1)))
            Scorecard(score: 1, name: "Slippin Jimmy Bruh", cardColor: Color(#colorLiteral(red: 0.9226154685, green: 0, blue: 0.7671498656, alpha: 1)))
            Scorecard(score: 1, name: "Heat Squad", cardColor: Color(#colorLiteral(red: 0, green: 0.8357515931, blue: 0.5778161883, alpha: 1)))
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
