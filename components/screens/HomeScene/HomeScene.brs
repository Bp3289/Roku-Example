Function Init()
    ? "[HomeScene] Init"

    m.gridScreen = m.top.findNode("GridScreen")

    m.detailScreen = m.top.findNode("DetailScreen")

    m.top.observeField("rowItemSelected", "OnRowItemSelected")

End Function

Function OnChangeContent()
    m.gridScreen.setFocus(true)
End Function

Function OnRowItemSelected()

     m.gridScreen.visible = "false"
    m.detailScreen.content = m.gridScreen.focusedContent
    m.detailScreen.setFocus(true)
    m.detailScreen.visible = "true"
End Function

Function onKeyEvent(key, press) as Boolean
    ? ">>> HomeScene >> OnkeyEvent"
    result = false
    if press then
        if key = "options"

        else if key = "back"

            if m.gridScreen.visible = false and m.detailScreen.videoPlayerVisible = false
                m.gridScreen.visible = "true"
                m.detailScreen.visible = "false"
                m.gridScreen.setFocus(true)
                result = true

            ' if video player opened
            else if m.gridScreen.visible = false and m.detailScreen.videoPlayerVisible = true
                m.gridScreen.visible = "true"
                m.detailScreen.visible = "false"
                m.gridScreen.setFocus(true)
                result = true
            end if

        end if
    end if 
    return result 
End Function 