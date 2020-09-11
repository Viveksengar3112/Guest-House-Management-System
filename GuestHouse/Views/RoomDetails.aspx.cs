using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GuestHouse.Models;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.ComponentModel.DataAnnotations;
using System.IO;

namespace GuestHouse.Views
{
    public partial class RoomDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public  object SaveRoomDetails(object roomData)
        {
            System.Diagnostics.Debug.WriteLine("Hello!");
            object o = string.Empty;
            RoomModel r = new JavaScriptSerializer().ConvertToType<RoomModel>(roomData);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                try
                {
                    SqlCommand sc = new SqlCommand("dbo.spInsertRoom", con);
                    sc.CommandType = CommandType.StoredProcedure;
                    string ImageUniqueName = Guid.NewGuid().ToString();
                    string ActualImageName = ImageUniqueName + Path.GetExtension(r.InputImage.FileName);
                    r.InputImage.SaveAs(Server.MapPath("~/RoomImages/" + ActualImageName));
                    
                    sc.Parameters.AddWithValue("@RoomNumber", r.RoomNumber.Trim());
                    sc.Parameters.AddWithValue("@RoomPrice", r.RoomPrice.Trim());
                    sc.Parameters.AddWithValue("@BookingStatusID", r.BookingStatusID);
                    sc.Parameters.AddWithValue("@RoomTypeID", r.RoomTypeID);
                    sc.Parameters.AddWithValue("@RoomCapacity", r.RoomCapacity);
                    sc.Parameters.AddWithValue("@RoomDescription", r.RoomDescription.Trim());
                    sc.Parameters.AddWithValue("@GuestHouseID", r.GuestHouseID);
                    sc.Parameters.AddWithValue("@RoomImage", ActualImageName.Trim());
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
    }
}