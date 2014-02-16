using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SailingSales.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {

            if(UserName.Text == "admin" || Password.Text == "password")
            {
                Session["authenticated"] = "10-56-34-67-85";
                Response.Redirect("../Administraton/SalesAdmin");

            }
            else
            {
                FailureText.Text = "Login Failure";
                ErrorMessage.Visible = true;
            }
           
        }

       
    }
}