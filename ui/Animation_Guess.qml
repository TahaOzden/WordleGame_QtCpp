import QtQuick 2.0

Item {
    property QtObject tgt
    property int animationDuration: 150
    property alias shrink : animationShrink
    property alias grow : rectYGrow
    PropertyAnimation {
        id: animationShrink
        target: tgt
        property: "height"
        to: 10
        duration: animationDuration
        onStarted : rectYShrink.start()
        alwaysRunToEnd: true
    }
    PropertyAnimation {
        id: rectYShrink
        target: tgt
        property: "y"
        to: tgt.y + gridWH/2 - 5
        duration: animationDuration
        onStopped: animationGrow.start()
        alwaysRunToEnd: true
    }
    PropertyAnimation {
        id: animationGrow
        target: tgt
        property: "height"
        to: gridWH
        duration: animationDuration
        onStarted : rectYGrow.start()
        alwaysRunToEnd: true
    }
    PropertyAnimation {
        id: rectYGrow
        target: tgt
        property: "y"
        to: tgt.y - gridWH/2 + 5
        duration: animationDuration
        alwaysRunToEnd: true
    }
}
