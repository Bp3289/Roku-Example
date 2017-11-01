Sub RunUserInterface()
    screen = CreateObject("roSGScreen")
    scene = screen.CreateScene("HomeScene")
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)
    screen.Show()

    oneRow = GetApiArray()
    list =  [
        {
            TITLE: "First Row"
            ContentList : oneRow
        }
    ]
    scene.gridContent = ParseXMLContent(list)

    while true 
        msg = wait(0, port)
        print "-------------------"
        print "msg = "; msg
    end while

    if screen <> invalid then 
        screen.Close()
        screen = invalid
    end if
End Sub

Function ParseXMLContent(list as Object)
    RowItems = CreateObject("RoSGNode", "ContentNode")

    for each rows in list 

        row = CreateObject("ROSGNode", "ContentNode")
        row.TITLE = rows.Title 

        for each items in rows.ContentList
            item = CreateObject("RoSGNode", "ContentNode")

            for each key in items 
                item[key] = items[key]
            end for
            row.appendChild(item)
        end for
        RowItems.appendChild(row)
    end for

    return RowItems
End Function


Function GetApiArray()
    url = CreateObject("roUrlTransfer")
    url.SetUrl("http://api.delvenetworks.com/rest/organizations/59021fabe3b645968e382ac726cd6c7b/channels/1cfd09ab38e54f48be8498e0249f5c83/media.rss")
    rsp = url.GetToString()

    responseXML = ParseXML(rsp)
    responseXML = responseXML.GetChildElements()
    responseArray = responseXML.GetChildElements()

    result = []

    for each xmlItem in responseArray
        if xmlItem.getName() = "item"
            items = xmlItem.GetChildElements()
            if items <> invalid
                item = {}
                for each xmlItem in items
                    item[xmlItem.getName()] = xmlItem.getText()
                    if xmlItem.getName() = "media:content"
                        item.stream = {url : xmlItem.url}
                        item.url = xmlItem.getAttributes().url
                        item.streamFormat = "mp4"

                        mediaContent = xmlItem.GetChildElements()
                        for each mediaContentItem in mediaContent
                            if mediaContentItem.getName() = "media:thumbnail"
                                item.HDPosterUrl = mediaContentItem.getAttributes().url
                                item.hdBackgroundImageUrl = mediaContentItem.getAttributes().url
                            end if 
                        end for
                    end if 
                end for
                result.push(item)
            end if 
        end if
    end for 

    return result
End Function

Function ParseXML(str as String) As dynamic
    if str = invalid return invalid
    xml=CreateObject("roXMLElement")
    if not xml.Parse(str) return invalid
    return xml
End Function