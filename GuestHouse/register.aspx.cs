using GuestHouse.Models;
using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.ComponentModel.DataAnnotations;

namespace GuestHouse
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       

        [System.Web.Services.WebMethod]
        public static object SaveGuestDetails(object guestData)
        {
            object o = string.Empty;
           // List<Guest> GuestDetails = new JavaScriptSerializer().ConvertToType<List<Guest>>(guestData);
           Guest g= new JavaScriptSerializer().ConvertToType<Guest>(guestData);
            System.Diagnostics.Debug.WriteLine("Hello!");
           
                System.Diagnostics.Debug.WriteLine("Hello!");
                /*   var context = new ValidationContext(g, serviceProvider: null, items: null);
                      var results = new List<ValidationResult>();

                      var isValid = Validator.TryValidateObject(g, context,results);

                      if(!isValid)
                      {
                          foreach( var validationResult in results)
                          {
                              throw new ArgumentException("Please fill all the mandatory fields.");
                          }
                      }
                  */
               // string sql= @"insert into dbo.Guest(FirstName,LastName,EmailAddress,MobileNo,ID)
                          //  values(@FirstName,@LastName,@EmailAddress,@MobileNo,ID);";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                {
                    try
                    {
                        SqlCommand sc = new SqlCommand("dbo.spInsertGuest", con);
                       sc.CommandType = CommandType.StoredProcedure;
                        
                        sc.Parameters.AddWithValue("@FirstName", g.FirstName.Trim());
                        sc.Parameters.AddWithValue("@LastName", g.LastName.Trim());
                        sc.Parameters.AddWithValue("@EmailAddress", g.EmailAddress.Trim());
                        sc.Parameters.AddWithValue("@MobileNo", g.MobileNo.Trim());
                        sc.Parameters.AddWithValue("@ID", g.ID.Trim());
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