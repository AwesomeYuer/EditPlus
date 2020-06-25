<%@
	Page
	language="c#"
	Codebehind="WebForm1.aspx.cs"
	AutoEventWireup="false"
	Inherits="WebApplication1.WebForm1"
%>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Security.Principal" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Threading" %>

<script language="C#" runat="server">
	private static byte[] ReadStreamToBytes(Stream stream)
	{
		byte[] buffer = new byte[64 * 1024];
		MemoryStream ms = new MemoryStream();
		int r = 0;
		int l = 0;
		long position = -1;

		if (stream.CanSeek)
		{
			position = stream.Position;
			stream.Position = 0;
		}

		while (true)
		{
			r = stream.Read(buffer, 0, buffer.Length);
			if (r > 0)
			{
				l += r;
				ms.Write(buffer, 0, r);
			}
			else
			{
				break;
			}
		}
		byte[] bytes = new byte[l];
		ms.Position = 0;
		ms.Read(bytes, 0, (int)l);
		ms.Close();
		ms = null;
		if (position >= 0)
		{
			stream.Position = position;
		}
		return bytes;

	}
protected void Page_Load(object sender, EventArgs ea) 
{

		Response.Write("Request.InputStream body<br>");
		byte[] buffer = ReadStreamToBytes(Request.InputStream);
		Response.Write(buffer.Length + "<br>");
		Response.Write(Request.ContentLength + "<br>");
		buffer = HttpUtility.UrlDecodeToBytes(buffer);
		string s = Encoding.ASCII.GetString(buffer);
		Response.Write(Server.HtmlEncode(s) + "<br>");
		s = Encoding.UTF8.GetString(buffer);
		Response.Write(Server.HtmlEncode(s) + "<br>");
		s = Encoding.GetEncoding("gb2312").GetString(buffer);
		Response.Write(Server.HtmlEncode(s) + "<br>");

		Response.Write("============================================<br>");

	WindowsPrincipal wp = new WindowsPrincipal(WindowsIdentity.GetCurrent());
	IIdentity identity = WindowsIdentity.GetCurrent();
	string username = identity.Name;
	Response.Write("<br>WindowsIdentity.GetCurrent(): " + username );
	identity = Thread.CurrentPrincipal.Identity;
	username = identity.Name;
	Response.Write("<br>Thread.CurrentPrincipal.Identity: " + username );
	identity = Context.User.Identity;
	Response.Write("<br>HttpContext.User.Identity: " + username );

	Response.Write("<br>.Net Framework version: " + Environment.Version.ToString()+ "<br>" );

	Response.Write("IP:<br>");
	Response.Write(string.Format("Your current IP is {0}<br>", Request.UserHostAddress));

	Response.Write("Request.ContentEncoding:<br>");
	Encoding e = Request.ContentEncoding;
	Response.Write(string.Format("&nbsp;&nbsp;&nbsp;&nbsp;{0},{1}<br>", e.EncodingName, e.HeaderName));

	Response.Write("Request.Cookies:<br>");
	foreach (string var in Request.Cookies.AllKeys)
	{
		Response.Write(string.Format("&nbsp;&nbsp;&nbsp;&nbsp;{0}:{1}<br>", var, Request.Cookies[var].Value));
	}

	Response.Write("Request.Form:<br>");
	foreach (string var in Request.Form.AllKeys)
	{
		Response.Write(string.Format("&nbsp;&nbsp;&nbsp;&nbsp;{0}:{1}<br>", var, Request.Form[var]));
	}

	Response.Write("Request.QueryString:<br>");
	foreach (string var in Request.QueryString.AllKeys)
	{
		Response.Write(string.Format("&nbsp;&nbsp;&nbsp;&nbsp;{0}:{1}<br>", var, Request.QueryString[var]));
	}

	Response.Write("Request.ServerVariables:<br>");
	foreach (string var in Request.ServerVariables.AllKeys)
	{
		Response.Write(string.Format("&nbsp;&nbsp;&nbsp;&nbsp;{0}:{1}<br>", var, Request.ServerVariables[var]));
	}
}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>

		</div>
	</form>
</body>
</html>