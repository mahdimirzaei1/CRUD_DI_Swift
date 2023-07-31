//
//  TaskDetailView.swift
//  StoringBuddy
//
//  Created by Mahdi Mirzaei on 7/25/23.
//

import Foundation
import SwiftUI

struct ItemDetailView: View {

    @ObservedObject var viewModel: ItemDetailViewModel
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("String :")
                TextField("String", text: $viewModel._ItemString)
                    .textFieldStyle(.roundedBorder)
            }

            HStack(spacing: 20) {
                Text("Date :")
                DatePicker("Date", selection: $viewModel._ItemDate)
                Spacer()
            }

            HStack(spacing: 20) {
                Text("Bool :")
                Toggle("Bool", isOn: $viewModel._ItemBool)
                Spacer()
            }
            
            HStack {
                Button(action: {
                    viewModel.OnEdit()
                }) {
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(.blue)
                .cornerRadius(.infinity)
                .padding()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
