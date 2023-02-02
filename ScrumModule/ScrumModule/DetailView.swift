//
//  DetailView.swift
//  ScrumModule
//
//  Created by 이수민 on 2023/01/30.
//

import SwiftUI

struct DetailView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")){
                NavigationLink {
                    MeetingView()
                } label: {
                    Label("Starting Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }

               
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children:  .combine)
                HStack{
                    Label("Themes", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children:  .combine)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
