//
//  StatsView.swift
//  ARApp2
//
//  Created by Victor Valbuena on 4/8/23.
//

import Foundation
import SwiftUI
import SwiftPieChart

struct StatsView : View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    PieChartView(
                        values: [2000, 1100, 400],
                        names: ["Metals", "Plastics", "Papers"],
                        formatter: {value in String(format: "$%.2f", value)},
                        backgroundColor: .black)
                    .frame(maxWidth:.infinity, maxHeight:.infinity, alignment:.top)
                }.padding()

                
                
                List {
                    Section(header: Text("Itemized Sources")) {
                        HStack {
                            Text("Plastic Bags, Walmart")
                                .bold()
                            Spacer()
                            Text("14 lbs. ")
                        }
                        HStack {
                            Text("Scrap Metal, Tesla")
                                .bold()
                            Spacer()
                            Text("2.84 tons")
                        }
                        HStack {
                            Text("Old Paper, Local School")
                                .bold()
                            Spacer()
                            Text("58 lbs.")
                        }
                        
                    }
                    

                }.frame(maxHeight:175, alignment:.bottom)
            }
            .navigationTitle("Statistics Page")
            .background(.black)
        }

    }
}
