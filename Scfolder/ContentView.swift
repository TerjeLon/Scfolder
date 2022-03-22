//
//  ContentView.swift
//  Scfolder
//
//  Created by Terje Lønøy on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var quoteOpacity: Double = 1
    @State var quote: String = "I think a SCELTOer is an individual who finds strength to persevere and endure in spite of overwhelming obstacles 🧐" ?? FallbackQuote
    
    var body: some View {
        VStack {
            Image("scelto")
            
            VStack {
                Text(quote)
                    .opacity(quoteOpacity)
                    .font(Font.title.weight(.bold))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(minHeight: 50)
            .padding(.top, 50)
            
            Text("Hvordan legge til Scfolders?")
                .font(Font.largeTitle.weight(.heavy))
                .padding(.top, 30)
            
            VStack(alignment: .leading) {
                Text("1. Åpne System Preferences")
                Text("2. Åpne Extensions")
                Text("3. Skru på Scfolder under Finder Extensions")
                Text("4. Høyreklikk en folder -> Sceltofy 🎉")
            }
            .padding(.top, 10)
        }
        .frame(minWidth: 500)
        .padding(20)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { _ in
                withAnimation(.easeOut(duration: 0.3)) {
                    quoteOpacity = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    quote = SceltoQuotes.randomElement() ?? FallbackQuote
                    
                    withAnimation(.easeIn(duration: 0.3)) {
                        quoteOpacity = 1
                    }
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
