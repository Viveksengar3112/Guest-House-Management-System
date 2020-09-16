using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GuestHouse.Models
{
    public class RoomModel
    {
        public int RoomID { get; set; }
        [Required(ErrorMessage = "This is a required field.")]
        public string RoomNumber { get; set; }

        public string RoomImage { get; set; }
        [Required(ErrorMessage = "This is a required field.")]
        public string RoomPrice { get; set; }
        [Required(ErrorMessage = "This is a required field.")]
        public int BookingStatusID { get; set; }
        [Required(ErrorMessage = "This is a required field.")]
        public int RoomTypeID { get; set; }
        [Required(ErrorMessage = "This is a required field.")]
        public int RoomCapacity { get; set; }
        public string RoomDescription { get; set; }

        [Required(ErrorMessage = "This is a required field.")]
        public int GuestHouseID { get; set; }
        public HttpPostedFileBase InputImage { get; set; }


        // public List<SelectListItem> ListOfBookingStatus { get; set; }
    }
}