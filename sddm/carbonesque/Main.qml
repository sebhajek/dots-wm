import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: container
    width: 640
    height: 480

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = textConstants.loginSucceeded
        }

        onLoginFailed: {
            password.text = ""
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }
    }

    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = "background-sddm.png"
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        //visible: primaryScreen

        Rectangle {
            id: rectangle
            anchors.centerIn: parent
            width: Math.max(652, mainColumn.implicitWidth + 80)
            height: Math.max(492, mainColumn.implicitHeight + 50)

//            source: "panelnew.png"

            Column {
                id: mainColumn
                anchors.centerIn: parent
                spacing: 18
                width: 390
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#dcebee"
                    verticalAlignment: Text.AlignVCenter
                    height: text.implicitHeight
                    width: parent.width
                    text: "Welcome to openSUSE"
//                    text: textConstants.welcomeText.arg(sddm.hostName)
                    wrapMode: Text.WordWrap
                    font.pixelSize: 24
                    font.bold: true
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }

                Column {
                    width: parent.width
                    spacing: 4
                    Text {
                        id: lblName
                        width: parent.width
                        text: textConstants.userName
                        font.bold: true
                        font.pixelSize: 14
                        color: "#dcebee"
                    }

                    TextBox {
                        id: name
                        color: "#dcebee"
                        textColor: "#23383d"
                        width: parent.width; height: 30
                        text: userModel.lastUser
                        font.pixelSize: 14
                        borderColor: "#35535b"
                        focusColor: "#52818d"
                        hoverColor: "#dcebee"

                        KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }

                Column {
                    width: parent.width
                    spacing : 4
                    Text {
                        id: lblPassword
                        width: parent.width
                        text: textConstants.password
                        font.bold: true
                        font.pixelSize: 14
                        color: "#dcebee"
                    }

                    PasswordBox {
                        id: password
                        width: parent.width; height: 30
                        font.pixelSize: 14
                        color: "#dcebee"
                        textColor: "#23383d"
                        borderColor: "#35535b"
                        focusColor: "#52818d"
                        hoverColor: "#dcebee"

                        KeyNavigation.backtab: name; KeyNavigation.tab: session

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }

                Row {
                    spacing: 4
                    width: parent.width / 2
                    z: 100

                    Column {
                        z: 100
                        width: parent.width * 1.3
                        spacing : 4
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblSession
                            width: parent.width
                            text: textConstants.session
                            wrapMode: TextEdit.WordWrap
                            font.bold: true
                            font.pixelSize: 14
                            color: "#dcebee"
                        }

                        ComboBox {
                            id: session
                            width: parent.width; height: 30
                            font.pixelSize: 14
                            color: "#dcebee"
                            textColor: "#23383d"
                            focusColor: "#35535b"
                            hoverColor: "#d3e2e4"

                            arrowIcon: "angle-down.png"

                            model: sessionModel
                            index: sessionModel.lastIndex

                            KeyNavigation.backtab: password; KeyNavigation.tab: layoutBox
                        }
                    }

                    Column {
                        z: 101
                        width: parent.width * 0.7
                        spacing : 4
                        anchors.bottom: parent.bottom

                        Text {
                            id: lblLayout
                            width: parent.width
                            text: textConstants.layout
                            wrapMode: TextEdit.WordWrap
                            font.bold: true
                            font.pixelSize: 14
                            color: "#dcebee"
                        }

                        LayoutBox {
                            id: layoutBox
                            width: parent.width; height: 30
                            font.pixelSize: 14
                            color: "#dcebee"
                            textColor: "#23383d"
                            focusColor: "#35535b"
                            hoverColor: "#d3e2e4"

                            arrowIcon: "angle-down.png"

                            KeyNavigation.backtab: session; KeyNavigation.tab: loginButton
                        }
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        id: errorMessage
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: textConstants.prompt
                        font.pixelSize: 12
                        color: "#dcebee"
                    }
                }

                Row {
                    spacing: 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    property int btnWidth: Math.max(loginButton.implicitWidth,
                                                    shutdownButton.implicitWidth,
                                                    rebootButton.implicitWidth, 80) + 8
                    Button {
                        id: loginButton
                        text: textConstants.login
                        width: parent.btnWidth
                        color: "#699d75"
//                         color: "#92b79a"
                        textColor: "white"
                        pressedColor: "#598d65"
                        activeColor: "#79ad85"

                        onClicked: sddm.login(name.text, password.text, sessionIndex)

                        KeyNavigation.backtab: layoutBox; KeyNavigation.tab: shutdownButton
                    }

                    Button {
                        id: shutdownButton
                        text: textConstants.shutdown
                        width: parent.btnWidth
                        color: "#b75d5a"
                        pressedColor: "#a74d4a"
                        activeColor: "#c76d6a"

                        onClicked: sddm.powerOff()

                        KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
                    }

                    Button {
                        id: rebootButton
                        text: textConstants.reboot
                        width: parent.btnWidth
                        color: "#a68f5e"
                        pressedColor: "#967f4e"
                        activeColor: "#b69f6e"

                        onClicked: sddm.reboot()

                        KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: name
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}