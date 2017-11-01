Sub Init()

    m.background = m.top.findNode("background")
    m.oldBackground = m.top.findNode("oldBackground")
    m.oldbackgroundInterpolator = m.top.findNode("oldbackgroundInterpolator")
    m.shade = m.top.findNode("shade")
    m.fadeoutAnimation = m.top.findNode("fadeoutAnimation")
    m.fadeinAnimation = m.top.findNode("fadeinAnimation")
    m.backgroundColor = m.top.findNode("backgroundColor")

    m.background.observeField("bitmapWidth", "OnBackgroundLoaded")
    m.top.observeField("width", "OnSizeChange")
    m.top.observeField("height", "OnSizeChange")

End Sub

Sub OnBackgroundUriChange()

    oldUrl = m.background.uri 
    m.background.uri = m.top.uri
    if oldUrl <> "" then 
        m.oldBackground.uri = oldUrl
        m.oldbackgroundInterpolator = [m.background.opacity, 0]
        m.fadeoutAnimation.control = "start"
    end if
End Sub

Sub OnSizeChange()

    size = m.top.size

    m.background.width = m.top.width
    m.oldBackground.width = m.top.width
    m.shade.width = m.top.width
    m.backgroundColor.width = m.top.width

    m.oldBackground.height = m.top.height
    m.oldBackground.height = m.top.height
    m.shade.height = m.top.height
    m.backgroundColor.height = m.top.height
End Sub 

Sub OnBackgroundLoaded()
    m.fadeinAnimation.control = "start"
End Sub 
