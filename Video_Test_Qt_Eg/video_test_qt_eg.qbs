import qbs
CppApplication {
    Depends { name: "Qt"; submodules: ["quick", "virtualkeyboard"] }
    install: true
    // Additional import path used to resolve QML modules in Qt Creator's code model
    property pathList qmlImportPaths: []

    files: [
        "main.cpp",
    ]

    Group {
        Qt.core.resourcePrefix: "Video_Test_Qt_Eg/"
        fileTags: ["qt.qml.qml", "qt.core.resource_data"]
        files: ["Main.qml"]
    }
}
