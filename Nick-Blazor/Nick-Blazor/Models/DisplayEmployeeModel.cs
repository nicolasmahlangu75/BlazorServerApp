using System.ComponentModel.DataAnnotations;
using System;
using System.Collections.Generic;

namespace Nick_Blazor.Models
{
	public class DisplayEmployeeModel
	{

		[Required]
		[StringLength(20, ErrorMessage = "First name is too long (Max length 20 character)")]
		[MinLength(5 , ErrorMessage = "First name is too short (Min length 5 character)")]
		public string FirstName { get; set; }

		[Required]
		[StringLength(10, ErrorMessage = "Last name is too long (Max length 10 character)")]
		public string LastName { get; set; }

		[Required,EmailAddress]
		public string EmailAddress { get; set; }

		[Required, Phone]
		public string Contact { get; set; }

	}
}
