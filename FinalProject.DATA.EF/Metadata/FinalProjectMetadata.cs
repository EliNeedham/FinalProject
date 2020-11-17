using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.DATA.EF//.Metadata
{
    public class UserDetailsMetadata 
    {
        //public string UserId { get; set; }

        [Display(Name = "Company Name")]
        [StringLength(100, ErrorMessage = " * Please do not exceed 100 characters :)")]
        public string CompanyName { get; set; }

        [Display(Name = "First Name")]
        [StringLength(50, ErrorMessage = " * Please do not exceed 50 characters.")]
        [Required(ErrorMessage = " * First name is required.")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = " * Please do not exceed 50 characters.")]
        [Required(ErrorMessage = " * Last name is required")]
        public string LastName { get; set; }

        [Display(Name = "Profile Picture")]
        public string UserPhoto { get; set; }

    }

    [MetadataType(typeof(UserDetailsMetadata))]
    public partial class UserDetails
    {
        [Display(Name = "Name")]
        public string FullName { get { return FirstName + " " + LastName; } }
    }

    public class ServicesMetadata
    {
        //public int ServiceId { get; set; }

        [Display(Name = "Service")]
        [Required(ErrorMessage = " * Type of service is required")]
        public string ServiceType { get; set; }

        [DisplayFormat(DataFormatString = "{0:c}")]
        [Required(ErrorMessage = " * Cost of service is required")]
        [Range(0, double.MaxValue, ErrorMessage = "* Price must be a valid number, 0 or larger")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = " * A description of the service is required.")]
        [StringLength(300, ErrorMessage = " * Please do not exceed 300 characters.")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(ServicesMetadata))]
    public partial class Services { }

    public class ReservationsMetadata
    {
        //public int ReservationId { get; set; }
        //public int HomeId { get; set; }
        //public int LocationId { get; set; }

        [Display(Name ="Reservation Date")]
        [Required(ErrorMessage = " *Please enter a date for your reservation.")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime ReservationDate { get; set; }

        //public Nullable<int> ServiceId { get; set; }
    }

    [MetadataType(typeof(ReservationsMetadata))]
    public partial class Reservations { }

    public partial class LocationsMetadata
    {
        //public int LocationId { get; set; }

        [Display(Name = "Office Location")]
        [Required(ErrorMessage = " * Please enter a location name.")]
        [StringLength(50, ErrorMessage = " * Please do not exceed 50 characters.")]
        public string LocationName { get; set; }

        [Required(ErrorMessage = " * Please enter an address.")]
        [StringLength(50, ErrorMessage = " * Please do not exceed 100 characters.")]
        public string Address { get; set; }

        [Required(ErrorMessage = " * Please enter a City.")]
        [StringLength(100, ErrorMessage = " * Please do not exceed 100 characters.")]
        public string City { get; set; }

        [Required(ErrorMessage = " * Please enter a State.")]
        [StringLength(2, ErrorMessage = " * Please do not exceed 2 characters.")]
        public string State { get; set; }

        [Display(Name = "Zip Code")]
        [Required(ErrorMessage = " * Please enter a zip code.")]
        [StringLength(5, ErrorMessage = " * Please do not exceed 5 characters.")]
        public string ZipCode { get; set; }

        [Display(Name = "Daily Reservation Limit")]
        [Required(ErrorMessage = " * Please enter a limit.")]
        public byte ReservationLimit { get; set; }
    }

    [MetadataType(typeof(LocationsMetadata))]
    public partial class Locations { }

    public class HomesMetadata
    {
        //public int HomeId { get; set; }
        [Display(Name ="Home Name")]
        [Required(ErrorMessage = " * Please enter a name for the home.")]
        [StringLength(50, ErrorMessage = " * Please do not exceed 50 characters.")]
        public string HomeName { get; set; }

        [Required(ErrorMessage = " * Please enter an address.")]
        [StringLength(100, ErrorMessage = " * Please do not exceed 100 characters.")]
        public string Address { get; set; }

        [Required(ErrorMessage = " * Please enter a City.")]
        [StringLength(100, ErrorMessage = " * Please do not exceed 100 characters.")]
        public string City { get; set; }

        [Required(ErrorMessage = " * Please enter a State.")]
        [StringLength(2, ErrorMessage = " * Please do not exceed 2 characters.")]
        public string State { get; set; }

        [Display(Name = "Zip Code")]
        [Required(ErrorMessage = " * Please enter a zip code.")]
        [StringLength(5, ErrorMessage = " * Please do not exceed 5 characters.")]
        public string ZipCode { get; set; }

        //public string OwnderId { get; set; }

        [Display(Name = "Home Photo")]
        public string HomePhoto { get; set; }

        [Display(Name = "Notes about the home")]
        [Required(ErrorMessage = " * Please enter a short note here detailing anything we should know about the home.")]
        [StringLength(300, ErrorMessage = " * Please do not exceed 300 characters.")]
        public string SpecialNotes { get; set; }

        //public bool IsActive { get; set; }

        [Display(Name = "Date Added")]
        [Required(ErrorMessage = " *Please enter a date for your reservation.")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime DateAdded { get; set; }
    }

    [MetadataType(typeof(HomesMetadata))]
    public partial class Homes { }
}
