//
//  ContentView.swift
//  Moonshot
//
//  Created by Nestor Trillo on 3/25/21.
//

// round #2

//	LIBRARIES
import SwiftUI

struct ContentView: View {
	//	LOCAL VARS
	let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	// BODY
	var body: some View {
		NavigationView {
			List(missions) { mission in
				NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
					Image(mission.image)
						.resizable()
						.scaledToFit()
						.frame(width: 44, height: 44)
					
					VStack(alignment: .leading) {
						Text(mission.displayName)
							.font(.headline)
						Text(mission.formattedLaunchDate)
					}
				}
			}
			.navigationBarTitle("Moonshot")
		}
	}
	//	FUNCTIONS
}

//	PREVIEW
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
