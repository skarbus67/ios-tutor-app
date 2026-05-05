import SwiftUI
import UniformTypeIdentifiers
import SwiftData

struct SettingsView: View {
    @State private var isExporting = false
    @Query var lessons: [Lesson]
    
    var body: some View {
        VStack {
            Button(action: {
                isExporting = true
            }) {
                Text("export to csv")
            }
        }
        .fileExporter(
            isPresented: $isExporting,
            document: CSVDocument(text: ExporterCSV.convertToStringCSV(lessons: lessons)),
            contentType: .commaSeparatedText,
            defaultFilename: "moje_dane.csv"
        ) {_ in}
    }
}

struct CSVDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.commaSeparatedText] }

    var text: String

    init(text: String) {
        self.text = text
    }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents,
           let string = String(data: data, encoding: .utf8) {
            text = string
        } else {
            text = ""
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8) ?? Data()
        return .init(regularFileWithContents: data)
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: Lesson.self)
}
