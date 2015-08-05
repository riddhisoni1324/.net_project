<%  lab.text = "hii"; %>
<html>
<head runat="server">
    <script type="text/javascript" src="Scripts/jquery-1.4.1-vsdoc.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-validate.js"></script>
    <script type="text/javascript" src="Scripts/jquery.validate.aspnet.js"></script>
    <script type="text/javascript" src="Scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#Button1").click(function() {
                alert("Hello world!");
            });

            $('#txtAge').keydown(function(e) {

	        if (e.shiftKey || e.ctrlKey || e.altKey) {
		        e.preventDefault();
	        } else {

		        var key = e.keyCode;
		        if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
			        e.preventDefault();
		        }
	          }
	        });

                 //custom rule to check regular expression   
            $.validator.addMethod("match", function(value, element)   
            {  
                return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/i.test(value);  
            }, "Please enter a valid email address.");
            
            $("#form1").validate({  
                rules: {  
                     <%=txtAge.UniqueID %>: {                           
                         range: [10, 20],                           
                     },  
                      <%=txtName.UniqueID %>:{  
                        required:true,
                        minlength:3  
                    },   
                    <%=txtEmailId.UniqueID %>: {  
                         match: true  
                     },
                },  
                messages: {  
                    //This section we need to place our custom validation message for each control.  
                    <%=txtAge.UniqueID %>: {  
                        range: "Age should be between {0} and {1}",
                                           },
                    <%=txtName.UniqueID %>:{  
                          required: "Name is required."  ,
                          minlength: "name contains atleast 3 character"

                      },
                    <%=txtEmailId.UniqueID %>:{
                        match:"Enter valid email id"
                     },   
                },          
            });  
 
        });

    </script>
    <style type="text/css">
        label.error
        {
            color: red;
            display: inline-flex;
        }
        .errorClass { border:  1px solid red; }
    </style>
</head>
<body>
    <form id="form1" runat="server"><br />
    Name
    <asp:TextBox ID="txtName" runat="server" style="margin-left: 76px" 
        Width="170px"></asp:TextBox>
    <br /><br />
    Age
    <asp:TextBox ID="txtAge" runat="server" CausesValidation="True" 
        style="margin-left: 86px" Width="174px"></asp:TextBox>
    <br /><br />
    Email Id
    <asp:TextBox ID="txtEmailId" runat="server" CausesValidation="True" 
        style="margin-left: 60px" Width="175px"></asp:TextBox>
    <br /><br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
       /><br /><br />
    <asp:Button ID="Button1" runat="server" Text="Alert" />
    <asp:Label ID="lab"></asp:Label>
    </form>
</body>
</html>

