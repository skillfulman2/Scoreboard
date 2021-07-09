//
//  AddTeam.swift
//  ScoreboardClient
//
//  Created by Ryan Remaly on 6/2/21.
//

import SwiftUI

struct Team: Identifiable {
    
    let id = UUID()
    var name: String
    var color: Color
    var score: Int
    
    init(name: String, color: Color, score: Int) {
        self.name = name
        self.color = color
        self.score = score
    }
    
}


class Teams: ObservableObject {
    @Published var teams = [Team]()
    @Published var size = 30.0
    @Published var opacity = 0.8
    
    
    func addTeam(team: Team) {
        teams.append(team)
        
    }
}

struct TeamsView: View {
    @StateObject var teams = Teams()
    
    
    var body: some View {
        ScrollView (.horizontal) {
        HStack {
            if (teams.teams.count == 0) {
                Text("No Teams added")
            } else {
                
                ForEach(teams.teams ) { team in
                    
                    VStack {
                        VStack {
                            
                            Text("\(team.name)").font(.custom("Stargaze-Stencil", size: 20.0)).bold()
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                .padding(10)
                            
                            Text("\(team.score)").font(.custom("Stargaze-Stencil", size: 20.0)).bold()
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                .padding(2)
                                .padding(.bottom)
                        }
                        .background(RoundedRectangle(cornerRadius: 16).fill(team.color).opacity(0.6))
                        
                        
                        VStack {
                            Button(action: {
                                //self.teams.teams.
                                var count = 0
                                teams.teams.forEach({ other in
                                    if (other.name == team.name) {
                                        self.teams.teams[count].score += 1
                                        teams.teams.sort { team, team2 in
                                            return team.score > team2.score
                                        }
                                    }
                                    count += 1
                                })
                                
                            }) {
                                Text("Add Point")//.background(RoundedRectangle(cornerRadius: 16).fill(team.color).opacity(0.6))
                            }
                            
                        }
                        
                        VStack {
                            Button(action: {
                                //self.teams.teams.
                                var count = 0
                                teams.teams.forEach({ other in
                                    if (other.name == team.name) {
                                        self.teams.teams[count].score -= 1
                                        teams.teams.sort { team, team2 in
                                            return team.score > team2.score
                                        }
                                    }
                                    count += 1
                                })
                                
                            }) {
                                Text("Remove Point")
                            }
                            
                        }
                        
                        VStack {
                            Button(action: {
                                var count = 0
                                teams.teams.forEach({ other in
                                    if (other.name == team.name) {
                                        self.teams.teams.remove(at: count)
                                        teams.teams.sort { team, team2 in
                                            return team.score > team2.score
                                            
                                        }
                                        return
                                    }
                                    count += 1
                                })
                                
                            }) {
                                Text("Delete Team")
                            }
                        }
                    }
                    
                    
                }.animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
            }
        }
            
        }
        
        
    }
}



struct AddTeam: View {
    @ObservedObject var teams: Teams
    @State var name: String = ""
    @State var color: Color = Color.blue
    
    
    var body: some View {
        VStack {
            TextField("Team Name ", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            if #available(macOS 11.0, *) {
                ColorPicker("Team Color ", selection: $color).padding()
            } else {
                // Fallback on earlier versions
            }
            Button(action: {
                teams.addTeam(team: Team(name: name, color: color, score: 0))
                name = ""
            }) {
                Text("Add Team").foregroundColor(.white)
                
            }
            
        }
        
        
        
    }
}
