using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLibrary.DbAccess;
using DataAccessLibrary.Models;
using DocumentFormat.OpenXml.Office2010.Excel;

namespace DataAccessLibrary.Data
{
	public class EmployeeData : IEmployeeData
	{
		private readonly ISqlDataAccess _dataAccess;
		public EmployeeData(ISqlDataAccess dataaccess)
		{
			_dataAccess = dataaccess;
		}

		public Task<IEnumerable<EmployeeModel>> GetEmployees() =>
			_dataAccess.LoadData<EmployeeModel, dynamic>(storedProcedure: "dbo.spUser_GetAll", new { });

		public async Task<EmployeeModel>GetEmployee(int id)
		{
			IEnumerable<EmployeeModel>results = await _dataAccess.LoadData<EmployeeModel, dynamic>(
				storedProcedure: "dbo.spUser_Get",
				new { Idnumber = id });

			return results.FirstOrDefault();
		}

		public Task InsertEmployee(EmployeeModel employee) =>
		   _dataAccess.SaveData(storedProcedure: "dbo.spUser_Insert", new { employee.FirstName, employee.LastName, employee.EmailAddress, employee.Contact });
		public async Task UpdateEmployee(EmployeeModel employee)
		{
			await _dataAccess.SaveData(storedProcedure: "dbo.spUser_Update", new { employee.Idnumber, employee.FirstName, employee.LastName, employee.EmailAddress, employee.Contact });

		}	
		public async Task DeleteEmployee(EmployeeModel employee) =>
			await _dataAccess.SaveData(storedProcedure: "dbo.spUser_Delete", new { employee.Idnumber});

		//public async Task DeleteEmployee(int id)
		//{
		//	_dataAccess.SaveData(storedProcedure: "dbo.spUser_Delete", new { Id = id }); 
		//}

		//public async Task DeleteEmployee(int id)
		//{
		//	await _dataAccess.SaveData(storedProcedure: "dbo.spUser_Delete", new { Id = id });
		//}
	}
}
