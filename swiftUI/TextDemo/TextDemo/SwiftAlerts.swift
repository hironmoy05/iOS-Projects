//
//  SwiftAlerts.swift
//  TextDemo
//
//  Created by Gaurav Sara on 11/02/24.
//

import SwiftUI

struct SwiftAlerts: View {
    @State var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    @State var backgroundColor: Color = .green
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        
//        ZStack {
//            backgroundColor
//            
//            Button("Click") {
//                showAlert.toggle()
//            }
//            .alert(isPresented: $showAlert) {
//                //            Alert(title: Text("Placeholder"), message: Text("There was an error"), dismissButton: .cancel())
//                
//                getAlert()
//            }
//        }
        
        ZStack {
            backgroundColor
            
            VStack {
                Button("Button 1") {
//                    alertTitle = "Error uploading video"
//                    alertMessage = "The video could not be uploaded"
                    alertType = .error
                    showAlert.toggle()
                }
                
                Button("Button 2") {
//                    alertTitle = "Successfully uploaded video 🥳"
//                    alertMessage = "Your video is now public"
                    alertType = .success
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: {
                    getAlert()
            })
        }
            
    }
    
    func getAlert() -> Alert {
//        Alert(
//            title: Text("This is the title"),
//            message: Text("Here we will describe the error."),
//            //                primaryButton: .destructive(Text("Delete")),
//            primaryButton: .destructive(Text("Delete"), action: {
//                backgroundColor = .cyan
//            }),
//            secondaryButton: .cancel())
        
//        Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("Ok"))
//        )
        
        switch alertType {
        case .success:
            return Alert(title: Text("There was a success"), message: nil, dismissButton: .default(Text("ok"), action: {
                backgroundColor = .green
            }))
        case .error:
            return Alert(title: Text("There was an error."), message: nil, dismissButton: .default(Text("ok"), action: {
                backgroundColor = .yellow
            }))
        case nil:
            return Alert(title: Text("Error"))
        }
    }
}

#Preview {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    SwiftAlerts()
}
