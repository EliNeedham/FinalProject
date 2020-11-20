using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace FinalProject.MVC.UI.Models
{
    public class ContactViewModel
    {
        //properties adn requirements
        [Required(ErrorMessage = "* Your name is required")]
        public string Name { get; set; }

        [DataType(DataType.EmailAddress)] //put validation with data attributes 
        public string Email { get; set; }
        public string Subject { get; set; }

        [Required(ErrorMessage = "* Message is required")]
        [UIHint("MultilineText")]
        public string Message { get; set; }

    }
}