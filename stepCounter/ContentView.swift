//
//  ContentView.swift
//  stepCounter
//
//  Created by Pierre Juarez U. on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "figure.walk")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.green)
                .frame(width: 60, height: 60)
            Text("Steps Today")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            Text(viewModel.allMySteps)
                .font(.system(size: 40, weight: .bold, design: .rounded))
        }
        .padding(12)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
        )
        .task {
            viewModel.requestAccessToHealthData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
