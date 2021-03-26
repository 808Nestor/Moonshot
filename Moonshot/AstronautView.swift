//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nestor Trillo on 3/25/21.
//

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
						.layoutPriority(0)// set to 0 if description get truncated
				}
			}
		}
		.navigationBarTitle(
			Text(astronaut.name)
		)
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
