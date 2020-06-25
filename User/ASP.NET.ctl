#TITLE=.NET 1.x/2.0 
#INFO
ASP.NET Cliptext v2.0 written by Dimitrios Markatos [dmarko1@aol.com] - November, 2001.
Updated April 2003 for C# / XML
Updated March 2006 for .NET 2.0

#SORT=n

#T==  ASP.NET Objects =
=  ASP.NET Objects =
#T====================
=====================
#T=  ?General Tags
General tags

#T=    ?C#
    ?C#
#T=    - Page Directive
<%@ Page Language="C#" Debug="False" Trace="False" Strict="True" Explicit="True" Buffer="True" %>

#T=    - Page Directive - .NET 2.0
<%@ Page Language="C#" Debug="False" Trace="False" Strict="True" Explicit="True" Buffer="True" CompilationMode="Always | Auto | Never" MaintainScrollPositionOnPostback="True | False" %>

#T=    - Master Page
<% @ Master Language="C#" CodeFile="^!.master.cs" Inherits="^!" %>

#T=    - Script Tag
<script language="C#" runat="server">

    ^!

</script>

#T=    - Comment Out
//


#T=    - Page Load

		void Page_Load (object Sender, EventArgs E) {

			^!		

		}
#T=    - Page PreRender

		void Page_PreRender (object Sender, EventArgs E) {

			^!		

		}

#T=    - Page Init

		void Page_Init (object Sender, EventArgs E) {

			^!		

		}

#T=    - Page Unload

		void Page_Unload (object Sender, EventArgs E) {

			^!		

		}

#T=    - Page Error

		void Page_Error (object Sender, EventArgs E) {

			^!		

		}


#T=    - Page PostBack

		if (!Page.IsPostBack) { 

			^!		

		}

#T=    - Page CrossPagePostBack

		if (!Page.IsCrossPagePostBack) {

			^!

		}

#T=    - Page IsValid

		if (Page.IsValid) { 

			^!		

		}

#T= 
 
#T=    ?VB
    ?VB
#T=    - Page Directive
<%@ Page Language="VB" Debug="False" Trace="False" Strict="True" Explicit="True" Buffer="True" %>

#T=    - Page Directive - .NET 2.0
<%@ Page Language="VB" Debug="False" Trace="False" Strict="True" Explicit="True" Buffer="True" CompilationMode="Always | Auto | Never" MaintainScrollPositionOnPostback="True | False" %>

#T=    - Master Page
<% @ Master Language="VB" CodeFile="^!.master.vb" Inherits="^!" %>

#T=    - Script Tag
<script language="VB" runat="server">

    ^!

</script>

#T=    - Comment Out
'^!

#T=    - Page Load

		Sub Page_Load (ByVal Sender As Object, ByVal E As EventArgs)

			^!		

		End Sub

#T=    - Page PreRender

		Sub Page_PreRender (ByVal Sender As Object, ByVal E As EventArgs)

			^!		

		End Sub

#T=    - Page Init

		Sub Page_Init (ByVal Sender As Object, ByVal E As EventArgs)

			^!		

		End Sub

#T=    - Page Unload

		Sub Page_Unload (ByVal Sender As Object, ByVal E As EventArgs)

			^!		

		End Sub

#T=    - Page Error

		Sub Page_Error(ByVal Sender As Object, ByVal E As EventArgs) 

			^!

		End Sub

#T=    - Page PostBack

		If (Not Page.IsPostBack) Then

			^!

		End If

#T=    - Page CrossPagePostBack

		If (Not Page.IsCrossPagePostBack) Then

			^!

		End If

#T=    - Page IsValid

		If (Page.IsValid) Then

			^!

		End If

#T= 
 
#T=  ?Code Behind File - .NET 1.1
  ?Code Behind File - .NET 1.1
#T=    - Page Inherits File
<%@ Page Language="C# | VB" Inherits="Namespace/ClassName" Src="filename.aspx.cs | vb" %>
#T=    - C#

//Save as filename.aspx.cs

using System; 

namespace customName 
{ 
 
  public class customClassName : System.Web.UI.Page 
  { 

  } 

}

#T=    - VB

'Save as filename.aspx.vb

Imports System

Namespace customName 

	Public Class customClassName 
		Inherits System.Web.UI.Page 

	End Class

End Namespace

#T= 
 
#T=  ?Code Behind File - .NET 2.0
  ?Code Behind File - .NET 2.0
#T=    - Page Inherits File
<%@ Page language="C# | VB" CodeFile="filename.aspx.cs | vb" Inherits="Namespace/ClassName" %>
#T=    - C#

//Save as filename.aspx.cs

using System;

namespace customName 
{ 
    public partial class customClassName : System.Web.UI.Page
    {

    }

}

#T=    - VB

'Save as filename.aspx.vb

Imports System

Namespace customName 

	Partial Class customClassName 
		Inherits System.Web.UI.Page 

	End Class

End Namespace

#T= 
 
#T=  ?User Control - .ascx
<%@ Register TagPrefix="^!" TagName="^!" Src="???.ascx" %>

<%-- Format is TagPrefix:TagName ID="TagName" --%>
< :^! ID="^!" runat="server" />

#T=  ?Page Output Caching
<%@ OutputCache Location="Any | Client | Downstream | Server | None | 
     ServerAndClient" Duration="^!" VaryByParam="^!" Shared="True | False" %>

#T=  ?.NET Code Render Block
<%^!%>


#T=  ?Server Side Comments
<%-- ^! --%>

#T====================
=====================
#T== System Namespaces
= System Namespaces
#T====================
=====================
#T=  ?Microsoft DAAB
<%@ Import Namespace="Microsoft.ApplicationBlocks.Data" %>

#T=  ?Microsoft.Data.SqlXml
<%@ Import Namespace="Microsoft.Data.SqlXml" %>

#T=  ?Microsoft.SqlServer.Server
<%@ Import Namespace="Microsoft.SqlServer.Server" %>

#T=  ?Microsoft.VisualBasic
<%@ Import Namespace="Microsoft.VisualBasic" %>

#T=  ?System
<%@ Import Namespace="System" %>

#T=  ?System.Configuration
<%@ Import Namespace="System.Configuration" %>

#T=  ?System.Data
<%@ Import Namespace="System.Data" %>

#T=  ?System.Data.OleDB
<%@ Import Namespace="System.Data.OleDb" %>

#T=  ?System.Data.SqlClient
<%@ Import Namespace="System.Data.SqlClient" %>

#T=  ?System.Diagnostics
<%@ Import Namespace="System.Diagnostics" %>

#T=  ?System.Drawing
<%@ Import Namespace="System.Drawing" %>

#T=  ?System.IO - New FSO
<%@ Import Namespace="System.IO" %> 

#T=  ?System.Text
<%@ Import Namespace="System.Text" %> 

#T=  ?System.Reflection
<%@ Import Namespace="System.Reflection" %>

#T=  ?System.Security
<%@ Import Namespace="System.Security" %>

#T=  ?System.Security.Cryptography 
<%@ Import Namespace="System.Security.Cryptography" %>

#T=  ?System.Web
<%@ Import Namespace="System.Web" %>

#T=  ?System.Web.Caching
<%@ Import Namespace="System.Web.Caching" %>

#T=  ?System.Web.HttpUtility
<%@ Import Namespace="System.Web.HttpUtility" %>

#T=  ?System.Web.Mail
<%@ Import Namespace="System.Web.Mail" %>

#T=  ?System.Web.UI
<%@ Import Namespace="System.Web.UI" %>

#T=  ?System.Web.UI.HtmlControls
<%@ Import Namespace="System.Web.UI.HtmlControls" %>

#T=  ?System.Web.UI.WebControls
<%@ Import Namespace="System.Web.UI.WebControls" %>

#T=  ?System.Xml
<%@ Import Namespace="System.Xml" %>

#T=  ?System.Xml.Xsl
<%@ Import Namespace="System.Xml.Xsl" %>

#T====================
=====================
#T== ADO.NET Objects
= ADO.NET Objects
#T====================
=====================
#T=  ?C# - SQL Server 
  ?C# - SQL Server 
#T=  -  DataSet/DataGrid

	void DataSet() {

		String sqlStr = "^!"; //Put SQL Query String Here
		String strConn = "server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;";

		SqlConnection MyConnection;
		DataSet DS;
		SqlDataAdapter MyCommand;

		MyConnection = new SqlConnection(strConn);

		MyCommand = new SqlDataAdapter(sqlStr, MyConnection);

		DS = new DataSet();
		MyCommand.Fill(DS, "MyDataGrid"); //Grid Name Goes Here

		MyDataGrid.DataSource = DS;
		MyDataGrid.DataBind();

		DS.Dispose();
		DS = null;
		MyCommand.Dispose();
		MyCommand = null;
		MyConnection.Close();
		MyConnection = null;

	}

#T=  -  DataReader

	void DataReader() {

		String sqlStr = "^!"; //Put SQL Query String Here
		String strConn = "server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;";

		SqlConnection MyConnection = new SqlConnection (strConn);

		MyConnection.Open();

		SqlCommand MyCommand = new SqlCommand(sqlStr, MyConnection);

		SqlDataReader objDataReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection);

		while (objDataReader.Read()) {

		  Response.Write (objDataReader["^!"].ToString() + "<BR>");

		}

		objDataReader.Close();
		objDataReader = null;
		MyCommand.Dispose();
		MyCommand = null;
		MyConnection.Close();
		MyConnection = null;	
	
	}

#T=  -  DataSet To XML

	void DataSetToXML() {

		String sqlStr = "^!"; //Put SQL Query String Here
		String strConn = "server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;";

		SqlConnection MyConnection;
		DataSet DS;
		SqlDataAdapter MyCommand;

		MyConnection = new SqlConnection(strConn);

		MyCommand = new SqlDataAdapter(sqlStr, MyConnection);
		
		DS = new DataSet();

		MyCommand.Fill(DS);

		DS.WriteXml("c:\\FilePath\\filename.xml", XmlWriteMode.WriteSchema);

		DS.Dispose();
		DS = null;
		MyCommand.Dispose();
		MyCommand = null;
		MyConnection.Close();
		MyConnection = null;

	}


#T=  -  XML To DataSet/DataGrid

	void XMLToDataSet() {

		DataSet DS = new DataSet();

		DS.ReadXml("c:\\FilePath\\filename.xml", XmlReadMode.ReadSchema);

		MyDataGrid.DataSource = DS;
		MyDataGrid.DataBind();

		DS.Dispose();
		DS = null;

	}


#T= 
 
#T=  ?C# - OleDb 
  ?C# - OleDb 
#T=  -  DataSet/DataGrid

	void DataSet() {

		String sqlStr = "^!"; //Put SQL Query String Here
		String strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("--dbFilePath--.mdb");
		
		OleDbConnection MyConnection;
		DataSet DS;
		OleDbDataAdapter MyCommand;

		MyConnection = new OleDbConnection(strConn);

		MyCommand = new OleDbDataAdapter(sqlStr, MyConnection);

		DS = new DataSet();
		MyCommand.Fill(DS, "MyDataGrid"); //Grid Name Goes Here

		MyDataGrid.DataSource = DS;
		MyDataGrid.DataBind();

		DS.Dispose();
		DS = null;
		MyCommand.Dispose();
		MyCommand = null;
		MyConnection.Close();
		MyConnection = null;

	}

#T=  -  DataReader

	void DataReader() {

		String sqlStr = "^!"; //Put SQL Query String Here
		String strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("--dbFilePath--.mdb");

		OleDbConnection MyConnection = new OleDbConnection (strConn);

		MyConnection.Open();

		OleDbCommand MyCommand = new OleDbCommand(sqlStr, MyConnection);

		OleDbDataReader objDataReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection);

		while (objDataReader.Read()) {

		  Response.Write (objDataReader["^!"].ToString() + "<BR>");

		}

		objDataReader.Close();
		objDataReader = null;
		MyCommand.Dispose();
		MyCommand = null;
		MyConnection.Close();
		MyConnection = null;		


	}

#T=  -  DataSet To XML

	void DataSetToXML() {

		String sqlStr = "^!"; //Put SQL Query String Here
		String strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("--dbFilePath--.mdb");

		OleDbConnection MyConnection;
		DataSet DS;
		OleDbDataAdapter MyCommand;

		MyConnection = new OleDbConnection(strConn);

		MyCommand = new OleDbDataAdapter(sqlStr, MyConnection);
		
		DS = new DataSet();

		MyCommand.Fill(DS);

		DS.WriteXml("c:\\FilePath\\filename.xml", XmlWriteMode.WriteSchema);

		DS.Dispose();
		DS = null;
		MyCommand.Dispose();
		MyCommand = null;
		MyConnection.Close();
		MyConnection = null;

	}


#T=  -  XML To DataSet/DataGrid

	void XMLToDataSet() {

		DataSet DS = new DataSet();

		DS.ReadXml("c:\\FilePath\\filename.xml", XmlReadMode.ReadSchema);

		MyDataGrid.DataSource = DS;
		MyDataGrid.DataBind();

		DS.Dispose();
		DS = null;

	}

#T= 
 
#T=  ?VB - SQL Server
  ?VB - SQL Server
#T=  -  DataSet/DataGrid

	Sub DataSet()

		Dim sqlStr As String = "^!" 'Put SQL Query String Here
		Dim strConn As String = "server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;"

		Dim MyConnection As SqlConnection
		Dim DS As DataSet
		Dim MyCommand As SqlDataAdapter

		MyConnection = New SqlConnection(strConn)

		MyCommand = New SqlDataAdapter(sqlStr, MyConnection)

		DS = new DataSet()
		MyCommand.Fill(DS, "MyDataGrid") 'Grid Name Goes Here

		MyDataGrid.DataSource = DS
		MyDataGrid.DataBind()

		DS.Dispose() : DS = Nothing
		MyCommand.Dispose() : MyCommand = Nothing
		MyConnection.Close() : MyConnection = Nothing

	End Sub

#T=  -  DataReader

	Sub DataReader()

		Dim sqlStr As String = "^!" 'Put SQL Query String Here
		Dim strConn As String = "server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;"

		Dim MyConnection As New SQLConnection (strConn)

		MyConnection.Open()

		Dim MyCommand As New SQLCommand(sqlStr, MyConnection)

		Dim objDataReader As SQLDataReader 

		objDataReader  = MyCommand.ExecuteReader(CommandBehavior.CloseConnection)

		While objDataReader.Read()

		  Response.Write (objDataReader("^!").ToString() & "<BR>")

		End While

		objDataReader.Close : objDataReader = Nothing
		MyCommand.Dispose() : MyCommand = Nothing
		MyConnection.Close() : MyConnection = Nothing


	End Sub

#T=  -  DataSet To XML

	Sub DataSetToXML()

		Dim sqlStr As String = "^!" 
		Dim strConn As String = "server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;" 

		Dim MyConnection As SqlConnection 

		Dim DS As DataSet 

		Dim MyCommand As SqlDataAdapter 

		MyConnection = New SqlConnection(strConn) 

		MyCommand = New SqlDataAdapter(sqlStr, MyConnection)

		DS = New DataSet 

		MyCommand.Fill(DS) 

		DS.WriteXml("c:\\FilePath\\filename.xml", XmlWriteMode.WriteSchema) 

		DS.Dispose : DS = Nothing 
		MyCommand.Dispose : MyCommand = Nothing 
		MyConnection.Close : MyConnection = Nothing 

	End Sub


#T=  -  XML To DataSet/DataGrid

	Sub XMLToDataSet()

		Dim DS As DataSet = New DataSet

		DS.ReadXml("c:\\FilePath\\filename.xml", XmlReadMode.ReadSchema) 

		MyDataGrid.DataSource = DS 
		MyDataGrid.DataBind 

		DS.Dispose : DS = Nothing 

	End Sub


#T= 
 
#T=  ?VB - OleDb
  ?VB - OleDb
#T=  -  DataSet/DataGrid

	Sub DataSet()

		Dim sqlStr As String = "^!" 'Put SQL Query String Here
		Dim strConn As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("--dbFilePath--.mdb")
		
		Dim MyConnection As OleDbConnection
		Dim DS As DataSet
		Dim MyCommand As OleDbDataAdapter

		MyConnection = New OleDbConnection(strConn)

		MyCommand = New OleDbDataAdapter(sqlStr, MyConnection)

		DS = new DataSet()
		MyCommand.Fill(DS, "MyDataGrid") 'Grid Name Goes Here

		MyDataGrid.DataSource = DS
		MyDataGrid.DataBind()

		DS.Dispose() : DS = Nothing
		MyCommand.Dispose() : MyCommand = Nothing
		MyConnection.Close() : MyConnection = Nothing


	End Sub

#T=  -  DataReader

	Sub DataReader()

		Dim sqlStr As String = "^!" 'Put SQL Query String Here
		Dim strConn As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("--dbFilePath--.mdb")

		Dim MyConnection As New OleDbConnection (strConn)

		MyConnection.Open()

		Dim MyCommand As New OleDbCommand(sqlStr, MyConnection)

		Dim objDataReader As OleDbDataReader 

		objDataReader  = MyCommand.ExecuteReader(CommandBehavior.CloseConnection)

		While objDataReader.Read()

		  Response.Write (objDataReader("^!").ToString() & "<BR>")

		End While

		objDataReader.Close : objDataReader = Nothing
		MyCommand.Dispose() : MyCommand = Nothing
		MyConnection.Close() : MyConnection = Nothing


	End Sub

#T=  -  DataSet To XML

	Sub DataSetToXML()

		Dim sqlStr As String = "^!" 
		Dim strConn As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("--dbFilePath--.mdb")

		Dim MyConnection As OleDbConnection 

		Dim DS As DataSet 

		Dim MyCommand As OleDbDataAdapter 

		MyConnection = New OleDbConnection(strConn) 

		MyCommand = New OleDbDataAdapter(sqlStr, MyConnection)

		DS = New DataSet 

		MyCommand.Fill(DS) 

		DS.WriteXml("c:\\FilePath\\filename.xml", XmlWriteMode.WriteSchema) 

		DS.Dispose : DS = Nothing 
		MyCommand.Dispose : MyCommand = Nothing 
		MyConnection.Close : MyConnection = Nothing 

	End Sub


#T=  -  XML To DataSet/DataGrid

	Sub XMLToDataSet()

		Dim DS As DataSet = New DataSet

		DS.ReadXml("c:\\FilePath\\filename.xml", XmlReadMode.ReadSchema) 

		MyDataGrid.DataSource = DS 
		MyDataGrid.DataBind 

		DS.Dispose : DS = Nothing 

	End Sub


#T====================
=====================
#T== Web Controls
= Web Controls
#T====================
=====================

#T=  ?AdRotator
	<asp:AdRotator ID="^!" AdvertisementFile="^!" BorderWidth="^!" runat="server" />

#T=  ?Button
	<asp:Button ID="^!" Text="^!" onclick="^!" runat="server" />

#T=  ?Button - CrossPagePostBack
	<asp:Button ID="^!" Text="^!" onclick="^!" PostBackUrl="^!" runat="server" />

#T=  ?Calendar
	<asp:Calendar ID="^!" onselectionchanged="^!" runat="server" />

#T=  ?CheckBox
	<asp:CheckBox ID="^!" Text="^!" runat="server" />

#T=  ?CustomValidator
    <asp:CustomValidator ID="^!" runat="server"
        ControlToValidate="^!"
        OnServerValidate="^!"
        Display="^!" 'Static or Dynamic
        Font-Name="^!" Font-Size="^!">
           'Message goes here
    </asp:CustomValidator>

#T=  ?DataGrid
      <ASP:DataGrid ID="MyDataGrid" runat="server"
        AutoGenerateColumns="True"
        BorderColor="^!"
        BorderWidth="^!"
        CellPadding="^!"
        CellSpacing="^!"
        Font-Name="^!"
        Font-Size="^!"
        HeaderStyle-BackColor="^!"
      />

#T=  ?DataList
        <asp:DataList ID="MyDataList" runat="server"
            BorderColor="^!"
            CellPadding="^!"
            Font-Name="^!"
            Font-Size="^!"
            HeaderStyle-BackColor="^!"
            AlternatingItemStyle-BackColor="^!"
            >
              <HeaderTemplate>
                'Items
              </HeaderTemplate>

              <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "^!") %>
              </ItemTemplate>

        </asp:DataList>

#T=  ?DetailsView
	<asp:DetailsView ID="DetailsView1" Runat="server" DataSourceID="SqlDataSource1" AutoGenerateRows="False" DataKeyNames="^!" AllowPaging="True">

	 <Fields>
	   <asp:TemplateField>
		<ItemTemplate>
		  <table>
			<tr>
			  <td>
				<asp:Label ID="Label1" Text='<%# Eval("^!") %>' runat="server" />
			  </td>
			</tr>
			<tr>
			  <td>
				<asp:Label ID="Label2" Text='<%# Eval("^!") %>' runat="server" />
			  </td>
			</tr>
		  </table>
		</ItemTemplate>
	   </asp:TemplateField>
	</Fields>

	</asp:DetailsView>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="^!" ConnectionString="<%$ ConnectionStrings:<dbNameHere> %>" />


#T=  ?DropDownList
	<asp:DropDownList ID="^!" runat="server" />

#T=  ?FormView
	<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1"
        HeaderText="Text Here" AllowPaging="True">

        <ItemTemplate>
	  <table>
		<tr>
		  <td>
			<asp:Label ID="Label1" Text='<%# Eval("^!") %>' runat="server" />
		  </td>
		</tr>
		<tr>
		  <td>
			<asp:Label ID="Label2" Text='<%# Eval("^!") %>' runat="server" />
		  </td>
		</tr>
	  </table>
        </ItemTemplate>

      </asp:FormView>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="^!"
        ConnectionString="<%$ ConnectionStrings:<dbNameHere> %>">
        <SelectParameters>
          <asp:QueryStringParameter Name="^!" DefaultValue="^!" QueryStringField="^!" />
        </SelectParameters>
      </asp:SqlDataSource>

#T=  ?GridView - SQL Server
  ?GridView - SQL Server
#T=   - Standard
	<asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="True" />

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="^!" ConnectionString="<%$ ConnectionStrings:<dbNameHere> %>" />

#T=   - Cached
	<asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="True" />

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="^!" ConnectionString="<%$ ConnectionStrings:<dbNameHere> %>" EnableCaching="True"  CacheDuration="^!" />

#T=   - Ajax
	<asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="True" EnableSortingAndPagingCallbacks="True" />

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="^!" ConnectionString="<%$ ConnectionStrings:<dbNameHere> %>" />


#T=  ?GridView - Access
  ?GridView - Access
#T=   - Standard
	<asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="True" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" datasourcemode="DataSet" datafile="--dbFilePath--.mdb" SelectCommand="^!" />

#T=  ?CheckBoxList
        <asp:CheckBoxList ID="^!" runat="server">
            <asp:ListItem>^!</asp:ListItem>
            <asp:ListItem>^!</asp:ListItem>
        </asp:CheckBoxList>

#T=   - Cached
	<asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="True" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" datasourcemode="DataSet" datafile="--dbFilePath--.mdb" SelectCommand="^!" EnableCaching="True"  CacheDuration="^!" />

#T=   - Ajax
	<asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="True" EnableSortingAndPagingCallbacks="True" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" datasourcemode="DataSet" datafile="--dbFilePath--.mdb" SelectCommand="^!" />

#T=  ?Hyperlink
	<asp:Hyperlink ID="^!" runat="server">
		    'Put Text Here
	</asp:Hyperlink>

#T=  ?Image
	<asp:Image ID="^!" ImageUrl="^!" AlternateText="^!" runat="server" />

#T=  ?ImageButton
	<asp:ImageButton ID="^!"  ImageUrl="^!" BorderWidth="^!" onclick="^!" runat="server" />

#T=  ?Label
	<asp:Label ID="^!" Text="^!" Font-Name="^!" Font-Size="^!" Width="^!" BorderStyle="^!" BorderColor="^!" Visible="^!" runat="server" />

#T=  ?LinkButton
	<asp:LinkButton Text="^!" Font-Name="^!" Font-Size="^!" onclick="^!" runat="server" />

#T=  ?ListBox
	<asp:ListBox ID="^!" Width="^!" runat="server">

	  <asp:ListItem>^!</asp:ListItem>
	  <asp:ListItem>^!</asp:ListItem>

	</asp:ListBox>

#T=  ?Literal
	<asp:Literal ID="^!" Text="^!" runat="server" />

#T=  ?Panel
	<asp:Panel ID="^!" runat="server" BackColor="^!" Height="^!" Width="^!">
	  'Content Goes Here
	</asp:Panel>

#T=  ?PlaceHolder
	<asp:PlaceHolder ID="^!" runat="server" />

#T=  ?RadioButton
	<asp:RadioButton ID="^!" Text="^!" Checked="^!" GroupName="^!" runat="server" />

#T=  ?RadioButtonList
	<asp:RadioButtonList ID="^!" runat="server">

	     <asp:ListItem>^!</asp:ListItem>
	     <asp:ListItem>^!</asp:ListItem>

	</asp:RadioButtonList>

#T=  ?RegularExpressionValidator
	<asp:RegularExpressionValidator ID="^!" runat="server"
		      ControlToValidate="^!"
		      ValidationExpression="^!"
		      Display="^!"
		      Font-Name="^!" 
		      Font-Size="^!">
		'Error Test Message
	</asp:RegularExpressionValidator>

#T=  ?Repeater
	<asp:Repeater ID="^!" runat="server">

	    <HeaderTemplate>

	    </HeaderTemplate>

	    <ItemTemplate>

	    </ItemTemplate>

	    <FooterTemplate>

	    </FooterTemplate>

	</asp:Repeater>

#T=  ?RequiredFieldValidator
	<asp:RequiredFieldValidator ID="^!" ControlToValidate="^!" Font-Name="^!" Font-Size="^!" runat="server">
	    'Text goes here
	</asp:RequiredFieldValidator>

#T=  ?TextBox
	<asp:TextBox ID="^!" runat="server" />

#T=  ?Xml
	<asp:Xml ID="^!"
	     Document="XmlDocument object to display"
	     DocumentContent="String of XML"
	     DocumentSource="Path to XML Document"
	     Transform="XslTransform object"
	     TransformSource="Path to XSL Transform Document"
	     runat="server" />

#T====================
=====================
#T== StringBuilder
= StringBuilder
#T====================
=====================
#T=   - C#

	StringBuilder sbVariable = new StringBuilder("^!");

	  sbVariable.Append ("value 1");
	  sbVariable.Append ("value 2");

	  Response.Write (sbVariable.ToString());

	  sbVariable = null;

#T=   - VB

	Dim sbVariable As StringBuilder = New StringBuilder ("^!")
	   
	   With sbVariable
		.Append ("value 1")
		.Append ("value 2")
	   End With

	  Response.Write (sbVariable.ToString())

	  sbVariable = Nothing


#T====================
=====================
#T== State Management
= State Management
#T====================
=====================

#T=  ?Cache
  ?Cache
#T=    [C#]
    [C#]
#T=   - Standard
	Cache ["CacheName"] = "Cached Item";

#T=   - Insert
	Cache.Insert ("CacheName", "Cached Item");

#T=   - HttpContext Insert
	HttpContext.Current.Cache.Insert ("CacheName", "ObjectName", null);

#T=   - Get
	ObjectType Variable = Cache ["CacheName"];

#T=   - HttpContext Get
	ObjectType Variable = (ObjectType) HttpContext.Current.Cache.Get ("CacheName");

#T=   - Delete
	Cache.Remove("CacheName");

#T= 
 
#T=    [VB]
    [VB]
#T=   - Standard
	Cache ("CacheName") = "Cached Item"

#T=   - Insert
	Cache.Insert ("CacheName", "Cached Item")

#T=   - HttpContext Insert
	HttpContext.Current.Cache.Insert ("CacheName", "ObjectName", Nothing)

#T=   - Get
	ObjectType Variable = Cache ("CacheName")

#T=   - HttpContext Get
	Dim Variable As ObjectType = CType(HttpContext.Current.Cache.Get ("CacheName"), ObjectType)

#T=   - Delete
	Cache.Remove("CacheName")


#T= 
 
#T=  ?ViewState
  ?ViewState
#T=    [C#]
    [C#]
#T=   - Store
	ViewState["Name"] = "Value";

#T=   - Retrieve 
	ObjectType Variable = (ObjectType) ViewState["Name"];

#T=   - Clear
	Viewstate.Clear();

#T= 
 
#T=    [VB]
    [VB]
#T=   - Store
	ViewState("Name") = "Value"

#T=   - Retrieve 
	Dim Variable as ObjectType = CType(ViewState("Name"), ObjectType)

#T=   - Clear
	Viewstate.Clear()

#T= 
 
#T=  ?Session
  ?Session
#T=    [C#]
    [C#]
#T=   - Add
	Session ["SessionName"] = "Value";

#T=   - HttpContext Add
	HttpContext.Current.Session.Add ("SessionName", ObjectType);

#T=   - Retrieve 
	ObjectType Variable = Session ["SessionName"].ToString();

#T=   - HttpContext Retrieve
	ObjectType Variable = (ObjectType)(HttpContext.Current.Session("SessionName"));

#T=   - Remove 
	Session.Remove("SessionName");

#T=   - HttpContext Remove
	HttpContext.Current.Session.Remove("SessionName");

#T=   - Timeout
	Session.Timeout = ^!;

#T= 
 
#T=    [VB]
    [VB]
#T=   - Add
	Session("SessionName") = "Value"

#T=   - HttpContext Add
	HttpContext.Current.Session.Add ("SessionName", ObjectType)

#T=   - Retrieve 
	Dim Variable As ObjectType = Session("SessionName").ToString()

#T=   - HttpContext Retrieve
	Dim Variable As ObjectType = CType(HttpContext.Current.Session("SessionName"), ObjectType)

#T=   - Remove 
	Session.Remove("SessionName")

#T=   - HttpContext Remove
	HttpContext.Current.Session.Remove("SessionName")

#T=   - Timeout
	Session.Timeout = ^!


#T= 
 
#T=  ?Cookies
  ?Cookies
#T=    [C#]
    [C#]
#T=   - Creating
	HttpCookie myCookie = new HttpCookie("CookieName"); 

	myCookie("SubKeyName1") = "Value"; 
	myCookie("SubKeyName2") = "Value"; 
	myCookie.Expires = Now.AddDays(1); 
	
	Response.Cookies.Add(myCookie);

#T=   - Reading
	ObjectType Variable = Request.Cookies("CookieName")("SubKeyName1").ToString();

#T=   - Deleting
	myCookie.Expires = DateTime.Now.AddDays(-1d);
	Response.Cookies.Add(myCookie);


#T= 
 
#T=    [VB]
    [VB]
#T=   - Creating
	Dim myCookie As HttpCookie = New HttpCookie("CookieName")

	myCookie("SubKeyName1") = "Value"
	myCookie("SubKeyName2") = "Value"
	myCookie.Expires = Now.AddDays(1)
	
	Response.Cookies.Add(myCookie)


#T=   - Reading
	Dim Variable As ObjectType = Request.Cookies("CookieName")("SubKeyName1").ToString()

#T=   - Deleting
	myCookie.Expires = DateTime.Now.AddDays(-1D)
	Response.Cookies.Add(myCookie)


#T====================
=====================
#T== OOP Objects
= OOP Objects
#T====================
=====================

#T=  ?C# Variables And Methods
 ---------------------------
#T=   -  Variables
	string | int ^!;

#T=   -  Private Variables
	private 'string | int ^!;

#T=   -  Protected Variables
	protected 'string | int ^!;

#T=   -  Public Variables
	public 'string | int ^!;

#T=   -  Subroutine
	object | string ^! () {


		return ^!;
	}

#T=   -  Function
	void ^!() {

	}

#T= 
 
#T=  ?VB Variables And Methods
 ---------------------------
#T=   -  Dim Variables
	Dim ^! As 'String | Integer

#T=   -  Private Variables
	Private ^! As 'String | Integer

#T=   -  Protected Variables
	Protected ^! As 'String | Integer

#T=   -  Public Variables
	Public ^! As 'String | Integer

#T=   -  Subroutine
	Sub (^!) As 'String | Integer

	End Sub

#T=   -  Function
	Function (^!) As 'String | Integer

	End Function

#T= 
 
#T=  ?C# Objects
 ---------------------------
#T=   -  Class

	public class ClassName {

	// Its members

	  public string result;

	   public string MethodName() {

		return result;

	   }

	}

#T=   -  Partial

	public partial class ClassName
	{
	    public void MethodName1()
	    {
		^!
	    }
	}

	public partial class ClassName
	{
	    public void MethodName2()
	    {
		^!		
	    }
	}


#T=   -  Struct

	struct StructureName 
	{
	   public int x, y;

	   // Constructor:
	   public StructureName(int x, int y) 
	   {
	      x = x;
	      y = y;
	   }
	   // Override the ToString method:
	   public override string ToString()
	   {
	      return(String.Format("({0},{1})", x, y));   
	   }
	}

#T=   -  Enum

	public class ClassName {

	    enum EnumName { 'val1, val2, etc.' };

		public static void Main() {

		Type VariableName = typeof(EnumName);

		    foreach ( string s in Enum.GetNames(VariableName) )

		    Console.WriteLine( "{0,-11}= {1}", s, Enum.Format( VariableName, Enum.Parse(VariableName, s), "d"));

		}
	}


#T=   -  Abstract

	public abstract class ClassName
	{

	  public abstract string Variable1();
	  public abstract string Variable2();

	  //Non-Abstract method
	  public string Whatever(){

	     return "Anything";

	   }

	}

#T=   -  Interface

	interface InterfaceName
	{

	      int VariableName { get; } //Interface property 

	      void ClassName(); //Interface method

	}

#T=   -  Property

	public class ClassName
	{
	    private string _variable = "^!";

	    public string variable
	    {
		get
		{
		    return _variable;
		}
		set
		{
		    _variable = value;
		}
	    }
	}

#T= 
 
#T=  ?VB Objects
 ---------------------------
#T=   -  Class

	Public Class ClassName 

	 Public result As String 

	  Public Function MethodName() As String 
	 
	    Return result 
	 
	  End Function 

	End Class

#T=   -  Partial

	Partial Public Class ClassName

	    Public Sub MethodName1()
	    
		^!
	    
	    End Sub

	End Class

	Partial Public Class ClassName

	    Public Sub MethodName2()
	    
		^!
	    
	    End Sub

	End Class

#T=   -  Structure

	Structure StructureName
	   
	   Private x, y As Integer
	   
	     Public Sub New(x As Integer, y As Integer)
	       
	       x = x
	       y = y

	   End Sub

	End Structure

#T=   -  Enum

	Public Class ClassName 

	  Enum EnumName
	     val1
	     val2
	  End Enum

	 Public Shared Sub Main() 

	   Dim VariableName As Type = GetType(EnumName) 

		For Each s As String In Enum.GetNames(VariableName) 

		 Console.WriteLine("{0,-11}= {1}", s, Enum.Format(VariableName, Enum.Parse(VariableName, s), "d")) 

		Next

	 End Sub 

	End Class

#T=   -  Abstract

	Public MustInherit Class ClassName 

	   Public MustOverride Function Variable1() As String 

	   Public MustOverride Function Variable2() As String 

  	   Public Function Whatever() As String 

	     Return "Anything" 

	   End Function 

	End Class

#T=   -  Interface

	Interface InterfaceName 

	  ReadOnly Property VariableName() As Integer 

	  Function ClassName() As String

	End Interface

#T=   -  Property

	Public Class ClassName 

	  Private _variable As String = "^!" 

	  Public Property variable() As String 
	 
	   Get 
	     Return _variable 
	   End Get 
	   
	   Set 
	     _variable = value 
	   End Set 
	 
	  End Property 

	End Class

#T====================
=====================
#T== Control structures
= Control structures
#T====================
=====================

#T=  ?If
	If (^!)  then
	
	ElseIf (  ) then
	
	Else
	
	End if

#T=  ?For each
	For Each ^! In (   )
	
	Next

#T=  ?For..next
	For (^!) to
	
	Next

#T=  ?Select..case
	Select Case (^!)
	Case (  )
	
	Case (  )
	
	Else
	
	End Select

#T=  ?Do..while
	Do While (^!)
	
	Loop

#T=  ?Do..until
	Do 
	
	Loop Until (^!)

#T=  ?While..End While
	While (^!)
	
	End While

#T====================
=====================
#T== Response methods
= Response methods
#T====================
=====================
#T=  ?Buffer
	Response.BufferOutput = ^!
	'Value=True or False

#T=  ?Buffer = True
	<%Response.BufferOutput = "True"%>

#T=  ?Clear
	Response.Clear()

#T=  ?End
	Response.End()

#T=  ?Flush
	Response.Flush()

#T=  ?Redirect
	Response.Redirect("^!")

#T=  ?Server.Transfer
	Server.Transfer("^!")

#T=  ?Write
	Response.Write(^!)

#T=  ?Write ""
	Response.Write("^!")

#T=  ?Write Shortcut
<%=^! %>  


#T=  ?Trim$
	Trim$(^!)

#T=  ?String.Compare
	String.Compare(-Str1-,-Str2-)

#T====================
=====================
#T== Response properties
= Response properties
#T====================
=====================
#T=  ?Cookies
	Response.Cookies["^!"].Value=

#T=  ?CookiesExpire
	Response.Cookies["^!"].Expires=" "

#T=  ?Expires
	Response.Cache.SetExpires(DateTime.Now.AddSeconds(0))
	'Value=Minutes

#T=  ?Expires
	<%Response.Expires = 0%>

#T=  ?ExprAbsolute
	Response.ExpiresAbsolute =#^!#
	'Value=Date or Time

#T=  ?IsConnected
	Response.IsClientConnected()

#T====================
=====================
#T== Error properties
= Error properties
#T====================
=====================
#T=  ?Error handling
  ?Error handling
#T=   -  Try Catch
	Try
		

	Catch
		
			      
	End Try

#T=   -  Try Catch e
	Try
		

	Catch e As Exception
		   
		      
	End Try

#T=  ?Message
e.ToString()
#T=  ?Number
e.Number
#T=  ?Source
e.Source.ToString()
#T=  ?StackTrace
e.StackTrace.ToString()

#T====================
=====================
#T== Request collections
= Request collections
#T====================
=====================
#T=  ?Form
Request.Form(^!)
#T=  ?Form ("")
Request.Form("^!")
#T=    - Form Loop
	For Each ^! in ^! 

	Next 

#T=    - FormCount
Request.Form("^!").Count
#T=  ?QueryString
Request.QueryString("^!")
#T=    - QueryStringCount
Request.QueryString("^!").Count

#T=  ?ServerVariables
ServerVariables
#T=    - All Http
Request.ServerVariables("ALL_HTTP")
#T=    - Content Type
Request.ServerVariables("CONTENT_TYPE")
#T=    - Content Length
Request.ServerVariables("CONTENT_LENGTH")
#T=    - Http Referer
Request.ServerVariables("HTTP_REFERER")
#T=    - Http User Agent
Request.ServerVariables("HTTP_USER_AGENT")
#T=    - Local Address
Request.ServerVariables("LOCAL_ADDR")
#T=    - Logon User
Request.ServerVariables("LOGON_USER")
#T=    - Request Method
Request.ServerVariables("REQUEST_METHOD")
#T=    - Query String
Request.ServerVariables("QUERY_STRING")
#T=    - ServerVariables
Request.ServerVariables("SERVERVARIABLES")
#T=    - URL
Request.ServerVariables("URL")
#T====================
=====================
#T== Server properties
= Server properties
#T====================
=====================
#T=  ?ScriptTimeout
Server.ScriptTimeout = "^!"
'Value=second

#T=  ?Server methods
Server methods
#T=    - HTMLEncode
Server.HTMLEncode("^!")
#T=    - MapPath
Server.MapPath("^!")
#T=    - URLEncode
Server.URLEncode("^!")
#T====================
=====================
#T== FileSystemObject
= FileSystemObject
#T====================
=====================
#T=  ?CreateDirectory
File.CreateDirectory

#T=  ?FileReader Object
Dim FileReader As StreamReader
FileReader = File.OpenText("^!")

#T=  ?FileWriter Object
Dim FileWriter As StreamWriter  

#T=  ?CreateTextFile
FileWriter = File.CreateText(" ^! ")
'Return TextStream object

#T=  ?DeleteFile
File.Delete(FilePath) 

#T=  ?FileExists
File.Exists(FilePath)
'File Path

#T====================
=====================
#T== Web.Config =
= Web.Config =
#T====================
=====================
#T=  ?.NET 1.1
  ?.NET 1.1
#T=   - Web.Config File
 <!-- Save file as web.config -->
<configuration>

    <!-- store the database connection info here -->
  <appSettings>
     
     'SQL Databases
     <add key="SQL" value="server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;" />

     'Access Databases
    <add key="Access" value="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=--dbFilePath--" />

  </appSettings>

  <system.web>

    <pages buffer="true"
	   enableSessionState="^!" 
    />

    <compilation>
        <assemblies>
            <!--This tells ASP.NET to load all assemblies from /bin-->
            <add assembly="*"/>
        </assemblies>
    </compilation>
  </system.web>

</configuration>

#T=   - Configuration Call
ConfigurationSettings.AppSettings("^!")

#T= 
 
#T=  ?.NET 2.0
  ?.NET 2.0
#T=   - Web.Config File
 <!-- Save file as web.config -->
<configuration>

 <!-- store .NET 1.1 database connection info in appSettings -->

  <appSettings>

    <add key="Database Keyname" value="server=(local);uid=sa;pwd=;database=<dbNameHere>;Trusted_Connection=yes;" />

  </appSettings>

  <system.web>

   <pages buffer="true"
     enableSessionState="false"
   >

    <!-- store all relevant Namespaces here. Saves the need to add them client side. -->

    <namespaces>

      <add namespace="System" />
      <add namespace="System.Collections" />
      <add namespace="System.Configuration" />
      <add namespace="System.Data" />
      <add namespace="System.Data.SqlClient" />

    </namespaces>

   </pages>

   <identity impersonate="true" />

  </system.web>

  <connectionStrings>

    <add name="Database Name" connectionString="Server=(local)\SQLExpress;Integrated Security=True;Database=<dbNameHere>;Persist Security Info=True" providerName="System.Data.SqlClient" />

  </connectionStrings>

</configuration>

#T=   - Configuration Call
<%$ ConnectionStrings:Pubs %>

#