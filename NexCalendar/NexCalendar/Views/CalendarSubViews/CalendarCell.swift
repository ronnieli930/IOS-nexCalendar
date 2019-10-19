import SwiftUI

struct CalendarCell: View {
    var styledDate: StyledDate
    
    var body: some View {
        VStack {
            if styledDate.isLeapDay {
                VStack {
                    Text(styledDate.getText())
                        .fontWeight(styledDate.getFontWight())
                        .foregroundColor(styledDate.getTextColor())
                        .font(.system(size: 14))
                    Text(NSLocalizedString("leap", comment: ""))
                        .fontWeight(styledDate.getFontWight())
                        .foregroundColor(styledDate.getTextColor())
                        .font(.system(size: 12))
                }
                .frame(width: 36, height: 36)
                .background(styledDate.getBackgroundColor())
                .cornerRadius(12)
            }else if styledDate.isLongSat {
                VStack {
                    Text(styledDate.getText())
                        .fontWeight(styledDate.getFontWight())
                        .foregroundColor(styledDate.getTextColor())
                        .font(.system(size: 14))
                    Text(NSLocalizedString("long", comment: ""))
                        .fontWeight(styledDate.getFontWight())
                        .foregroundColor(styledDate.getTextColor())
                        .font(.system(size: 12))
                }
                .frame(width: 36, height: 36)
                .background(styledDate.getBackgroundColor())
                .cornerRadius(12)
            }else {
                Text(styledDate.getText())
                    .fontWeight(styledDate.getFontWight())
                    .foregroundColor(styledDate.getTextColor())
                    .frame(width: 36, height: 36)
                    .font(.system(size: 20))
                    .background(styledDate.getBackgroundColor())
                    .cornerRadius(12)
            }
        }
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarCell(styledDate: StyledDate(date: Date(), isPast: false, isToday: false, isSelected: false, isWeekend: false, isLeapDay: false, isLongSat: false, theme: ThemeColor.bright))
                .previewDisplayName("Control")
            CalendarCell(styledDate: StyledDate(date: Date(), isPast: true, isToday: false, isSelected: false, isWeekend: false, isLeapDay: false, isLongSat: false, theme: ThemeColor.bright))
                .previewDisplayName("Past")
            CalendarCell(styledDate: StyledDate(date: Date(), isPast: false, isToday: true, isSelected: false, isWeekend: false, isLeapDay: false, isLongSat: false, theme: ThemeColor.bright))
                .previewDisplayName("Today")
            CalendarCell(styledDate: StyledDate(date: Date(), isPast: false, isToday: false, isSelected: true, isWeekend: false, isLeapDay: false, isLongSat: false, theme: ThemeColor.bright))
                .previewDisplayName("Selected")
            CalendarCell(styledDate: StyledDate(date: Date(), isPast: false, isToday: false, isSelected: false, isWeekend: false, isLeapDay: true, isLongSat: false, theme: ThemeColor.bright))
                .previewDisplayName("leap")
            CalendarCell(styledDate: StyledDate(date: Date(), isPast: false, isToday: false, isSelected: false, isWeekend: false, isLeapDay: false, isLongSat: true, theme: ThemeColor.bright))
                .previewDisplayName("Long Saturday")
        }.previewLayout(.fixed(width: 300, height: 70))
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
