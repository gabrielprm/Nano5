import SwiftUI

struct ProfilePictureContainerView: View {
    
    var body: some View {
        ZStack {
            Color(.projectGreen)
            Image(systemName: "gearshape")
                .position(x: (UIScreen.screenWidth * 0.9), y: (UIScreen.screenHeight * 0.08))
            VStack {
                Image("profilePicture")
                    .shadow(color: .gray, radius: 2, x: 2, y: 2)
                Text("Claudia Ferraz")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("Edit Profile")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }.padding(.top, 30)
            
        }
        .frame(width: .infinity, height: 338, alignment: .center)
        .cornerRadius(50)
        .position(CGPoint(x: (UIScreen.screenWidth / 2) , y: (UIScreen.screenHeight / 7)))
        .shadow(color: .gray, radius: 2, x: 2, y: 2)
    }
}

struct ProfilePictureContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureContainerView()
    }
}
