//
//  ContentView.swift
//  SwiftUI Dice app
//
//  Created by Gustavo Lozano on 08/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let diceImagesNames = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    @State var firstDiceImage = "DiceThree"
    @State var secondDiceImage = "DiceFour"
    
    var body: some View {
        ZStack {
            Image("GreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("DiceeLogo")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                HStack {
                    DiceView(imageName: firstDiceImage)
                    DiceView(imageName: secondDiceImage)
                }
            
                Spacer()
                
                Button(action: {
                    self.firstDiceImage = self.diceImagesNames.randomElement() ?? "DiceOne"
                    self.secondDiceImage = self.diceImagesNames.randomElement() ?? "DiceOne"
                }) {
                    Text("Roll dices")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 30))
                }
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: 40)
                        .foregroundColor(.red)
                )
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName).resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
