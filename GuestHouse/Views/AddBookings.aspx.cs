using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuestHouse.Views
{
    public partial class AddBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ddlBT.DataSource = getData("spGetBookingType", null);
                ddlBT.DataBind();
                ddlBT.Items.Insert(0, new ListItem("", "0"));

                ddlGH.DataSource = getData("spGetGuestHouse", null);
                ddlGH.DataBind();
                ddlGH.Items.Insert(0, new ListItem("", "0"));


            }
            
        }
        protected void ddlGH_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRT.Items.Clear();
            ddlGH.Items.Insert(0, new ListItem("", "0"));
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("spGetAvailableRoomTypes", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@GuestHouseID", ddlGH.SelectedItem.Value);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlRT.DataSource = dt;
            ddlRT.DataBind();
        }

        protected void ddlRT_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAR.Items.Clear();
            ddlAR.Items.Insert(0, new ListItem("", "0"));
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("spGetAvailableRooms", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@GuestHouseID", ddlGH.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@RoomTypeID", ddlRT.SelectedItem.Value);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlAR.DataSource = dt;
            ddlAR.DataBind();
        }
        private DataSet getData(string Proc, SqlParameter Parameter)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlDataAdapter DA = new SqlDataAdapter(Proc, con);
                DA.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (Parameter != null)
                {
                    DA.SelectCommand.Parameters.Add(Parameter);
                }
                DataSet DS = new DataSet();
                DA.Fill(DS);
                return DS;
            }
        }
    }
}