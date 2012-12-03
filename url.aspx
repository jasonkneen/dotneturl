
<%
	' Call from Classic ASP using:-

	' Dim objXMLHTTP : Set objXMLHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP.6.0")
	' objXMLHTTP.Open "GET", "http://tweet4.me/url.aspx?get=" & server.urlencode(url), False

	' This was a VERY quick workaround to issue with the Classic ASP
	' oAuth library with the Twitter API changes implmented around 1st Dec 2012.

	dim sGet as string = server.urldecode(request.querystring("get"))
	dim sPost as string = server.urldecode(request.querystring("post"))
	dim surl as string

	if sPost <>"" then 
		surl = sPost
	elseif sGet <> "" then
		surl = sGet
	else
		surl = sGet
	end if

	Dim urlrequest As System.Net.HttpWebRequest = System.Net.HttpWebRequest.Create(sUrl)

	if sPost <>"" then 
		urlrequest.Method = "POST"			
	elseif sGet <> "" then
		urlrequest.Method = "GET"					
	else
		urlrequest.Method = "GET"					
	end if

	try

	Dim urlresponse As System.Net.HttpWebResponse = urlrequest.GetResponse()
	
	If urlresponse.StatusCode = System.Net.HttpStatusCode.OK Then

		Dim stream As System.IO.Stream = urlresponse.GetResponseStream()
	    Dim reader As New System.IO.StreamReader(stream)
	    Dim urlcontents As String = reader.ReadToEnd()

	    response.write(urlcontents)
	    
	end if

	catch e as exception

		response.write(e)

	end try

%>