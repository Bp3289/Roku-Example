Sub Init()
    m.top.Title = m.top.findNode("Title")
    m.top.Description = m.top.findNode("Description")
    m.top.ReleaseDate = m.top.findNode("ReleaseDate")
End Sub


Sub OnContentChanged()

    item = m.top.content 

    title = item.title.toStr()
    if title <> invalid then 
        m.top.Title.text = title.toStr()
    end if 

    value = item.description 
    if value <> invalid then 
        if value.toStr() <> "" then 
            m.top.Description.text = value.toStr()
        else
            m.top.Description.text = "No Description"
        end if 
    end if 

    value = item.ReleaseDate
    if value <> invalid then 
        if value <> ""
            m.top.ReleaseDate.text = value.toStr()
        else
            m.top.ReleaseDate.text = "No release date"
        end if 
    end if 
End Sub 