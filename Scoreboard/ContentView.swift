//
//  ContentView.swift
//  Scoreboard
//
//  Created by Ryan Remaly on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var teams = Teams()
    
    
    var body: some View {
        
        VStack {
            AddTeam(teams: teams)
            TeamsView(teams: teams)
                .padding()
            
            HStack {
                Text("Text Size: ")
                Button(action: {
                    teams.size += 1
                }) {
                    if #available(macOS 11.0, *) {
                        Image(systemName: "plus.circle")
                    } else {
                        Text("Increase Text Size")
                    }
                }
                
                Button(action: {
                    teams.size -= 1
                }) {
                    if #available(macOS 11.0, *) {
                        Image(systemName: "minus.circle")
                    } else {
                        Text("Decrease Text Size")
                    }
                }
            }
            
            HStack {
                Text("Opacity: ")
                Button(action: {
                    teams.opacity += 0.05
                }) {
                    if #available(macOS 11.0, *) {
                        Image(systemName: "plus.circle.fill")
                    } else {
                        Text("Increase Opacity")
                    }
                }
                
                Button(action: {
                    teams.opacity -= 0.05
                }) {
                    if #available(macOS 11.0, *) {
                        Image(systemName: "minus.circle.fill")
                    } else {
                        Text("Decrease Opacity")
                    }
                }
            }
            
            
            
            Button(action: {openMyWindow(teams: teams)},
                   label: {if #available(macOS 11.0, *) {
                    Text("Add Window")
                   } else {
                    Text("Add Window")
                   }})
                .padding()
        }
        
        
    }
}

func openMyWindow(teams: Teams)
{
    var windowRef:NSWindow
    windowRef = NSWindow(
        contentRect: NSRect(x: 100, y: 100, width: 500, height: 500),
        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        backing: .buffered, defer: true)
    windowRef.makeKeyAndOrderFront(nil)
    windowRef.isReleasedWhenClosed = false
    windowRef.titleVisibility = .hidden
    windowRef.titlebarAppearsTransparent = true
    windowRef.styleMask.insert(.fullSizeContentView)
    windowRef.styleMask.remove(.closable)
    windowRef.styleMask.remove(.fullScreen)
    windowRef.styleMask.remove(.miniaturizable)
    windowRef.isOpaque = true
    windowRef.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0)
    windowRef.contentView = NSHostingView(rootView: WindowView(teams: teams))
    
}

struct WindowView: View

{
    
    @ObservedObject var teams : Teams
    
    
    
    
    var body: some View
    
    {
        
       
        ScrollView (.horizontal, showsIndicators: false) {
                HStack () {
                    if (teams.teams.count == 0) {
                        Text("No Teams added")
                    } else {
                        
                        ForEach(teams.teams ) { team in
                            
                            HStack {
                                
                                VStack {
                                    
                                    Text("\(team.name)").font(.custom("aAstroSpace", size: CGFloat(teams.size))).bold()
                                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                        .padding(10)
                                    
                                    Text("\(team.score)").font(.custom("aAstroSpace", size: CGFloat(teams.size))).bold()
                                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                                        .padding(2)
                                        .padding(.bottom)
                                }
                                .background(RoundedRectangle(cornerRadius: 16).fill(team.color).opacity(teams.opacity))
                                
                                
                                
                            }.animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                            
                            
                            
                        }
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 200, alignment: .top)
            }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
