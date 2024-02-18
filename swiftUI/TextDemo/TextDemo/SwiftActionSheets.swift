//
//  SwiftActionSheets.swift
//  TextDemo
//
//  Created by Gaurav Sara on 14/02/24.
//

import SwiftUI

// ActionSheet will be depricated in future, so I'm using 'confirmationDialog' instead of 'actionSheet"

enum ConfirmationDialogOptions {
    case isMyPost
    case isOtherPost
}

struct SwiftActionSheets: View {
    @State var showConfirmationDialog: Bool = false
    @State var openMenuOptions: Bool = false
    
    @State var confirmationDialogOptions: ConfirmationDialogOptions = .isOtherPost
    
    var body: some View {
        //        Button("Click me") {
        //            showConfirmationDialog.toggle()
        //        }
        //
        //        .confirmationDialog(
        //            Text("\(title)\n Hello")
        //            , isPresented: $showConfirmationDialog, titleVisibility: .visible) {
        //            Button("Delete", role: .destructive) { /* action for option 1 */ }
        //            Button("Default", role: .none) { /* action for option 2 */ }
        //            Button("Cancle", role: .cancel, action: {
        //
        //            })
        //        }
        
        // A real world example
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button(action: {
                    confirmationDialogOptions = .isOtherPost
                    showConfirmationDialog.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                
                })
                .tint(.primary)
            }
            .padding()
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .confirmationDialog(
            Text("What would you like to do?\n Hello")
            , isPresented: $showConfirmationDialog, titleVisibility: .visible) {
                switch confirmationDialogOptions {
                case .isMyPost:
                    Button("Share", role: .none) {
                        
                    }
                    
                    Button("Delete", role: .destructive, action: {
                        
                    })
                    
                    Button("Report", role: .destructive) {
                        
                    }
                case .isOtherPost:
                    Button("Share", role: .none) {
                        
                    }
                    Button("Report", role: .destructive) {
                        
                    }
                }
                
                Button("Cancel", role: .cancel) { openMenuOptions = false }
            }
    }
}

#Preview {
    SwiftActionSheets()
}
