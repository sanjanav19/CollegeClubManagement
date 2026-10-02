import SwiftUI

struct LoginView: View {

    @EnvironmentObject var appViewModel: AppViewModel

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                Spacer()

                Image(systemName: "building.2.crop.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.blue)

                Text("CampusConnect")
                    .font(.largeTitle.bold())

                Text("College Club Management")
                    .foregroundStyle(.secondary)

                VStack(spacing: 16) {

                    TextField("College Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }

                Button {
                    appViewModel.login(
                        email: email,
                        password: password
                    )
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Text("Demo: enter any email to continue.\nUse an email containing \"admin\" for Admin mode.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                Spacer()
            }
            .padding(24)
        }
    }
}