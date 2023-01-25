import SwiftUI

struct ClockView: View {

    // MARK: - Private properties

    @StateObject private var viewModel = ClockViewModel()

    // MARK: - View

    var body: some View {
        VStack {
            LightView(light: $viewModel.secondsLight)
            LightsRowView(lights: $viewModel.fiveHoursLights)
            LightsRowView(lights: $viewModel.singleHoursLights)
            LightsRowView(lights: $viewModel.fiveMinutesLights)
            LightsRowView(lights: $viewModel.singleMinutesLights)
            Text(viewModel.timeString)
        }
    }
}

// MARK: - Preview

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
