//
//  ContentView.swift
//  Swift-DynamicContent-Tour
//
//  Created by Elias on 2026/2/21.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = [
        "Elias", "John", "Ian", "Sammi",
    ]
    @State private var inputName = ""
    @State private var pickName = ""
    @State private var shouldRemoveAfterPick: Bool = false

    var body: some View {
        VStack {
            Image(systemName: "person.3.sequence.fill").font(.largeTitle)
                .foregroundStyle(.tint).symbolRenderingMode(.hierarchical)
            Text("Pick-A-Pal").font(.title).fontWeight(.bold)
            Text(pickName.isEmpty ? " " : pickName).font(.title3).fontWeight(
                .bold
            ).foregroundStyle(.tint)
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }.clipShape(RoundedRectangle(cornerRadius: 20))
            TextField("Add Name", text: $inputName).onSubmit {
                if !inputName.isEmpty {
                    names.append(inputName)
                    inputName = ""
                }
            }
            Divider()
            Toggle("Remove after pick", isOn: $shouldRemoveAfterPick)
            Button {
                if let randomName = names.randomElement() {
                    pickName = randomName
                    if shouldRemoveAfterPick {
                        names.removeAll { $0 == randomName }
                    }
                } else {
                    pickName = ""
                }
            } label: {
                Text("Pick a random name").fontWeight(.medium).padding(8)
            }.buttonStyle(.borderedProminent).font(.title3)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
