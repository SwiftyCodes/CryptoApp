//
//  ChartView.swift
//  CryptoApp
//
//  Created by Anudhi on 29/04/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    let viewModel : CoinDetailsViewModel
    var body: some View {
        Chart {
            ForEach(viewModel.chartData) { item in
                LineMark(x: .value("Date", item.date), y: .value("Price", item.value))
            }
            .interpolationMethod(.cardinal)
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper : viewModel.endDate)))
        .chartXAxis{
            AxisMarks(position: .bottom, values: viewModel.xAxisValues)
        }
        .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper : viewModel.maxPrice)))
        .chartYAxis{
            AxisMarks(position: .leading, values: viewModel.yAxisValues)
        }
    }
}
