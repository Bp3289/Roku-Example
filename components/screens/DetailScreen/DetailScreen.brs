Function Init()

    ? "[DetailScreen] Init"

    m.top.observeField("visible", "onVisibleChange")
    m.top.observeField("focusedChild", "OnFocusedChildChange")

    m.background = m.top.findNode("Background")
    m.buttons = m.top.findNode("Buttons")
    m.description = m.top.findNode("Description")
    m.videoPlayer = m.top.findNode("VideoPlayer")
    m.poster = m.top.findNode("Poster")


    result = []
    for each button in ["Play", "Second button"]
        result.push({title : button})
    end for
    m.buttons.content = ContentList2Node(result)
End Function

Sub onVisibleChange()
    ? "[DetailScreen] onVisibleChange"
    if m.top.visible = true then 
        m.buttons.jumpToItem = 0
        m.buttons.setFocus(true)

    else 
        m.videoPlayer.visible = false
        m.videoPlayer.control = "stop"
        m.poster.uri=""
        m.background.uri=""
    end if
End Sub

Sub OnFocusedChildChange()
    if m.top.isInFocusChain() and not m.buttons.hasFocus() and not m.videoPlayer.hasFocus() then 
        m.buttons.setFocus(true)
    end if
End Sub

Sub onVideoVisibleChange()
    if m.videoPlayer.visible = false and m.top.visible = true
        m.buttons.setFocus(true)
        m.videoPlayer.control = "stop"
    end if
End Sub

Sub onVideoPlayerStateChange()
    if m.videoPlayer.state = "error"
        m.videoPlayer.visible = false
    else if m.videoPlayer.state = "playing"
    
    else if m.videoPlayer.state = "finished"
        m.videoPlayer.visible = false

    end if 
End Sub

Sub onItemSelected()
    if m.top.itemSelected = 0
        m.videoPlayer.visible = true
        m.videoPlayer.setFocus(true)
        m.videoPlayer.control = "play"
        m.videoPlayer.observeField("state", "OnVideoPlayerStateChange")
    end if
End Sub

Sub OnContentChange()
    m.description.content = m.top.content
    m.description.Description.width = "770"
    m.videoPlayer.content = m.top.content
    m.top.streamUrl = m.top.content.url 
    m.poster.uri = m.top.content.hdBackgroundImageUrl
    m.background.uri = m.top.content.hdBackgroundImageUrl
End Sub

Function ContentList2Node(contentList as Object, nodeType = "ContentNode" as String) as Object
    result = CreateObject("roSGNode", nodeType)
    if result <> invalid
        for each items in contentList
            item = CreateObject("roSGNode", nodeType)
            item.setFields(items)
            result.appendChild(item)
        end for
    end if
    return result
end Function
