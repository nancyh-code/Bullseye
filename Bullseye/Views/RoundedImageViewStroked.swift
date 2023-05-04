//
//  RoundedView.swift
//  Bullseye
//
//  Created by Nancy Hernandez Yanez on 20-04-23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
    
  }
}

struct RoundedRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius)
            .stroke(lineWidth: Constants.General.strokeWidth)
            .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}

struct RoundedTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .font(.title3)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
      .overlay(
        Circle()
          .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewStroked(systemName: "list.dash")
      RoundedRectTextView(text: "100")
      RoundedTextView(text: "1")
    }
  }
}


struct RoundedImageViewStroke_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView().preferredColorScheme(.dark)
  }
}
