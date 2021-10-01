
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.0

import Phase 1.0
import Phase.Misc 1.0 as PMisc
import PhaseControl 1.0 as PControl

Item {
    id: main

    Material.theme: Material.Dark
    Material.accent: "#0471a9" //"#31c8a9"
    Material.foreground: "#e5e5e5"

    anchors.fill: parent

    function takeScreenshot() {
        fileDialog.open();
    }

    FileDialog {
        id: fileDialog

        fileMode: FileDialog.SaveFile
        onAccepted: {
            grabber.grab(body, Qt.size(650, 1004));
        }
    }

    PMisc.ItemGrabber {
        id: grabber

        onGrabbed: {
            if (grabber.save(fileDialog.file.toLocaleString().replace("file://", ""))) {
                Qt.openUrlExternally(fileDialog.file.toLocaleString());
            }
        }
    }

    PControl.PageBrowser {
        id: body

        anchors.fill: parent

        initialPageName: "HomePage"

        PControl.Page {
            pageName: "HomePage"
            
            
            Rectangle {
                anchors.fill: parent
                color: "#303030"
            }

            Control {
                anchors.left: parent.left
                anchors.right: parent.right

                padding: mm(6)

                contentItem: Item {
                    Row {
                        spacing: mm(2)

                        PControl.RoundButton {
                            flat: true
                            glyph: "fa-solid-bars"

                            onClicked: {
                                PControl.PageBrowser.view.back();
                            }
                        }

                        PControl.Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "PhaseArt"
                            font.letterSpacing: mm(1.5)
                            font.capitalization: Font.AllUppercase
                        }
                    }

                    Row {
                        anchors.right: parent.right
                        spacing: mm(2)

                        PControl.RoundButton {
                            flat: true
                            glyph: "fa-solid-search"
                        }
                    }
                }
            }

            Button {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                background: Item {}
                
                contentItem: Image {
                    anchors.left: parent.left
                    anchors.right: parent.right

                    source: "phaseart_short_logo.svg"
                    fillMode: Image.PreserveAspectFit
                }

                onClicked: {
                    PControl.PageBrowser.view.append("CardPage");
                }
            }
        }

        PControl.Page {
            pageName: "CardPage"
            
            Rectangle {
                anchors.fill: parent
                color: "#303030"
            }

            Pane {
                id: header

                anchors.left: parent.left
                anchors.right: parent.right
                height: main.height * 0.4

                padding: 0

                Material.elevation: 4

                Image {
                    anchors.fill: parent
                    source: "back.png"
                    fillMode: Image.PreserveAspectCrop

                    Rectangle {
                        anchors.fill: parent
                        color: "#000"
                        opacity: 0.3
                    }
                }

                Control {
                    anchors.left: parent.left
                    anchors.right: parent.right

                    padding: mm(6)

                    contentItem: Row {
                        spacing: mm(2)

                        PControl.RoundButton {
                            flat: true
                            glyph: "fa-solid-arrow-left"
                            //color: Material.accent

                            onClicked: {
                                PControl.PageBrowser.view.back();
                            }
                        }

                        PControl.Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "PhaseArt"
                            //color: Material.accent
                            font.letterSpacing: mm(1.5)
                            //font.bold: true
                            font.capitalization: Font.AllUppercase
                        }
                    }
                }
            }

            Column {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: header.bottom
                anchors.margins: mm(8)
                spacing: mm(6)

                Column {
                    PControl.Text {
                        text: "Emmanuel Pouthier"
                        font.bold: true
                        font.pixelSize: pt(12)
                    }

                    PControl.Text {
                        text: "Développeur d'applications et de sites web"
                        font.pixelSize: pt(10)
                    }
                }

                Column {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: mm(4)

                    PControl.GlyphLabel {
                        spacing: mm(4)
                        glyph: "fa-solid-phone"
                        glyphColor: Material.accent
                        glyphPixelSize: pt(12)
                        text: "06 03 21 23 98"
                    }

                    PControl.GlyphLabel {
                        spacing: mm(4)
                        glyph: "fa-solid-envelope"
                        glyphColor: Material.accent
                        glyphPixelSize: pt(12)
                        text: "emmanuel.pouthier@gmail.com"
                    }

                    PControl.GlyphLabel {
                        spacing: mm(4)
                        glyph: "fa-solid-map-signs"
                        glyphColor: Material.accent
                        glyphPixelSize: pt(12)
                        text: "41 rue de Ribas\n06620 Gréolières"
                    }
                }
            }
        }
    }

    Column {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: mm(6)
        anchors.rightMargin: mm(4)
        spacing: mm(1)

        PControl.Button {
            anchors.right: parent.right
            highlighted: true
            glyph: "fa-solid-expand-arrows-alt"
            text: "Card size"
            onClicked: {
                ApplicationWindow.window.width = 650 / 1.42;
                ApplicationWindow.window.height = 1004 / 1.42;
            }
        }

        PControl.Button {
            anchors.right: parent.right
            highlighted: true
            glyph: "fa-solid-camera-retro"
            text: "Take screenshot"
            onClicked: {
                takeScreenshot();
            }
        }

        PControl.Button {
            anchors.right: parent.right
            highlighted: true
            glyph: "fa-brands-linkedin"
            text: "LinkedIn"
            onClicked: {
                Qt.openUrlExternally("https://www.linkedin.com/in/emmanuel-pouthier-49162757/")
            }
        }
    }
}

