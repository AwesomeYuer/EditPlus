<%@ WebService Language="c#" Codebehind="Service1.asmx.cs" Class="Microshaoft.Service1Class" %>
namespace Microshaoft
{
	using System.Diagnostics;
	using System.Web;
	using System.Web.Services;
	[WebService(Namespace="http://www.microshaoft.com/")]
	public class Service1Class : System.Web.Services.WebService
	{
		[WebMethod]
		public string HelloWorld()
		{
			return "Hello World";
		}
	}
}