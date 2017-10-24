Function Init()
    ? "[HomeScene] Init"

    m.gridScreen = m.top.findNode("GridScreen")

    m.top.observeField("rowItemSelected", "OnRowItemSelected")

End Function

Function OnChangeContent()
    m.gridScreen.setFocus(true)
End Function

Function OnRowItemSelected()

    m.gridScreen.visible = "false"
End Function

Function onKeyEvent(key, press) as Boolean
    ? ">>> HomeScene >> OnKeyEvent"
    result = false
    if press then
        if key = "options"
        else if key = "back"

        end if
    end if 
    return result 
End Function 