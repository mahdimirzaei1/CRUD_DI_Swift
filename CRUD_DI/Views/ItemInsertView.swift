//
//  TaskInsertView.swift
//  StoringBuddy
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import SwiftUI

struct ItemInsertView: View {

    @ObservedObject var viewModel: ItemInsertViewModel

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("String : ")
                TextField("String", text: $viewModel._ItemString).textFieldStyle(.automatic)
            }
            .padding()
            
            HStack(spacing: 20) {
                Text("Bool :")
                Toggle("Bool", isOn: $viewModel._ItemBool)
                Spacer()
            }
            .padding()
            
            HStack(spacing: 20) {
                Text("Date :")
                DatePicker("Date", selection: $viewModel._ItemDate)
                Spacer()
            }
            .padding()

            HStack {
                Button(action: {
                    viewModel.OnInsert()
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 25)
                }
                .background(.clear)
                .cornerRadius(.infinity)
                .padding()
            }
            Spacer()
        }
    }
}
