using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuestHouse.Models
{
    public class RoomModel
    {
        public int RoomID { get; set; }
        public string RoomNumber { get; set; }
        public string RoomImage { get; set; }
        public string RoomPrice { get; set; }
        public int BookingStatusID { get; set; }
        public int RoomTypeID { get; set; }
        public int RoomCapacity { get; set; }
        public string RoomDescription { get; set; }

        public int GuestHouseID { get; set; }
        public HttpPostedFileBase InputImage { get; set; }


        // public List<SelectListItem> ListOfBookingStatus { get; set; }
    }
}