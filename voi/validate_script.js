var ok=0;
function check_fname()
{
	var f_val=$("#fname").val();
	if(f_val=="")
	{
		$("#fname").css({"border":"1px solid red"});
		$("#fname_error").text("First Name Must Be Filled!");
		$("#fname_error").css({"margin-top":"5px"});
	}
	else
	{
		$("#fname").css({"border":"1px solid grey"});
		$("#fname_error").text("");
		$("#fname_error").css({"margin-top":"0px"});
		ok++;
	}
}

function check_lname()
{
	var l_val=$("#lname").val();
	if(l_val=="")
	{
		$("#lname").css({"border":"1px solid red"});
		$("#lname_error").text("Last Name Must Be Filled!");
		$("#lname_error").css({"margin-top":"5px"});
	}
	else
	{
		$("#lname").css({"border":"1px solid grey"});
		$("#lname_error").text("");
		$("#lname_error").css({"margin-top":"0px"});
		ok++;
	}
}

function check_email()
{
	var email_val=$("#email").val();
	if(email_val=="" || email_val.indexOf("@")==-1 || email_val.indexOf(".")==-1)
	{
		$("#email").css({"border":"1px solid red"});
		$("#email_error").text("Email Must Be Filled And Valid!");
		$("#email_error").css({"margin-top":"5px"});
	}
	else
	{
		$("#email").css({"border":"1px solid grey"});
		$("#email_error").text("");
		$("#email_error").css({"margin-top":"0px"});
		ok++;
	}
}

function check_pass()
{
	var pass_val=$("#pass").val();
	if(pass_val=="" || pass_val.length<8)
	{
		$("#pass").css({"border":"1px solid red"});
		$("#pass_error").text("Password Must Be Filled And Greater Or Equal To 8!");
		$("#pass_error").css({"margin-top":"5px"});
	}
	else
	{
		
		$("#pass").css({"border":"1px solid grey"});
		$("#pass_error").text("");
		$("#pass_error").css({"margin-top":"0px"});
		ok++;
	}
}

function check_repass()
{
	var repass_val=$("#repass").val();
	if(repass_val=="" || repass_val!=$("#pass").val())
	{
		$("#repass").css({"border":"1px solid red"});
		$("#repass_error").text("Password Must Be Filled And Matched With Above!");
		$("#repass_error").css({"margin-top":"5px"});
	}
	else
	{
		$("#repass").css({"border":"1px solid grey"});
		$("#repass_error").text("");
		$("#repass_error").css({"margin-top":"0px"});
		ok++;
	}
}

function check_country()
{
	var country_val=$("#country").val();
	if(country_val=="")
	{
		$("#country").css({"border":"1px solid red"});
		$("#country_error").text("Country Must Be Filled!");
		$("#country_error").css({"margin-top":"5px"});
	}
	else
	{
		$("#country").css({"border":"1px solid grey"});
		$("#country_error").text("");
		$("#country_error").css({"margin-top":"0px"});
		ok++;
	}
}

function check_form()
{
	if(ok==6)
	{
		return true;
	}
	else
	{
		alert("Error! Check All The Fields");
		return false;
	}
}
