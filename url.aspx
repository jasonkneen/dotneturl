<%
	
	' This was a VERY quick workaround to issue with the Classic ASP
	' oAuth library with the Twitter API changes implmented around 1st Dec 2012.

	dim sMethod as string 		= request.querystring("method")
	dim sUrl as string 		= request.querystring("url")
	
	Dim urlrequest As System.Net.HttpWebRequest = System.Net.HttpWebRequest.Create(sUrl)

	if sMethod.toLower() = "get" or sMethod = "" then
		urlrequest.Method = "GET"		
	else
		urlrequest.Method = "POST"		
	end if

	try

	Dim urlresponse As System.Net.HttpWebResponse = urlrequest.GetResponse()
	
	If urlresponse.StatusCode = System.Net.HttpStatusCode.OK Then

		Dim stream As System.IO.Stream 	= urlresponse.GetResponseStream()
	   	Dim reader As New System.IO.StreamReader(stream)
	    	Dim urlcontents As String = reader.ReadToEnd()

	    	response.write(urlcontents)
	    
	end if

	catch e as exception

		response.write(e)

	end try

%>