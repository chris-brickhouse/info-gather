using System.ComponentModel.DataAnnotations;

namespace InfoGather.Models {
    public class Users {
        [Key]
        public int UserID { get; set; }
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? Email { get; set; }
        public string? Skills { get; set; }
        public string? Other { get; set; }
    }
}
