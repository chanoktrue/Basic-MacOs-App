//
//  ContentView.swift
//  MacOS App
//
//  Created by Thongchai Subsaidee on 16/2/22.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}



struct ContentView: View {
    
    @State var currentOption = 0
    
    let options: [Option] = [
        .init(title: "Home", imageName: "house"),
        .init(title: "About", imageName: "info.circle"),
        .init(title: "Settings", imageName: "gear"),
        .init(title: "Social", imageName: "message")
    ]
    
    var body: some View {
        NavigationView {
            ListView(options: options, currentSelection: $currentOption)
            
            switch currentOption {
            case 1:
                Text("About iOS Academy View")
            default:
                MainView()
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}


struct ListView: View {
    let options: [Option]
    @Binding var currentSelection: Int
    
    var body: some View {
        VStack {
            let current = options[currentSelection]
            ForEach(options, id: \.self) { option in
                HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text(option.title)
                        .foregroundColor(current == option ? Color.blue : Color.white)
                    
                    Spacer()
                }
                .padding(8)
                .onTapGesture {
                    if currentSelection == 1 {
                        currentSelection = 0
                    }else {
                        self.currentSelection = 1
                    }
                }
            }
            Spacer()
        }
    }
}

struct MainView: View {
    
    let cols: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
    ]
    
    let images = Array(1...6).map{"images\($0)"}
    
    var body: some View {
        VStack {
            Image("swiftui")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            LazyVGrid(columns: cols) {
                
                ForEach(images, id: \.self) { imageName in
                    VStack {
                        Image(imageName)
                        .resizable()
                        .frame(height: 80)
                        .aspectRatio(contentMode: .fit)
                        
                        Text("Video title goes here")
                            .bold()
                    }
                }
            }
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
