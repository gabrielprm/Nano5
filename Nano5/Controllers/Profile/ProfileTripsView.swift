//
//  ProfileTripsView.swift
//  SwiftUIBasics
//
//  Created by Gabriel do Prado Moreira on 07/09/21.
//

import SwiftUI

struct ProfileTripsView: View {
    @State private var isZoomed: Bool = false
    
    let imageNames: [ProfileModel] = [
        ProfileModel(nomeDaImagem: "Figura1"),
        ProfileModel(nomeDaImagem: "Figura2"),
        ProfileModel(nomeDaImagem: "Figura3"),
        ProfileModel(nomeDaImagem: "Figura4"),
        ProfileModel(nomeDaImagem: "Figura5"),
        ProfileModel(nomeDaImagem: "Figura6")
    ]
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Your Trips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                    .padding(.top, 20)
                Spacer()
            }
            
            HStack(spacing: 20.0) {
                ForEach(imageNames[0...2]) { image in
                    Image(image.nomeDaImagem)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal, 20)
            .shadow(color: .gray, radius: 1, x: 1, y: 1)
            
            HStack(spacing: 20.0)
            {
                ForEach(imageNames[3...5]) { image in
                    Image(image.nomeDaImagem)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal, 20)
            .shadow(color: .gray, radius: 1, x: 1, y: 1)
        }
    }
}

struct ProfileTripsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTripsView()
    }
}

