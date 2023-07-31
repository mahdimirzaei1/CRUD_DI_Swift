//
//  TaskListView.swift
//  StoringBuddy
//
//  Created by Mahdi Mirzaei on 7/25/23.

import SwiftUI

struct ItemListView: View {
    
    @ObservedObject var viewModel: ItemListViewModel
    
    var body: some View{
        ZStack{
            VStack(spacing: 30) {
                Text("MMVH")
                    .font(.title.bold())
                
                if viewModel._Items.isEmpty{
                    Text("You haven't saved any item.")
                } else{
                    List{
                        ForEach(viewModel._Items, id: \.id) { item in
                            Text(item.stringEx)
                                .onTapGesture {
                                    viewModel.AppPilot.push(.Detail(id: item.id!))
                                }
                        }
                        .onDelete(perform: viewModel.DeleteItem(at:))
                    }
                    .listStyle(.plain)
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                        UITableViewCell.appearance().selectionStyle = .none
                        UITableView.appearance().showsVerticalScrollIndicator = false
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        viewModel.OnAdd()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .background(.blue)
                    .cornerRadius(.infinity)
                    .padding()
                }
            }
        }
        .onAppear{
            viewModel.GetItemList()
        }
        .navigationBarHidden(true)
    }
}
