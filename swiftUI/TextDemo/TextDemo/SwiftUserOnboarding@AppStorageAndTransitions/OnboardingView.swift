//
//  OnboardingView.swift
//  TextDemo
//
//  Created by Gaurav Sara on 21/02/24.
//

import SwiftUI

struct OnboardingView: View {
    // Onboarding states:
    /*
        0 - Welcome screen
        1 - Add name
        2 - Add age
        3 - Add gender
    */
    @State var onboardingState: Int = 0
    @State var backgroundColor: Color = .purple
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    // onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                colors: [.purple, .blue],
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()

            
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.green)
                }
            }
            
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("ok") {
                showAlert.toggle()
            }
        }
    }
}

#Preview {
    OnboardingView()
}

extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" : onboardingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundStyle(.purple)
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .animation(.none, value: true)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .fill(.white)
                        .frame(height: 3)
                        .offset(y: 5)
                    ,
                    alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! We are practicing using AppStorage and other SwiftUI techiques")
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .padding(.horizontal)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
           
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
           
            Picker(selection: $gender) {
                Text("Select a gender")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.white)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
                
            } label: {
                Text("Select a gender")
                    .font(.headline)
                    .frame(height: 55)
                    .background(.white)
            }
            .tint(.purple)
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .pickerStyle(MenuPickerStyle())
                        
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: FUNCTIONS

extension OnboardingView {
    func handleNextButtonPressed() {
        withAnimation(.spring) {
            
            // CHECK INPUTS
            switch onboardingState {
            case 1:
                guard name.count >= 3 else {
                    showAlert.toggle()
                    showAlert(title: "Your name must be at least 3 characters long! 😫")
                    return
                }
            case 3:
                guard gender.count > 1 else {
                    showAlert.toggle()
                    showAlert(title: "Please select a gender before moving forward! 😳")
                    return
                }
            default:
                break
            }
            
            // GO TO NEXT SECTION
            if onboardingState == 3 {
                // sign in
                signIn()
            } else {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring) {
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        if showAlert {
            alertTitle = title
        }
    }
}
