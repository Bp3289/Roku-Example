Function Init()

    ? "[GridScreen] Init"

    m.rowList = m.top.findNode("RowList")
    m.description = m.top.findNode("Description")
    m.background = m.top.findNode("Background")
    

    m.top.observeField("visible", "onVisibleChange")
    m.top.observeField("focusedChild", "OnFocusedChildChange")

End Function

Sub OnItemFocused()
    itemFocused = m.top.itemFocused


    if itemFocused.Count() = 2 then 
        focusedContent = m.top.content.getChild(itemFocused[0]).getChild(itemFocused[1])
        if focusedContent <> invalid then 
            m.top.focusedContent = focusedContent
            m.description.content = focusedContent
            m.background.uri = focusedContent.hdBackgroundImageUrl
        end if
    end if 

End Sub

Sub onVisibleChange()
    if m.top.visible = true then 
        m.rowList.setFocus(true)
    end if 
End Sub

Sub OnFocusedChildChange()
    if m.top.isInFocusChain() and not m.rowList.hasFocus() then 
        m.rowList.setFocus(true)
    end if
End Sub