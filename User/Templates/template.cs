namespace ConsoleApplication
{
	using System;
		/// <summary>
		/// Class1 ��ժҪ˵����
		/// </summary>
	public class 
	{
		/// <summary>
		/// Ӧ�ó��������ڵ㡣
		/// </summary>
		//[STAThread]
		static void Main(string[] args)
		{
			//
			// TODO: �ڴ˴���Ӵ���������Ӧ�ó���
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
///	/// Form1 ��ժҪ˵����
///	/// </summary>
///	public class Form1 : System.Windows.Forms.Form
///	{
///		private System.Windows.Forms.Button button1;
///		/// <summary>
///		/// ����������������
///		/// </summary>
///		private System.ComponentModel.Container components = null;
///
///		public Form1()
///		{
///			//
///			// Windows ���������֧���������
///			//
///			InitializeComponent();
///
///			//
///			// TODO: �� InitializeComponent ���ú�����κι��캯������
///			//
///		}
///
///		/// <summary>
///		/// ������������ʹ�õ���Դ��
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
///		#region Windows ������������ɵĴ���
///		/// <summary>
///		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
///		/// �˷��������ݡ�
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
///		/// Ӧ�ó��������ڵ㡣
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
///	/// WebForm1 ��ժҪ˵����
///	/// </summary>
///	public class WebForm1 : System.Web.UI.Page
///	{
///		private void Page_Load(object sender, System.EventArgs e)
///		{
///			// �ڴ˴������û������Գ�ʼ��ҳ��
///		}
///
///		#region Web ������������ɵĴ���
///		override protected void OnInit(EventArgs e)
///		{
///			//
///			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
///			//
///			InitializeComponent();
///			base.OnInit(e);
///		}
///		
///		/// <summary>
///		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
///		/// �˷��������ݡ�
///		/// </summary>
///		private void InitializeComponent()
///		{
///			this.Load += new System.EventHandler(this.Page_Load);
///		}
///		#endregion
///	}
///}
