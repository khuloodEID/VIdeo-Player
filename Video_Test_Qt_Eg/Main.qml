import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.0
Item {
    width: 600
    height: 600

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.movies
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)

        }
        onRejected: {
            console.log("Canceled")
            Qt.quit()
        }
        Component.onCompleted: visible = true
    }
    Video {
        id: video
        anchors.fill: parent
        source: fileDialog.shortcut.movies
        // Add properties to track video state and position
        property bool playing: false
        property int position: 0
        // Connect to video's signals to keep state and position updated
        onPlayingChanged: playing = video.play()
        onPositionChanged: position = video.position()
    }


          Row {
                     anchors.bottom: parent.bottom
                     anchors.horizontalCenter: parent.horizontalCenter

    Button {
        id: playButton
        text: video.playing ? "Pause" : "Play"
        onClicked: video.playing ? video.pause() : video.play()
    }
    Slider {
    from: 0
    to: video.duration
}
Connections {
    target: video
    onPlayingChanged: playButton.text = video.playing ? "Pause" : "Play"
    onPositionChanged: progressSlider.value = video.position
}

Button {
    id: openButton
    text: "Open Video"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    onClicked: {
        var fileDialog = Qt.createQmlObject('import QtQuick.Dialogs 1.3; FileDialog {}', parent)
        fileDialog.title = "Open Video"
        fileDialog.selectMultiple = false
        fileDialog.accepted.connect(function() {
            video.source = fileDialog.fileUrl
        })
        fileDialog.show()
    }
            }
            focus: true
            Keys.OnSpacePressed: video. playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
            Keys.onLeftPressed: video.seek(video.position - 5000)
            Keys.onRightPressed: video.seek(video.position + 5000)

        }

}


}
}
