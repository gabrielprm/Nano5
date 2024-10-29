import SwiftUI

struct ProfileTripsView: View {
    
    @State private var isZoomed: Bool = false
    
    let trips: [Trip] = TripViewController.trips!
    
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
                
                let rows = [
                        GridItem(.fixed(100), spacing: 20.0),
                        GridItem(.fixed(100), spacing: 20.0)
                    ]
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 20.0) {
                        ForEach(trips) { image in
                            Image(uiImage: image.thumbnailImage!)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                        }
                    }
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

