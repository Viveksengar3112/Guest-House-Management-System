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

        [System.Web.Services.WebMethod]
        public static void RejectRequests(string[] values)
        {       
            try
            {
                System.Diagnostics.Debug.WriteLine(values);
                
                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                foreach (string email in values) {
                    using (con)
                    {
                        SqlCommand sc = new SqlCommand("dbo.spPendingRegistration", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };

                        sc.Parameters.AddWithValue("@Action", "DELETE");
                        sc.Parameters.AddWithValue("@Email", email);
                        con.Open();
                        sc.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Web.Services.WebService wsError = new System.Web.Services.WebService();
                wsError.Context.Response.StatusCode = 500;

                wsError.Context.Response.AppendHeader("error", ex.Message);

            }

        }

        [System.Web.Services.WebMethod]
        public static void AcceptRequests(string[] values)
        {
            try
            {
                System.Diagnostics.Debug.WriteLine(values);

                string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                foreach (string email in values)
                {
                    using (con)
                    {
                        SqlCommand sc = new SqlCommand("dbo.spPendingRegistration", con)
                        {
                            CommandType = CommandType.StoredProcedure
                        };

                        sc.Parameters.AddWithValue("@Action", "ACCEPT");
                        sc.Parameters.AddWithValue("@Email", email);
                        con.Open();
                        sc.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Web.Services.WebService wsError = new System.Web.Services.WebService();
                wsError.Context.Response.StatusCode = 500;

                wsError.Context.Response.AppendHeader("error", ex.Message);

            }

        }

    }
}