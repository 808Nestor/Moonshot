//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nestor Trillo on 3/25/21.
//
// round #2

//	LIBRARIES
import SwiftUI

struct AstronautView: View {
	//	LOCAL VARS
	let astronaut: Astronaut
	
	// BODY
	var body: some View {
		GeometryReader { geometry in
				ScrollView(.vertical) {
				VStack {
					Image(self.astronaut.id)
						.resizable()
						.scaledToFit()
						.frame(width: geometry.size.width)
					
					Text(self.astronaut.description)
						.padding()
				}
			}
		}
		.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
	}
	//	FUNCTIONS
}

//	PREVIEW
struct AstronautView_Previews: PreviewProvider {
	static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
	
	static var previews: some View {
		AstronautView(astronaut: astronauts[0])
	}
}
