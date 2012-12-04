dotneturl
=========

Proxy page to GET or POST to or from a URL and return the response

This was a very quick response to the Twitter change that occured on 1st Dec 2012 which broke Scott DeSapio's
oAuth Libary for Classic ASP.

From my investigation it seems that Twitter implemented gzip and the MSXML component doesn't like it and 
returns ? for every call to the Twitter API.

So, I implemented a very quick fix to use a proxy .NET page.

Call it like this:-

	<%
	Dim objXMLHTTP : Set objXMLHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP.6.0")
	objXMLHTTP.Open "GET", "/url.aspx?get=" & server.urlencode(url), False
	%>

Ensure you encode the URL to allow you to pass a URL with multiple parameters.

To "fix" the oAUTH library, edit the *Send()* function in *cLibOAuth.asp* to do the following:-


(put the url.aspx page in the site root)

Change

	objXMLHTTP.Open m_strRequestMethod, strRequestURL, False

To

	objXMLHTTP.Open m_strRequestMethod, "http://YOURDOMAIN.COM/url.aspx?method=" & m_strRequestMethod & "&url=" & server.urlencode(strRequestURL), False


Once you've done that, the library should work.

Hope it works for you!

@Jasonkneen