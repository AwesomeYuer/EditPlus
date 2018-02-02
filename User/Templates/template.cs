namespace ConsoleApplication
{
	using System;
		/// <summary>
		/// Class1 的摘要说明。
		/// </summary>
	public class 
	{
		/// <summary>
		/// 应用程序的主入口点。
		/// </summary>
		//[STAThread]
		static void Main(string[] args)
		{
			//
			// TODO: 在此处添加代码以启动应用程序
			//
			Console.WriteLine("Hello World");
			Console.WriteLine(Environment.Version.ToString());
		}
	}

}




///namespace WindowsApplication1
///{
///		using System;
///		using System.Drawing;
///		using System.Collections;
///		using System.ComponentModel;
///		using System.Windows.Forms;
///		using System.Data;
///	/// <summary>
///	/// Form1 的摘要说明。
///	/// </summary>
///	public class Form1 : System.Windows.Forms.Form
///	{
///		private System.Windows.Forms.Button button1;
///		/// <summary>
///		/// 必需的设计器变量。
///		/// </summary>
///		private System.ComponentModel.Container components = null;
///
///		public Form1()
///		{
///			//
///			// Windows 窗体设计器支持所必需的
///			//
///			InitializeComponent();
///
///			//
///			// TODO: 在 InitializeComponent 调用后添加任何构造函数代码
///			//
///		}
///
///		/// <summary>
///		/// 清理所有正在使用的资源。
///		/// </summary>
///		protected override void Dispose( bool disposing )
///		{
///			if( disposing )
///			{
///				if (components != null) 
///				{
///					components.Dispose();
///				}
///			}
///			base.Dispose( disposing );
///		}
///
///		#region Windows 窗体设计器生成的代码
///		/// <summary>
///		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
///		/// 此方法的内容。
///		/// </summary>
///		private void InitializeComponent()
///		{
///			this.button1 = new System.Windows.Forms.Button();
///			this.SuspendLayout();
///			// 
///			// button1
///			// 
///			this.button1.Location = new System.Drawing.Point(96, 112);
///			this.button1.Name = "button1";
///			this.button1.Size = new System.Drawing.Size(88, 32);
///			this.button1.TabIndex = 0;
///			this.button1.Text = "button1";
///			this.button1.Click += new System.EventHandler(this.button1_Click);
///			// 
///			// Form1
///			// 
///			this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
///			this.ClientSize = new System.Drawing.Size(292, 273);
///			this.Controls.Add(this.button1);
///			this.Name = "Form1";
///			this.Text = "Form1";
///			this.Load += new System.EventHandler(this.Form1_Load);
///			this.ResumeLayout(false);
///
///		}
///		#endregion
///
///		/// <summary>
///		/// 应用程序的主入口点。
///		/// </summary>
///		[STAThread]
///		static void Main() 
///		{
///			Application.Run(new Form1());
///		}
///
///		private void Form1_Load(object sender, System.EventArgs e)
///		{
///		
///		}
///
///		private void button1_Click(object sender, System.EventArgs e)
///		{
///		
///		}
///	}
///}



///namespace WebApplication1
///{
///		using System;
///		using System.Collections;
///		using System.ComponentModel;
///		using System.Data;
///		using System.Drawing;
///		using System.Web;
///		using System.Web.SessionState;
///		using System.Web.UI;
///		using System.Web.UI.WebControls;
///		using System.Web.UI.HtmlControls;
///	/// <summary>
///	/// WebForm1 的摘要说明。
///	/// </summary>
///	public class WebForm1 : System.Web.UI.Page
///	{
///		private void Page_Load(object sender, System.EventArgs e)
///		{
///			// 在此处放置用户代码以初始化页面
///		}
///
///		#region Web 窗体设计器生成的代码
///		override protected void OnInit(EventArgs e)
///		{
///			//
///			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
///			//
///			InitializeComponent();
///			base.OnInit(e);
///		}
///		
///		/// <summary>
///		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
///		/// 此方法的内容。
///		/// </summary>
///		private void InitializeComponent()
///		{
///			this.Load += new System.EventHandler(this.Page_Load);
///		}
///		#endregion
///	}
///}
