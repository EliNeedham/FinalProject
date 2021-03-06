//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FinalProject.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Homes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Homes()
        {
            this.Reservations = new HashSet<Reservations>();
        }
    
        public int HomeId { get; set; }
        public string HomeName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string OwnderId { get; set; }
        public string HomePhoto { get; set; }
        public string SpecialNotes { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime DateAdded { get; set; }
    
        public virtual UserDetails UserDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reservations> Reservations { get; set; }
    }
}
