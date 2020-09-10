
using GuestHouse.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GuestHouse.ExperimentalCode
{
    public class GuestView
    {
        [System.Web.Services.WebMethod]
        public static Guest GetGuest(int GuestID)
        {
            Guest guest = new Guest();
            string cs = ConfigurationManager.ConnectionStrings["Trial"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetGuestById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = GuestID
                });
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    guest.ID = Convert.ToInt32(rdr["ID"]);
                    guest.FirstName = rdr["FirstName"].ToString();
                    guest.LastName = rdr["LastName"].ToString();
                    guest.MobileNo = Convert.ToInt32(rdr["MobileNo"]);
                    guest.EmailAddress = rdr["EmailAddress"].ToString();

                }
            }
            return guest;
        }
    }
}