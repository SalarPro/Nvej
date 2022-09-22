//
//  ContentView.swift
//  Nvej
//
//  Created by Salar Pro on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Damen Banga")
                    .foregroundColor(.green)
                    .font(.system(size: 50, weight: .bold))
                    .multilineTextAlignment(.trailing)
                    .padding(.top, 50)
                
                Image(systemName: "clock")
                    .resizable()
                
                    .foregroundColor(.green)
                    .frame(width: 40, height: 40)
                    .padding(.bottom, 30)
                
                
                
                titleView(nvejName: "Speda",nvejTime: db.today().spede)
                titleView(nvejName: "Roj halat",nvejTime: db.today().rojHalat)
                titleView(nvejName: "Nivru",nvejTime: db.today().nivro)
                titleView(nvejName: "Evary",nvejTime: db.today().evary)
                titleView(nvejName: "Magrab",nvejTime: db.today().magrab)
                titleView(nvejName: "Aysha",nvejTime: db.today().aysha)
                
                //
            }
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct titleView: View {
    var nvejName: String
    var nvejTime: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.init(red: 46/255, green: 204/255, blue: 113/255))
            //rgb(46, 204, 113)
                .frame( height: 40)
            HStack (spacing: 20) {
                Text(nvejName)
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 200, alignment: .leading)
                    .multilineTextAlignment(.trailing)
                    .padding(.horizontal, 10)
                Text(nvejTime)
                //                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system( .title))
                //                    .background(.blue)
                //                    .cornerRadius(10)
                
            }
            //            .padding([.horizontal], 30)
            //            .background(.yellow)
            //            .cornerRadius(10)
        }
        .onAppear{
//            readJSonData()
        }
    }
}
