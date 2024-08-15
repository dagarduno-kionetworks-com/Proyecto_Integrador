//
//  ContentView.swift
//  Proyecto_Integrador_DAGG
//
//  Created by Daniel Alejandro Garduño Galicia on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionNote: String = ""
    @StateObject var notesViewModel = NoteViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Agrega una tarea")
                    .underline()
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 16)
                TextEditor(text: $descriptionNote)
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.green, lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .cornerRadius(3.0)
                Button("Crear") {
                    notesViewModel.saveNote(description: descriptionNote)
                    descriptionNote = ""
                }
                .buttonStyle(.bordered)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .tint(.green)
                .bold()
                Spacer()
                List {
                    ForEach($notesViewModel.notes, id: \.id) { $note in
                        HStack {
                            if note.isFavorited {
                                Text("✅")
                            }
                            Text(note.description)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                notesViewModel.updateFavoriteNote(note: $note)
                            } label: {
                                Label("Check", systemImage: "checkmark.circle.fill")
                            }
                            .tint(.green)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                notesViewModel.removeNote(withId: note.id)
                            } label: {
                                Label("Eliminar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                Spacer()
                Text("By Daniel Alejandro Garduño Galicia")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .padding()
            }
            .navigationTitle("My Task Manager 📋")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text(notesViewModel.getNumerOfNotes())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


