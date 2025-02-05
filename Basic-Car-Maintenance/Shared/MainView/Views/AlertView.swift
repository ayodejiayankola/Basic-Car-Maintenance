//
//  AlertView.swift
//  Basic-Car-Maintenance
//
//  https://github.com/mikaelacaron/Basic-Car-Maintenance
//  See LICENSE for license information.
//

import SwiftUI

struct AlertView: View {
    let alert: AlertItem
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .center) {
                        Text(alert.emojiIcon)
                            .font(.system(size: 100))
                        
                        Text(alert.title)
                            .font(.title)
                            .minimumScaleFactor(0.7)
                            .lineLimit(2)
                            .bold()
                        
                        Text(alert.message.replacingOccurrences(of: "\\n", with: "\n"))
                    }
                    .multilineTextAlignment(.center)
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 24)
                
                Button {
                    guard let url = URL(string: alert.actionURL),
                          UIApplication.shared.canOpenURL(url) else {
                        dismiss()
                        return
                    }
                    
                    UIApplication.shared.open(url)
                } label: {
                    Text(alert.actionText)
                        .font(.title3)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                }
                .frame(minHeight: 44)
                .background {
                    Color(.basicGreen)
                }
                .clipShape(.capsule)
                .padding([.bottom, .trailing, .leading], 24)
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                            .bold()
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    AlertView(
        alert: AlertItem(
            id: nil,
            actionText: "",
            actionURL: "",
            emojiIcon: "",
            isOn: false,
            message: "",
            title: ""
        )
    )
}
