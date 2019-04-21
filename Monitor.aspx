<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>

<script runat="server">
    private static string GetURL(string strUrl, string strEncoding)
    {
        Encoding enc = Encoding.Default;
        if (!string.IsNullOrEmpty(strEncoding)) {
            enc = Encoding.GetEncoding(strEncoding);
        }
        
        System.Net.WebClient wc = new System.Net.WebClient();
        System.IO.StreamReader r = new System.IO.StreamReader(wc.OpenRead(strUrl), enc);

        return r.ReadToEnd();
    }    
</script>

<%
	Response.ContentType = "application/unknown;charset=UTF-8";

    string strURL = "";
    try
    {
        strURL = Request["URL"];
        string strEncoding = Request["Encoding"];

        if (!string.IsNullOrEmpty(strURL))
        {
            Response.Write(GetURL(strURL, strEncoding));          
        }
    }
    catch (Exception ex) {
		Response.Write(string.Format("URL Error : {0}", strURL));
    }

%>