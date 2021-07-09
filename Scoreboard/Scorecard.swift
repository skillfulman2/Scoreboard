//
//  Scorecard.swift
//  Scoreboard
//
//  Created by Ryan Remaly on 5/30/21.
//

import SwiftUI

struct Scorecard: View {
    @State var score = 0
    @State var name = "Tenno Boys"
    @State var cardColor = Color(#colorLiteral(red: 1, green: 0.7720254064, blue: 0, alpha: 1))
    
    
    var body: some View {
        VStack {
            Text("\(self.name)").font(.custom("aAstroSpace", size: 20.0)).bold()
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .padding(10)
            
            Text("\(self.score)").font(.custom("aAstroSpace", size: 20.0)).bold()
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .padding(2)
                .padding(.bottom)
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(cardColor).opacity(0.2))
    }
}

struct Scorecard_Previews: PreviewProvider {
    static var previews: some View {
        Scorecard()
    }
}
