//
//  ContentView.swift
//  Custom SwipeActions
//
//  Created by Manikanta Sirumalla on 24/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var swipeOffsets: [CGSize] = Array(repeating: .zero, count: 15)
    @State private var showFav: Bool = false
    @State private var alertItem: AlertItem?
    
    var ceos: [CEOModel] = [
        CEOModel(
            name: "Elon Musk",
            company: "Tesla and SpaceX",
            dob: "June 28, 1971",
            country: "United States",
            image: "https://upload.wikimedia.org/wikipedia/commons/9/99/Elon_Musk_Colorado_2022_%28cropped2%29.jpg"
        ),
        CEOModel(
            name: "Tim Cook",
            company: "Apple",
            dob: "November 1, 1960",
            country: "United States",
            image: "https://cloudfront-us-east-2.images.arcpublishing.com/reuters/XR46XDPWSNIENH4J37JZ7SSOOU.jpg"
        ),
        CEOModel(
            name: "Satya Nadella",
            company: "Microsoft",
            dob: "August 19, 1967",
            country: "India",
            image: "https://cionews.co.in/wp-content/uploads/2023/11/Article-Main-Image-71.png"
        ),
        CEOModel(
            name: "Mark Zuckerberg",
            company: "Facebook",
            dob: "May 14, 1984",
            country: "United States",
            image: "https://cdn.britannica.com/99/236599-050-1199AD2C/Mark-Zuckerberg-2019.jpg"
        ),
        CEOModel(
            name: "Jeff Bezos",
            company: "Amazon",
            dob: "January 12, 1964",
            country: "United States",
            image: "https://hips.hearstapps.com/hmg-prod/images/jeff-bezos-attends-the-lord-of-the-rings-the-rings-of-power-news-photo-1684851576.jpg?crop=1.00xw:0.862xh;0,0.0207xh&resize=1200:*"
        ),
        CEOModel(
            name: "Sundar Pichai",
            company: "Alphabet Inc. (Google)",
            dob: "June 10, 1972",
            country: "India",
            image: "https://assets.weforum.org/sf_account/image/rA_TF_tkRNKjxk_gzlr9UlBXMhuoPZNeRaRO7-ys_xw.jpg"
        ),
        CEOModel(
            name: "Arvind Krishna",
            company: "IBM",
            dob: "April 30, 1962",
            country: "United States",
            image: "https://www.crn.com/slide-shows/cloud/media_14f5d2624b332d60bc97021f122fca675be45b161.jpeg?width=750&format=jpeg&optimize=medium"
        ),
        CEOModel(
            name: "Ginni Rometty",
            company: "IBM (Former CEO)",
            dob: "July 29, 1957",
            country: "United States",
            image: "https://media.licdn.com/dms/image/C4E03AQGZC2vM7CN0Ag/profile-displayphoto-shrink_800_800/0/1667870729880?e=2147483647&v=beta&t=yPRZXyhDPBn5ExuKA5Qm_bc-iXzbMycYruh0D4byYtw"
        ),
        CEOModel(
            name: "Jensen Huang",
            company: "NVIDIA",
            dob: "February 17, 1963",
            country: "Taiwan",
            image: "https://imageio.forbes.com/specials-images/imageserve/5bc505a331358e59f57abeb9/0x0.jpg?format=jpg&crop=2702,2700,x553,y212,safe&height=416&width=416&fit=bounds"
        ),
        CEOModel(
            name: "Lynne Doughtie",
            company: "KPMG (Former Chairman & CEO)",
            dob: "May 10, 1962",
            country: "United States",
            image: "https://media.licdn.com/dms/image/C4E03AQF6l13z5Qyjqw/profile-displayphoto-shrink_800_800/0/1556118725301?e=2147483647&v=beta&t=MBXiYgSGZPjupMKkVwkHebrppM7X9zARqVPLQLiqkFU"
        ),
        CEOModel(
            name: "Abigail Johnson",
            company: "Fidelity Investments",
            dob: "December 19, 1961",
            country: "United States",
            image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTaWcmGqHkkYNNIRrabDCJ49ryremjIQ4DUdf76Gme0S1aORzpn"
        ),
        CEOModel(
            name: "Gail Boudreaux",
            company: "Anthem",
            dob: "September 2, 1960",
            country: "United States",
            image: "https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcSXgDtWOp8xwLDPdjo12JjOyqCKDzf1QJMJY-BEVi5gO-VrhqTwVt4LHXIWbiSiFAIGq1axZwXpUmxuSvs"
        ),
        CEOModel(
            name: "Doug McMillon",
            company: "Walmart",
            dob: "October 17, 1966",
            country: "United States",
            image: "https://s.yimg.com/ny/api/res/1.2/FGGFXbMhJhALZ9zDP4_rIA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://media.zenfs.com/en/wwd_finance_675/d869884b05146abcbabade20cda654a0"
        ),
        CEOModel(
            name: "Carlos Ghosn",
            company: "Renault-Nissan Alliance (Former Chairman & CEO)",
            dob: "March 9, 1954",
            country: "Brazil",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC9zuQLHtIgkmizOFsTWMKia1fuGAtICnya_0OocOprhgqoJhy"
        ),
        CEOModel(
            name: "Safra Catz",
            company: "Oracle",
            dob: "December 1, 1961",
            country: "United States",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_lvBhVHXg419Ch8IKJkI3iflodJtkcGT7c0GcUioFG79dGKlC"
        )
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(ceos.indices, id:\.self) { cell in
                        SwipableCards(
                            image: ceos[cell].image,
                            name:  ceos[cell].name,
                            company:  ceos[cell].company,
                            country:  ceos[cell].country,
                            onFavoriteAction: {
                                showAlert(title: "Favorite", message: "You Clicked on Favorite action")
                            }, onDeleteAction: {
                                showAlert(title: "Delete", message: "You Clicked on Delete action")
                            },
                            onStarAction: {
                                showAlert(title: "Starred", message: "You Clicked on Star action")
                            },
                            showFav: $showFav
                        )
                    }
                }
                .navigationTitle("Custom Swipe Actions!")
            }
            .alert(item: $alertItem) { alertItem in
                           alertItem.alert
                       }
        }
    }
    
    func showAlert(title: String, message: String) {
         let alert = Alert(title: Text(title), message:Text(message), dismissButton: .default(Text("OK")))
        alertItem = AlertItem(alert: alert)
    }
}

#Preview {
    ContentView()
}


