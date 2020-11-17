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
        [StringLength(100, ErrorMessage = " *Please do not exceed 100 characters :)")]
        public string CompanyName { get; set; }

        [Display(Name = "First Name")]
        [StringLength(50, ErrorMessage = "*Please do not exceed 50 characters.")]
        [Required(ErrorMessage = " * First name is required.")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = "*Please do not exceed 50 characters.")]
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
        [Required(ErrorMessage = " *Type of service is required")]
        public string ServiceType { get; set; }

        [DisplayFormat(DataFormatString = "{0:c}")]
        [Required(ErrorMessage = " *Cost of service is required")]
        [Range(0, double.MaxValue, ErrorMessage = "* price must be a valid number, 0 or larger")]
        public decimal Price { get; set; }
    }

}
