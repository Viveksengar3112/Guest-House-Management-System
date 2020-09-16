using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using GuestHouse.Models;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Web;
using System.Web.Services.Protocols;

namespace GuestHouse.Views
{
    public partial class RoomDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListRoom.DataSource = getData("spGetRoomType", null);
                DropDownListRoom.DataBind();
                ListItem LIRoomType = new ListItem("---Select---", "-1");
                DropDownListRoom.Items.Insert(0, LIRoomType);

                DropDownListBS.DataSource = getData("spGetBookingStatus", null);
                DropDownListBS.DataBind();
                ListItem LIBookingStatus = new ListItem("---Select---", "-1");
                DropDownListBS.Items.Insert(0, LIBookingStatus);

                DropDownListGH.DataSource = getData("spGetGuestHouse", null);
                DropDownListGH.DataBind();
                ListItem LIGuestHouse = new ListItem("---Select---", "-1");
                DropDownListGH.Items.Insert(0, LIGuestHouse);

                this.BindRepeater();
            }
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
        [System.Web.Services.WebMethod]
        public static object SaveRoomDetails(object roomData)
        {
            System.Diagnostics.Debug.WriteLine("Hello!");
            object o = string.Empty;
            RoomModel r = new JavaScriptSerializer().ConvertToType<RoomModel>(roomData);


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                try
                {
                    SqlCommand sc = new SqlCommand("dbo.spRoomDetailsCRUD", con);
                    sc.CommandType = CommandType.StoredProcedure;
                    // string ImageUniqueName = Guid.NewGuid().ToString();
                    // string ActualImageName = ImageUniqueName + Path.GetExtension(r.InputImage.FileName);
                    //  r.InputImage.SaveAs(HttpContext.Current.Server.MapPath("~/RoomImages/" + ActualImageName));
                    sc.Parameters.AddWithValue("@Action", "INSERT");
                    sc.Parameters.AddWithValue("@RoomNumber", r.RoomNumber.Trim());
                    sc.Parameters.AddWithValue("@RoomPrice", r.RoomPrice.Trim());
                    sc.Parameters.AddWithValue("@BookingStatusID", r.BookingStatusID);
                    sc.Parameters.AddWithValue("@RoomTypeID", r.RoomTypeID);
                    sc.Parameters.AddWithValue("@RoomCapacity", r.RoomCapacity);
                    sc.Parameters.AddWithValue("@RoomDescription", r.RoomDescription.Trim());
                    sc.Parameters.AddWithValue("@GuestHouseID", r.GuestHouseID);
                    // sc.Parameters.AddWithValue("@RoomImage", ActualImageName.Trim());
                    con.Open();
                    sc.ExecuteNonQuery(); System.Diagnostics.Debug.WriteLine("Hello2!");
                    con.Close();
                }


                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return o;
        }

        [System.Web.Services.WebMethod]
        public static RoomViewModel GetRoomDetails()
        {
            RoomViewModel room = new RoomViewModel();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spRoomDetailsCRUD", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    room.RoomNumber = rdr["RoomNumber"].ToString();
                    room.RoomPrice = rdr["RoomPrice"].ToString();
                    room.BookingStatus = rdr["BookingStatus"].ToString();
                    room.RoomType = rdr["RoomType"].ToString();
                    room.RoomCapacity = Convert.ToInt32(rdr["RoomCapacity"]);
                    room.RoomDescription = rdr["RoomDescription"].ToString();
                    room.GuestHouse = rdr["Name"].ToString();

                }
            }
            return room;
        }

        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("spGetRoomDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    RoomTable.DataSource = dt;
                    RoomTable.DataBind();
                }

            }
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as HtmlButton).Parent as RepeaterItem;
            int RoomID = int.Parse((item.FindControl("lblRoomID") as Label).Text);

            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("spRoomDetailsCRUD"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "DELETE");
                    cmd.Parameters.AddWithValue("@RoomID", RoomID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
        }


    }
    
}