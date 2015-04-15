<%@ Page language="c#" %>
<script runat="server">

	private void Page_Load(object sender, System.EventArgs e)
	{
		
	}

	#region Web Form Designer generated code
	override protected void OnInit(EventArgs e)
	{
		// 
		// CODEGEN: This call is required by the ASP.NET Web Form Designer.
		// 
		InitializeComponent();
		base.OnInit(e);
	}
	
	/// <summary>
	/// Required method for Designer support - do not modify
	/// the contents of this method with the code editor.
	/// </summary>
	private void InitializeComponent()
	{    
		this.Submit1.ServerClick += new System.EventHandler(this.Submit1_ServerClick);
		this.Load += new System.EventHandler(this.Page_Load);

	}
	#endregion

	private void Submit1_ServerClick(object sender, System.EventArgs e)
	{
		if( ( File1.PostedFile != null ) && ( File1.PostedFile.ContentLength > 0 ) )
		{
			try
			{
				//old name
				string oldfn = System.IO.Path.GetFileName(File1.PostedFile.FileName);
				
				string extension = System.IO.Path.GetExtension(oldfn);
				string fn = guidDiv.Text + extension;  
				string SaveLocation = Server.MapPath("Data") + "\\" +  fn;
				
				
				File1.PostedFile.SaveAs(SaveLocation);
				Response.Write("The file has been uploaded!");// to:" + SaveLocation);
			}
			catch ( Exception ex )
			{
				Response.Write("You encountered an error!");
				//Response.Write("Error: " + ex.Message);
				//Note: Exception.Message returns a detailed message that describes the current exception. 
				//For security reasons, we do not recommend that you return Exception.Message to end users in 
				//production environments. It would be better to return a generic error message. 
			}
		}
		else
		{
			Response.Write("Please select a file to upload.");
		}
	}
	

</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
    <title>WebForm1</title>
  </HEAD>
<body>
	<form id="Form1" method="post" enctype="multipart/form-data" runat="server">
		<asp:TextBox id="guidDiv" runat="server" Text="noval" />
		<INPUT type=file id=File1 name=File1 runat="server" >
		<br>
		<input type="button" id="Submit1" value="Upload" runat="server" NAME="Submit1">
	</form>
</body>
<script type="text/javascript">
window.onload = function() {
	var guidfull = top.window.document.getElementById("guid_box").innerHTML;
	var guidfullS = guidfull.toString();
	var guidTrimmed = guidfullS.replace('{', '');
	guidTrimmed = guidTrimmed.replace('}', '');
	guidTrimmed = guidTrimmed.replace(/ /g, '');
	document.getElementById("<%=guidDiv.ClientID%>").value = guidTrimmed;
	document.getElementById("<%=guidDiv.ClientID%>").style.display = "none";
	var writeElem = top.window.document.getElementById("input_id_box").innerHTML;
	top.window.document.getElementById(writeElem).style.display = "none";
	top.window.document.getElementById(writeElem).innerHTML = guidTrimmed;
}
</script>
</HTML>
		