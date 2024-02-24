//
//  SwiftGrid.swift
//  TextDemo
//
//  Created by Gaurav Sara on 24/02/24.
//

import SwiftUI

struct SwiftGrid: View {
    var body: some View {
//        Grid() {
//            GridRow {
//                cell(int: 1)
//                cell(int: 2)
//                cell(int: 3)
//            }
//            
//            Divider()
//                .gridCellUnsizedAxes(.horizontal)
////            cell(int: 222222)
//            
//            GridRow {
//                cell(int: 4)
//                cell(int: 5)
//                cell(int: 6)
//                cell(int: 7)
//            }
        
        Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
            ForEach(0..<4) { rowIndex in
                GridRow(alignment: .bottom) {
                    ForEach(0..<4) { columnIndex in
                        let cellNumber = (rowIndex * 4) + (columnIndex + 1)
                        
                        if cellNumber == 7 {
                            EmptyView()
//                            Color.clear
//                                .gridCellUnsizedAxes([.horizontal, .vertical])
                        } else {
                            cell(int: cellNumber)
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)
                                .gridCellAnchor(.leading) // This gonna override the below property
                                .gridColumnAlignment(cellNumber == 1 ? .trailing : .center)
                        }
                    }
                }
            }
        }
    }
    
    private func cell(int: Int) -> some View {
        Text("\(int)")
            .frame(height: int == 10 ? 20 : nil)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
    }
}

#Preview {
    SwiftGrid()
}
