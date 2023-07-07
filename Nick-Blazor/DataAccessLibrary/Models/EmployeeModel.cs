using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibrary.Models
{
	public class EmployeeModel
	{
        public int Idnumber { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]  
        public string LastName { get; set; }

        [Required, EmailAddress]
        public string EmailAddress { get; set; }
        [Required,Phone]
        public string Contact { get; set; }

    }
}
