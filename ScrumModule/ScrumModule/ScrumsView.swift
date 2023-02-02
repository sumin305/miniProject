//
//  ScrumsView.swift
//  ScrumModule
//
//  Created by 이수민 on 2023/01/30.
//

import SwiftUI

struct ScrumsView: View {
    
    let scrums: [DailyScrum]
    
    var body: some View {
        List{
            ForEach(scrums) { scrum in
                NavigationLink {
                    DetailView(scrum: scrum)
                } label: {
                    CardView(scrum:  scrum)
                } .listRowBackground(scrum.theme.mainColor)
                
            }
        }.navigationTitle("Daily Scrums")
            .toolbar{
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")

            }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
