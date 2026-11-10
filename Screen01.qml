import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    id: root
    anchors.fill: parent

    // =========================================================
    // THEME SYSTEM
    // =========================================================
    property bool darkTheme: true

    // Dark palette
    readonly property color darkBg:            "#080D13"
    readonly property color darkPanel:         "#161829"
    readonly property color darkPanelAlt:      "#1C1F36"
    readonly property color darkHeader:        "#2E3154"
    readonly property color darkBorder:        "#4E5383"
    readonly property color darkAccent:        "#C2D0F6"
    readonly property color darkText:          "#E5DBFF"
    readonly property color darkTextMuted:     "#8674CC"
    readonly property color darkTextSecondary: "#D6C7FF"
    readonly property color darkDanger:        "#733535"
    readonly property color darkSuccess:       "#C2D0F6"
    readonly property color darkOverlay:       "#000000"

    // Light palette
    readonly property color lightBg:            "#F0F4F8"
    readonly property color lightPanel:         "#FFFFFF"
    readonly property color lightPanelAlt:      "#F8FAFC"
    readonly property color lightHeader:        "#E2E8F0"
    readonly property color lightBorder:        "#CBD5E1"
    readonly property color lightAccent:        "#3B82F6"
    readonly property color lightText:          "#0F172A"
    readonly property color lightTextMuted:     "#64748B"
    readonly property color lightTextSecondary: "#334155"
    readonly property color lightDanger:        "#DC2626"
    readonly property color lightSuccess:       "#2563EB"
    readonly property color lightOverlay:       "#000000"

    // Active theme colors (bound)
    property color cBg:            darkTheme ? darkBg            : lightBg
    property color cPanel:         darkTheme ? darkPanel         : lightPanel
    property color cPanelAlt:      darkTheme ? darkPanelAlt      : lightPanelAlt
    property color cHeader:        darkTheme ? darkHeader        : lightHeader
    property color cBorder:        darkTheme ? darkBorder        : lightBorder
    property color cAccent:        darkTheme ? darkAccent        : lightAccent
    property color cText:          darkTheme ? darkText          : lightText
    property color cTextMuted:     darkTheme ? darkTextMuted     : lightTextMuted
    property color cTextSecondary: darkTheme ? darkTextSecondary : lightTextSecondary
    property color cDanger:        darkTheme ? darkDanger        : lightDanger
    property color cSuccess:       darkTheme ? darkSuccess       : lightSuccess
    property color cOverlay:       darkTheme ? darkOverlay       : lightOverlay

    // =========================================================
    // DATA (kept from original)
    // =========================================================
    property int indexOcorrenciaSelecionada: 0
    property string idOcorrenciaAtiva: modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).idOcorrencia : "-"
    property string nomeProcurado:     modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).nome : "Nenhuma ocorrência"
    property string statusProcurado:   modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).situacao : "-"
    property string similaridade:      modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).sim : "-"
    property string localDetectado:    modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).local : "-"
    property string dataHora:          modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).dataHora : "-"
    property string idadeProcurado:    modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).idade : "-"
    property string crimeProcurado:    modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).crime : "-"
    property string cameraDetectada:   modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).cam : "-"
    property string ocorrenciaStatus:  modeloOcorrencias.count > 0 ? modeloOcorrencias.get(indexOcorrenciaSelecionada).status : "-"

    // =========================================================
    // BACKGROUND
    // =========================================================
    Rectangle {
        anchors.fill: parent
        color: cBg
        z: 0
    }

    Image {
        id: bgImageSource
        anchors.fill: parent
        source: "https://www.espacohausimoveis.com.br/blog/wp-content/uploads/2024/05/53439242167_0bcfe4efd5_k.jpg"
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    FastBlur {
        id: bgBlur
        anchors.fill: parent
        source: bgImageSource
        radius: 40
        cached: true
        z: 1
        opacity: darkTheme ? 1.0 : 0.35
    }

    Rectangle {
        anchors.fill: parent
        color: darkTheme ? "#000000" : "#FFFFFF"
        opacity: darkTheme ? 0.75 : 0.55
        z: 2
    }

    // =========================================================
    // MOCK DATA
    // =========================================================
    ListModel {
        id: modeloOcorrencias
        ListElement {
            idOcorrencia: "ID 37"
            nome: "Gustavo Henrique"
            sim: "58.76%"
            cam: "CAM-001"
            idade: "19 anos"
            situacao: "SUSPEITO"
            crime: "Roubo — SIMULAÇÃO"
            local: "Faculdade"
            status: "PENDING"
            dataHora: "2026-10-29 19:23:24.868966"
        }
    }

    ListModel {
        id: modeloCadastrados
        ListElement { idCad: "2"; nome: "Gabriel Ferro"; idade: "21"; situacao: "SUSPEITO"; cadastro: "ATIVO"; descricao: "Suspeito de furto na região central" }
        ListElement { idCad: "1"; nome: "Gustavo Henrique"; idade: "19"; situacao: "SUSPEITO"; cadastro: "ATIVO"; descricao: "Roubo — SIMULAÇÃO" }
        ListElement { idCad: "3"; nome: "Henrique Keller"; idade: "47"; situacao: "PROCURADO"; cadastro: "ATIVO"; descricao: "Mandado de prisão em aberto" }
    }

    ListModel {
        id: modeloHistorico
        ListElement { idOcorrencia: "35"; dataHora: "16/10/2026 19:47:11"; pessoa: "Gustavo Henrique"; camera: "CAM-001"; similaridade: "86.42%"; status: "DISCARDED" }
        ListElement { idOcorrencia: "34"; dataHora: "16/10/2026 19:45:46"; pessoa: "Gustavo Henrique"; camera: "CAM-001"; similaridade: "92.03%"; status: "DISCARDED" }
        ListElement { idOcorrencia: "33"; dataHora: "16/10/2026 18:58:07"; pessoa: "Henrique Keller"; camera: "CAM-001"; similaridade: "97.90%"; status: "CONFIRMED" }
    }

    // =========================================================
    // LOGIC
    // =========================================================
    function responderOcorrencia(novoStatus) {
        if (modeloOcorrencias.count === 0) return

        var itemAtual = modeloOcorrencias.get(root.indexOcorrenciaSelecionada)
        var numId = itemAtual.idOcorrencia.replace("ID ", "")

        modeloHistorico.insert(0, {
            idOcorrencia: numId,
            dataHora: itemAtual.dataHora,
            pessoa: itemAtual.nome,
            camera: itemAtual.cam,
            similaridade: itemAtual.sim,
            status: novoStatus
        })

        modeloOcorrencias.remove(root.indexOcorrenciaSelecionada)
        if (root.indexOcorrenciaSelecionada >= modeloOcorrencias.count) {
            root.indexOcorrenciaSelecionada = Math.max(0, modeloOcorrencias.count - 1)
        }
    }

    // =========================================================
    // MAIN LAYOUT
    // =========================================================
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12
        z: 3

        // ---------- HEADER ----------
        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            RowLayout {
                spacing: 10

                Text {
                    text: "FACE-X"
                    color: cText
                    font.bold: true
                    font.pixelSize: 18
                }

                Image {
                    id: imgLogo
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    fillMode: Image.PreserveAspectFit
                    source: "Logo.png"
                }

                Text {
                    text: "Central verificação de ocorrências"
                    color: cTextMuted
                    font.pixelSize: 14
                }
            }

            Item { Layout.fillWidth: true }


            // Theme toggle button
            Rectangle {
                id: btnTheme
                Layout.preferredWidth: 110
                Layout.preferredHeight: 32
                radius: 8
                border.color: cBorder
                color: mouseTheme.containsMouse ? (darkTheme ? "#3D416E" : "#E2E8F0") : cHeader
                Behavior on color { ColorAnimation { duration: 150 } }

                Text {
                    anchors.centerIn: parent
                    text: darkTheme ? "CLARO" : "ESCURO"
                    color: cText
                    font.bold: true
                    font.pixelSize: 10
                }
                MouseArea {
                    id: mouseTheme
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.darkTheme = !root.darkTheme
                }
            }

            Text {
                text: modeloOcorrencias.count + " ocorrência(s) ativa(s)"
                color: darkTheme ? "#38bdf8" : "#0284C7"
                font.pixelSize: 13
            }
        }

        // ---------- CONTENT ----------
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 14

            // Left panel – Active occurrences
            Rectangle {
                Layout.preferredWidth: 360
                Layout.fillHeight: true
                color: darkTheme ? "#80101633" : "#FFFFFF"
                radius: 8
                border.color: cBorder

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 10

                    Text {
                        text: "OCORRÊNCIAS ATIVAS"
                        color: cTextSecondary
                        font.bold: true
                        font.pixelSize: 13
                    }

                    ListView {
                        id: listOcorrencias
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: modeloOcorrencias

                        delegate: Rectangle {
                            width: listOcorrencias.width
                            height: 38
                            color: root.indexOcorrenciaSelecionada === index
                                   ? (darkTheme ? "#2A2D48" : "#DBEAFE")
                                   : (darkTheme ? "#E6161829" : "#F1F5F9")
                            radius: 4
                            border.color: root.indexOcorrenciaSelecionada === index ? cBorder : "transparent"

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 8
                                spacing: 6

                                Text { text: model.idOcorrencia; color: darkTheme ? "#B89577" : "#B45309"; font.bold: true; font.pixelSize: 12 }
                                Text { text: "|"; color: darkTheme ? "#B9C278" : "#94A3B8" }
                                Text { text: model.nome; color: darkTheme ? "#D9A173" : "#C2410C"; font.pixelSize: 12; Layout.fillWidth: true; elide: Text.ElideRight }
                                Text { text: "|"; color: darkTheme ? "#B9C278" : "#94A3B8" }
                                Text { text: model.sim; color: darkTheme ? "#A8184F" : "#BE123C"; font.pixelSize: 12 }
                                Text { text: "|"; color: darkTheme ? "#B9C278" : "#94A3B8" }
                                Text { text: model.cam; color: darkTheme ? "#D1BFFF" : "#7C3AED"; font.pixelSize: 12 }
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: root.indexOcorrenciaSelecionada = index
                            }
                        }
                    }
                }
            }

            // Center / Right content
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 12

                // Image panels
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 340
                    spacing: 14

                    // Reference photo
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: cHeader
                        radius: 8
                        border.color: cBorder

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 6

                            Text {
                                text: "FOTO DE REFERÊNCIA"
                                color: cTextSecondary
                                font.bold: true
                                font.pixelSize: 11
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: darkTheme ? "#0f172a" : "#F8FAFC"
                                radius: 4
                                clip: true

                                Image {
                                    id: imgReferencia
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                    source: ""
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Visualização Foto Referência"
                                    color: darkTheme ? "#475569" : "#94A3B8"
                                    font.pixelSize: 11
                                    visible: imgReferencia.status !== Image.Ready
                                }
                            }
                        }
                    }

                    // Captured frame
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: cHeader
                        radius: 8
                        border.color: cBorder

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 6

                            Text {
                                text: "FRAME CAPTURADO"
                                color: cTextSecondary
                                font.bold: true
                                font.pixelSize: 11
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                color: darkTheme ? "#0f172a" : "#F8FAFC"
                                radius: 4
                                clip: true

                                Image {
                                    id: imgCaptura
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                    source: ""
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: "Visualização Frame Capturado"
                                    color: darkTheme ? "#475569" : "#94A3B8"
                                    font.pixelSize: 11
                                    visible: imgCaptura.status !== Image.Ready
                                }
                            }
                        }
                    }
                }

                // Info panel
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    color: darkTheme ? "#D9161B33" : "#FFFFFF"
                    radius: 8
                    border.color: cBorder

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 14
                        spacing: 8

                        Text {
                            text: "INFORMAÇÕES DO PROCURADO"
                            color: cText
                            font.bold: true
                            font.pixelSize: 13
                        }

                        GridLayout {
                            columns: 4
                            rowSpacing: 8
                            columnSpacing: 16
                            Layout.fillWidth: true

                            Text { text: "Nome:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.nomeProcurado; color: cText; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Idade:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.idadeProcurado; color: cText; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Status:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.statusProcurado; color: darkTheme ? "#FF7878" : "#DC2626"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Crime:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.crimeProcurado; color: cText; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Similaridade:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.similaridade; color: darkTheme ? "#DB744F" : "#EA580C"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Câmera:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.cameraDetectada; color: cText; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Local:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.localDetectado; color: cText; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Ocorrência:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.ocorrenciaStatus; color: darkTheme ? "#B8914F" : "#B45309"; font.bold: true; font.pixelSize: 12 }

                            Text { text: "Detectado em:"; color: cTextSecondary; font.pixelSize: 12 }
                            Text { text: root.dataHora; color: cText; font.bold: true; font.pixelSize: 12; Layout.columnSpan: 3 }
                        }

                        Item { Layout.fillHeight: true }

                        // Action buttons
                        RowLayout {
                            spacing: 12
                            Layout.fillWidth: true

                            // Confirm
                            Rectangle {
                                id: btnConfirmarMain
                                Layout.preferredWidth: 130
                                Layout.preferredHeight: 36
                                radius: 8
                                border.color: cAccent
                                border.width: 1
                                color: modeloOcorrencias.count > 0
                                       ? (mouseConfirmarMain.pressed ? (darkTheme ? "#627BA1" : "#1D4ED8")
                                                                     : (mouseConfirmarMain.containsMouse ? (darkTheme ? "#A8CCFF" : "#60A5FA")
                                                                                                         : cAccent))
                                       : (darkTheme ? "#3A4252" : "#CBD5E1")

                                Behavior on color { ColorAnimation { duration: 150 } }

                                Text {
                                    anchors.centerIn: parent
                                    text: "CONFIRMAR"
                                    color: modeloOcorrencias.count > 0
                                           ? (darkTheme ? "#080D13" : "#FFFFFF")
                                           : (darkTheme ? "#8A94A6" : "#64748B")
                                    font.bold: true
                                    font.pixelSize: 12
                                }

                                MouseArea {
                                    id: mouseConfirmarMain
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: modeloOcorrencias.count > 0 ? Qt.PointingHandCursor : Qt.ArrowCursor
                                    onClicked: root.responderOcorrencia("CONFIRMED")
                                }
                            }

                            // Discard
                            Rectangle {
                                id: btnDescartarMain
                                Layout.preferredWidth: 130
                                Layout.preferredHeight: 36
                                radius: 8
                                border.color: cDanger
                                border.width: 1
                                color: modeloOcorrencias.count > 0
                                       ? (mouseDescartarMain.pressed ? (darkTheme ? "#A83D3D" : "#B91C1C")
                                                                     : (mouseDescartarMain.containsMouse ? (darkTheme ? "#C26D6D" : "#F87171")
                                                                                                         : cDanger))
                                       : (darkTheme ? "#3A4252" : "#CBD5E1")

                                Behavior on color { ColorAnimation { duration: 150 } }

                                Text {
                                    anchors.centerIn: parent
                                    text: "DESCARTAR"
                                    color: modeloOcorrencias.count > 0 ? cText : (darkTheme ? "#8A94A6" : "#64748B")
                                    font.bold: true
                                    font.pixelSize: 12
                                }

                                MouseArea {
                                    id: mouseDescartarMain
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: modeloOcorrencias.count > 0 ? Qt.PointingHandCursor : Qt.ArrowCursor
                                    onClicked: root.responderOcorrencia("DISCARDED")
                                }
                            }
                        }
                    }
                }
            }
        }

        // ---------- FOOTER ----------
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 34
            spacing: 10

            Text {
                text: "Central conectada — monitoramento ativo"
                color: cTextMuted
                font.pixelSize: 11
            }

            Item { Layout.fillWidth: true }

            // History button
            Rectangle {
                id: btnFooterHistorico
                Layout.preferredWidth: 180
                Layout.preferredHeight: 34
                radius: 8
                border.color: cBorder
                color: mouseFooterHistorico.pressed ? (darkTheme ? "#1E2038" : "#CBD5E1")
                                                    : (mouseFooterHistorico.containsMouse ? (darkTheme ? "#3D416E" : "#E2E8F0") : cHeader)
                Behavior on color { ColorAnimation { duration: 150 } }

                Text {
                    anchors.centerIn: parent
                    text: "HISTÓRICO DE OCORRÊNCIAS"
                    color: cText
                    font.bold: true
                    font.pixelSize: 10
                }
                MouseArea {
                    id: mouseFooterHistorico
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: modalHistorico.opacity = 1
                }
            }

            // Manage button
            Rectangle {
                id: btnFooterGerenciar
                Layout.preferredWidth: 160
                Layout.preferredHeight: 34
                radius: 8
                border.color: cBorder
                color: mouseFooterGerenciar.pressed ? (darkTheme ? "#1E2038" : "#CBD5E1")
                                                    : (mouseFooterGerenciar.containsMouse ? (darkTheme ? "#3D416E" : "#E2E8F0") : cHeader)
                Behavior on color { ColorAnimation { duration: 150 } }

                Text {
                    anchors.centerIn: parent
                    text: "GERENCIAR CADASTRADOS"
                    color: cText
                    font.bold: true
                    font.pixelSize: 10
                }
                MouseArea {
                    id: mouseFooterGerenciar
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: modalGerenciar.opacity = 1
                }
            }

            // Add Suspect button
            Rectangle {
                id: btnFooterAdicionar
                Layout.preferredWidth: 150
                Layout.preferredHeight: 34
                radius: 8
                border.color: cAccent
                color: mouseFooterAdicionar.pressed ? (darkTheme ? "#8AA1D8" : "#1D4ED8")
                                                    : (mouseFooterAdicionar.containsMouse ? (darkTheme ? "#DBE4FB" : "#60A5FA") : cAccent)
                Behavior on color { ColorAnimation { duration: 150 } }

                Text {
                    anchors.centerIn: parent
                    text: "ADICIONAR SUSPEITO"
                    color: darkTheme ? "#080D13" : "#FFFFFF"
                    font.bold: true
                    font.pixelSize: 10
                }
                MouseArea {
                    id: mouseFooterAdicionar
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: modalAdicionar.opacity = 1
                }
            }
        }
    }

    // =========================================================
    // MODAL 1: ADICIONAR SUSPEITO
    // =========================================================
    Item {
        id: modalAdicionar
        anchors.fill: parent
        z: 10000
        opacity: 0
        visible: opacity > 0
        Behavior on opacity { NumberAnimation { duration: 200 } }

        // Overlay
        Rectangle {
            anchors.fill: parent
            color: cOverlay
            opacity: 0.8
        }
        MouseArea { anchors.fill: parent; onClicked: modalAdicionar.opacity = 0 }

        // Dialog
        Rectangle {
            width: 480
            height: 520
            anchors.centerIn: parent
            color: cPanel
            border.color: cBorder
            radius: 8
            scale: modalAdicionar.opacity > 0 ? 1.0 : 0.8
            Behavior on scale {
                NumberAnimation {
                    duration: 350
                    easing.type: Easing.OutBack
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 18
                spacing: 10

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "FACE-X — Adicionar suspeito"; color: cTextSecondary; font.pixelSize: 11 }
                    Item { Layout.fillWidth: true }
                    Text {
                        text: "✕"
                        color: cTextSecondary
                        font.pixelSize: 14
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modalAdicionar.opacity = 0
                        }
                    }
                }

                ColumnLayout {
                    spacing: 4
                    Layout.alignment: Qt.AlignHCenter
                    Text {
                        text: "ADICIONAR SUSPEITO"
                        color: cText
                        font.bold: true
                        font.pixelSize: 17
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Text {
                        text: "Preencha os dados e selecione uma foto frontal nítida."
                        color: cTextMuted
                        font.pixelSize: 11
                        Layout.alignment: Qt.AlignHCenter
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    ColumnLayout {
                        spacing: 4
                        Layout.fillWidth: true
                        Text { text: "Nome completo"; color: cText; font.pixelSize: 11; font.bold: true }
                        TextField {
                            id: addNome
                            Layout.fillWidth: true
                            Layout.preferredHeight: 34
                            color: cText
                            background: Rectangle {
                                color: cHeader
                                radius: 4
                                border.color: cBorder
                            }
                        }
                    }

                    ColumnLayout {
                        spacing: 4
                        Layout.fillWidth: true
                        Text { text: "Idade"; color: cText; font.pixelSize: 11; font.bold: true }
                        TextField {
                            id: addIdade
                            Layout.fillWidth: true
                            Layout.preferredHeight: 34
                            color: cText
                            background: Rectangle {
                                color: cHeader
                                radius: 4
                                border.color: cBorder
                            }
                        }
                    }

                    ColumnLayout {
                        spacing: 4
                        Layout.fillWidth: true
                        Text { text: "Situação"; color: cText; font.pixelSize: 11; font.bold: true }
                        ComboBox {
                            id: addSituacao
                            Layout.fillWidth: true
                            Layout.preferredHeight: 34
                            model: ["SUSPEITO", "PROCURADO"]
                        }
                    }

                    ColumnLayout {
                        spacing: 4
                        Layout.fillWidth: true
                        Text { text: "Descrição / ocorrência associada"; color: cText; font.bold: true; font.pixelSize: 11 }
                        TextField {
                            id: addDescricao
                            Layout.fillWidth: true
                            Layout.preferredHeight: 34
                            color: cText
                            background: Rectangle {
                                color: cHeader
                                radius: 4
                                border.color: cBorder
                            }
                        }
                    }

                    ColumnLayout {
                        spacing: 4
                        Layout.fillWidth: true
                        Text { text: "Foto de referência"; color: cText; font.bold: true; font.pixelSize: 11 }
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 8
                            TextField {
                                id: addFotoPath
                                Layout.fillWidth: true
                                Layout.preferredHeight: 34
                                placeholderText: "Caminho da foto..."
                                color: cText
                                background: Rectangle {
                                    color: cHeader
                                    radius: 4
                                    border.color: cBorder
                                }
                            }

                            Rectangle {
                                id: btnModalEscolher
                                Layout.preferredWidth: 90
                                Layout.preferredHeight: 34
                                radius: 8
                                color: mouseModalEscolher.pressed ? (darkTheme ? "#52448A" : "#1D4ED8")
                                                                  : (mouseModalEscolher.containsMouse ? (darkTheme ? "#9A8AE0" : "#60A5FA")
                                                                                                      : (darkTheme ? "#8674CC" : cAccent))
                                Behavior on color { ColorAnimation { duration: 150 } }

                                Text {
                                    anchors.centerIn: parent
                                    text: "ESCOLHER"
                                    color: "#FFFFFF"
                                    font.bold: true
                                    font.pixelSize: 11
                                }
                                MouseArea {
                                    id: mouseModalEscolher
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: addFotoPath.text = "C:/Imagens/foto.jpg"   // replace with real file dialog
                                }
                            }
                        }
                    }
                }

                Text {
                    text: "Use somente imagens autorizadas para os testes."
                    color: cTextMuted
                    font.pixelSize: 10
                }

                Item { Layout.fillHeight: true }

                RowLayout {
                    Layout.fillWidth: true

                    Rectangle {
                        id: btnModalCancelar
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 34
                        radius: 8
                        border.color: cDanger
                        color: mouseModalCancelar.pressed ? (darkTheme ? "#522525" : "#B91C1C")
                                                          : (mouseModalCancelar.containsMouse ? (darkTheme ? "#8F4242" : "#F87171") : cDanger)
                        Behavior on color { ColorAnimation { duration: 150 } }

                        Text {
                            anchors.centerIn: parent
                            text: "CANCELAR"
                            color: cText
                            font.bold: true
                            font.pixelSize: 11
                        }
                        MouseArea {
                            id: mouseModalCancelar
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modalAdicionar.opacity = 0
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Rectangle {
                        id: btnModalSalvar
                        Layout.preferredWidth: 140
                        Layout.preferredHeight: 34
                        radius: 8
                        color: mouseModalSalvar.pressed ? (darkTheme ? "#8AA1D8" : "#1D4ED8")
                                                        : (mouseModalSalvar.containsMouse ? (darkTheme ? "#DBE4FB" : "#60A5FA") : cAccent)
                        Behavior on color { ColorAnimation { duration: 150 } }

                        Text {
                            anchors.centerIn: parent
                            text: "SALVAR CADASTRO"
                            color: darkTheme ? "#080D13" : "#FFFFFF"
                            font.bold: true
                            font.pixelSize: 11
                        }
                        MouseArea {
                            id: mouseModalSalvar
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                var nomeCad = addNome.text !== "" ? addNome.text : "Novo Suspeito"
                                var idadeCad = addIdade.text !== "" ? addIdade.text : "20"
                                var idNovo = (modeloCadastrados.count + 1).toString()

                                modeloCadastrados.append({
                                    idCad: idNovo,
                                    nome: nomeCad,
                                    idade: idadeCad,
                                    situacao: addSituacao.currentText,
                                    cadastro: "ATIVO",
                                    descricao: addDescricao.text
                                })

                                addNome.text = ""
                                addIdade.text = ""
                                addDescricao.text = ""
                                addFotoPath.text = ""
                                modalAdicionar.opacity = 0
                            }
                        }
                    }
                }
            }
        }
    }

    // =========================================================
    // MODAL 2: GERENCIAR CADASTRADOS
    // =========================================================
    Item {
        id: modalGerenciar
        anchors.fill: parent
        z: 10000
        opacity: 0
        visible: opacity > 0
        Behavior on opacity { NumberAnimation { duration: 200 } }

        property int indiceSelecionado: -1

        function aplicarFiltro() {
            modeloFiltrado.clear()
            var filtro = comboFiltro.currentText
            for (var i = 0; i < modeloCadastrados.count; i++) {
                var item = modeloCadastrados.get(i)
                if (filtro === "TODOS" || item.situacao === filtro) {
                    modeloFiltrado.append({
                        idCad: item.idCad,
                        nome: item.nome,
                        idade: item.idade,
                        situacao: item.situacao,
                        cadastro: item.cadastro,
                        descricao: item.descricao,
                        indexOriginal: i
                    })
                }
            }
            modalGerenciar.indiceSelecionado = -1
        }

        onVisibleChanged: {
            if (visible) aplicarFiltro()
        }

        // Overlay
        Rectangle {
            anchors.fill: parent
            color: cOverlay
            opacity: 0.8
        }
        MouseArea { anchors.fill: parent; onClicked: modalGerenciar.opacity = 0 }

        // Dialog
        Rectangle {
            width: 1080
            height: 580
            anchors.centerIn: parent
            color: cPanel
            border.color: cBorder
            radius: 8
            scale: modalGerenciar.opacity > 0 ? 1.0 : 0.8
            Behavior on scale {
                NumberAnimation {
                    duration: 350
                    easing.type: Easing.OutBack
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 12

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Face-X — Gerenciar cadastrados"; color: cTextSecondary; font.pixelSize: 11 }
                    Item { Layout.fillWidth: true }
                    Text {
                        text: "✕"
                        color: cTextSecondary
                        font.pixelSize: 14
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modalGerenciar.opacity = 0
                        }
                    }
                }

                ColumnLayout {
                    spacing: 2
                    Text {
                        text: "GERENCIAR CADASTRADOS"
                        color: cText
                        font.bold: true
                        font.pixelSize: 16
                    }
                    Text {
                        text: "Edite os dados ou desative temporariamente um cadastro do banco de dados."
                        color: cTextMuted
                        font.pixelSize: 11
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 16

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: 8

                        Text {
                            text: "PESSOAS CADASTRADAS"
                            color: cText
                            font.bold: true
                            font.pixelSize: 11
                        }

                        RowLayout {
                            spacing: 8
                            Text { text: "Exibir:"; color: cTextSecondary; font.pixelSize: 11 }
                            ComboBox {
                                id: comboFiltro
                                Layout.preferredWidth: 140
                                Layout.preferredHeight: 28
                                model: ["TODOS", "SUSPEITO", "PROCURADO"]
                                onCurrentTextChanged: modalGerenciar.aplicarFiltro()
                            }
                        }

                        ListModel { id: modeloFiltrado }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: darkTheme ? "#080D13" : "#F8FAFC"
                            border.color: cBorder
                            radius: 4

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 0

                                // Table header
                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 34
                                    color: cHeader

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 12
                                        anchors.rightMargin: 12
                                        spacing: 10

                                        Text { text: "ID"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 35 }
                                        Text { text: "Nome"; color: cText; font.bold: true; font.pixelSize: 11; Layout.fillWidth: true }
                                        Text { text: "Idade"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 45 }
                                        Text { text: "Situação"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 90 }
                                        Text { text: "Cadastro"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 80 }
                                    }
                                }

                                ListView {
                                    id: listCadastrados
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    clip: true
                                    model: modeloFiltrado

                                    delegate: Rectangle {
                                        width: listCadastrados.width
                                        height: 36
                                        color: modalGerenciar.indiceSelecionado === index
                                               ? (darkTheme ? "#4E5383" : "#DBEAFE")
                                               : (index % 2 === 0 ? cPanel : cPanelAlt)

                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.leftMargin: 12
                                            anchors.rightMargin: 12
                                            spacing: 10

                                            Text { text: model.idCad; color: darkTheme ? "#B89577" : "#B45309"; font.pixelSize: 11; Layout.preferredWidth: 35 }
                                            Text { text: model.nome; color: cText; font.bold: true; font.pixelSize: 11; Layout.fillWidth: true }
                                            Text { text: model.idade; color: cText; font.pixelSize: 11; Layout.preferredWidth: 45 }
                                            Text {
                                                text: model.situacao
                                                color: model.situacao === "PROCURADO"
                                                       ? (darkTheme ? "#FF7878" : "#DC2626")
                                                       : (darkTheme ? "#D9A173" : "#C2410C")
                                                font.bold: true
                                                font.pixelSize: 11
                                                Layout.preferredWidth: 90
                                            }
                                            Text { text: model.cadastro; color: darkTheme ? "#B9C278" : "#16A34A"; font.pixelSize: 11; Layout.preferredWidth: 80 }
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: modalGerenciar.indiceSelecionado = index
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // =========================================================
    // MODAL 3: HISTÓRICO DE OCORRÊNCIAS
    // =========================================================
    Item {
        id: modalHistorico
        anchors.fill: parent
        z: 10000
        opacity: 0
        visible: opacity > 0
        Behavior on opacity { NumberAnimation { duration: 200 } }

        // Overlay
        Rectangle {
            anchors.fill: parent
            color: cOverlay
            opacity: 0.8
        }
        MouseArea { anchors.fill: parent; onClicked: modalHistorico.opacity = 0 }

        // Dialog
        Rectangle {
            width: 850
            height: 500
            anchors.centerIn: parent
            color: cPanel
            border.color: cBorder
            radius: 8
            scale: modalHistorico.opacity > 0 ? 1.0 : 0.8
            Behavior on scale {
                NumberAnimation {
                    duration: 350
                    easing.type: Easing.OutBack
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 18
                spacing: 12

                RowLayout {
                    Layout.fillWidth: true
                    Text { text: "Face-X — Histórico de Ocorrências"; color: cTextSecondary; font.pixelSize: 11 }
                    Item { Layout.fillWidth: true }
                    Text {
                        text: "✕"
                        color: cTextSecondary
                        font.pixelSize: 14
                        font.bold: true
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: modalHistorico.opacity = 0
                        }
                    }
                }

                Text {
                    text: "HISTÓRICO DE REGISTROS"
                    color: cText
                    font.bold: true
                    font.pixelSize: 16
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: darkTheme ? "#080D13" : "#F8FAFC"
                    border.color: cBorder
                    radius: 4

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 0

                        // Header
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 34
                            color: cHeader

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 12
                                anchors.rightMargin: 12
                                spacing: 10

                                Text { text: "ID"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 40 }
                                Text { text: "Data / Hora"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 140 }
                                Text { text: "Pessoa"; color: cText; font.bold: true; font.pixelSize: 11; Layout.fillWidth: true }
                                Text { text: "Câmera"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 70 }
                                Text { text: "Sim."; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 60 }
                                Text { text: "Status"; color: cText; font.bold: true; font.pixelSize: 11; Layout.preferredWidth: 90 }
                            }
                        }

                        ListView {
                            id: listHistorico
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true
                            model: modeloHistorico

                            delegate: Rectangle {
                                width: listHistorico.width
                                height: 34
                                color: index % 2 === 0 ? cPanel : cPanelAlt

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.leftMargin: 12
                                    anchors.rightMargin: 12
                                    spacing: 10

                                    Text { text: model.idOcorrencia; color: darkTheme ? "#B89577" : "#B45309"; font.pixelSize: 11; Layout.preferredWidth: 40 }
                                    Text { text: model.dataHora; color: cText; font.pixelSize: 11; Layout.preferredWidth: 140 }
                                    Text { text: model.pessoa; color: darkTheme ? "#D9A173" : "#C2410C"; font.bold: true; font.pixelSize: 11; Layout.fillWidth: true }
                                    Text { text: model.camera; color: darkTheme ? "#D1BFFF" : "#7C3AED"; font.pixelSize: 11; Layout.preferredWidth: 70 }
                                    Text { text: model.similaridade; color: darkTheme ? "#DB744F" : "#EA580C"; font.pixelSize: 11; Layout.preferredWidth: 60 }
                                    Text {
                                        text: model.status
                                        color: model.status === "CONFIRMED"
                                               ? (darkTheme ? "#C2D0F6" : "#2563EB")
                                               : (darkTheme ? "#FF7878" : "#DC2626")
                                        font.bold: true
                                        font.pixelSize: 11
                                        Layout.preferredWidth: 90
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
