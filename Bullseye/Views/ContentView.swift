//
//  ContentView.swift
//  Bullseye
//
//  Created by Nancy Hernandez Yanez on 19-04-23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisisble = false
  @State private var sliderValue = 50.0
  @State private var game: Game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionView(game: $game)
          .padding(.bottom, alertIsVisisble ? 0 : 100)
        if alertIsVisisble {
          PointsView(alertIsVisisble: $alertIsVisisble, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitmeButton(sliderValue: $sliderValue, alertIsVisisble: $alertIsVisisble, game: $game)
            .transition(.scale)
        }
      }
      if !alertIsVisisble {
        SliderView(sliderValue: $sliderValue)
          .zIndex(1)
          .transition(.scale)
      }
    }
  }
}

struct InstructionView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯 \nPut the Bullseye as close as you can to")
        .padding(.horizontal, 30)
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct HitmeButton: View {
  @Binding var sliderValue: Double
  @Binding var alertIsVisisble: Bool
  @Binding var game: Game
  
  var body: some View {
    Button("Hit me".uppercased()){
      withAnimation {
        alertIsVisisble = true
      }
    }
    .padding(20.0)
    .background(
      ZStack{
        Color("ButtonColor")
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        }
      )
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius)
        .strokeBorder(.white, lineWidth: Constants.General.strokeWidth)
    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundedCornerRadius)
    .bold()
    .font(.title3)

  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
      ContentView()
        .previewInterfaceOrientation(.landscapeRight)
        .preferredColorScheme(.dark)
    }
}
