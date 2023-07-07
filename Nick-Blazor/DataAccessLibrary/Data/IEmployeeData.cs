using DataAccessLibrary.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccessLibrary.Data
{
	public interface IEmployeeData
	{
		Task DeleteEmployee(EmployeeModel employee);
		Task<EmployeeModel> GetEmployee(int id);
		Task InsertEmployee(EmployeeModel employee);
		Task UpdateEmployee(EmployeeModel employee);
		Task<IEnumerable<EmployeeModel>> GetEmployees();
	}
}