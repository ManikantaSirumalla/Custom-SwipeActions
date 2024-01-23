//
//  SwippableCardView.swift
//  Custom SwipeActions
//
//  Created by Manikanta Sirumalla on 24/01/24.
//

import SwiftUI
import Kingfisher

struct SwipableCards: View {
    let image: String
    let name: String
    let company: String
    let country: String
    var onFavoriteAction: () -> Void
    var onDeleteAction: () -> Void
    var onStarAction: () -> Void
    
    @Binding var showFav: Bool
    
    @State private var swipeOffset: CGSize = .zero
    @State private var showSwipeActions: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                if let imageStr = URL(string: image) {
                    KFImage(imageStr)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .cornerRadius(5)
                }
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(company)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text(name)
                        .font(.system(size: 14)).bold()
                        .lineLimit(2)
                        .padding(.trailing)
                    
                    Text(country)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Divider()
                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .offset(x: swipeOffset.width)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        swipeOffset.width = value.translation.width
                    }
                    .onEnded { value in
                        withAnimation {
                            if value.translation.width < -50 {
                                // Swipe to the left, show actions
                                swipeOffset = CGSize(width: -150, height: 0)
                            } else if value.translation.width > 50 {
                                // Swipe to the right, hide actions
                                swipeOffset = CGSize(width: 100, height: 0)
                                
                            } else {
                                swipeOffset = .zero
                            }
                        }
                    }
            )
            
            HStack(spacing: 0) {
                    //Swipe actions on right side
                    Button(action: {
                        // Additional action for the star
                        onStarAction()
                        showSwipeActions = true
                        swipeOffset = .zero
                    }, label: {
                        VStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(Color.white)
                            Text("Starred")
                                .font(.callout)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxHeight: .infinity)
                        .background(Color.yellow)
                    })
                    Spacer()
                
            } .opacity( swipeOffset.width > 0 ? 1 : 0)
            
            
            HStack(spacing: 0) {
                // Swipe actions for left side
                Button(action: {
                    withAnimation {
                        onFavoriteAction()
                        showSwipeActions = false
                        swipeOffset = .zero
                    }
                }, label: {
                    VStack {
                        Image(systemName: showFav ? "heart.fill" : "heart")
                            .foregroundColor(.white)
                        Text(showFav ? "remove" : "Add to fav")
                            .font(.callout)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.blue)
                })
                
                Button(action: {
                    withAnimation {
                        onDeleteAction()
                        showSwipeActions = false
                        swipeOffset = .zero
                    }
                }, label: {
                    VStack {
                        Image(systemName: "trash")
                            .foregroundStyle(Color.white)
                        Text("Delete")
                            .font(.callout)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(Color.red)
                })
                
                
               
            }
            .opacity(swipeOffset.width < 0 ? 1 : 0)
            .offset(x: swipeOffset.width + 260)
            .animation(.default, value: showSwipeActions)
        }
    }
}
