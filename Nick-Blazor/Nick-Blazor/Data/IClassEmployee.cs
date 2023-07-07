using DataAccessLibrary.Models;

namespace Nick_Blazor.Data
{
	public interface IClassEmployee
	{
		Task DeleteEmployee(EmployeeModel employee);
		Task<EmployeeModel> GetEmployee(int id);
		Task<IEnumerable<EmployeeModel>> GetEmployees();
		Task InsertEmployee(EmployeeModel employee);
		Task UpdateEmployee(EmployeeModel employee);
	}
}