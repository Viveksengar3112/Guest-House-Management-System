using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuestHouse.Views
{
    public partial class admin1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(Session["email"]);
            /*
            if (Session["email"] == null) {
                Response.Redirect("Login.aspx");
            }
            */
        }
        /*
        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        */
    }
}