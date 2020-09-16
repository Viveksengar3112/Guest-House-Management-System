using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace GuestHouse.Views
{
    public partial class PendingRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            string DBCS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            SqlConnection con = new SqlConnection(DBCS);
            SqlDataAdapter da = new SqlDataAdapter("Select * from Registration", con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            string json = JsonConvert.SerializeObject(ds, Formatting.Indented);

            System.Diagnostics.Debug.WriteLine(json);
            System.Diagnostics.Debug.WriteLine("Page Load");
            */


        }

        [System.Web.Services.WebMethod]
        public static string GetPendingRequests()
        {
            string DBCS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            SqlConnection con = new SqlConnection(DBCS);
            SqlDataAdapter da = new SqlDataAdapter("Select * from Registration", con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            string json = JsonConvert.SerializeObject(ds, Formatting.Indented);

            System.Diagnostics.Debug.WriteLine(json);
            System.Diagnostics.Debug.WriteLine("function call");

            return json;
        }

    }
}