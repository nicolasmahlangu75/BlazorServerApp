using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccessLibrary.DbAccess
{
	public interface ISqlDataAccess
	{
		Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U parameters, string connectionId = "Default");
		Task SaveData<T>(string storedProcedure, T parameters, string connectionId = "Default");
	}
}