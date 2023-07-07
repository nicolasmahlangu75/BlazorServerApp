using DataAccessLibrary.Data;
using DataAccessLibrary.DbAccess;
using DataAccessLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Nick_Blazor.Models;

namespace Nick_Blazor.Data
{
	public class ClassEmployee : IClassEmployee
	{
		IEmployeeData _employeeData { get; set; }

		public ClassEmployee(ISqlDataAccess sqlCommand)
		{
			_employeeData = new EmployeeData(sqlCommand);
		}
		public async Task<IEnumerable<EmployeeModel>> GetEmployees()
		{
			return await _employeeData.GetEmployees();
		}
		public Task<EmployeeModel> GetEmployee(int id)
		{
			return _employeeData.GetEmployee(id);
		}
		public Task InsertEmployee(EmployeeModel employee)
		{
			return _employeeData.InsertEmployee(employee);
		}
		public Task DeleteEmployee(EmployeeModel employee)
		{
			return _employeeData.DeleteEmployee(employee);
		}
		public Task UpdateEmployee(EmployeeModel employee)
		{
			return _employeeData.UpdateEmployee(employee);
		}
	}
}
