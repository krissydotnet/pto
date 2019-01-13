using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataLayer
{

    public class PTORequest
    {
        public int userid;
        public DateTime start_date;
        public DateTime end_date;
        public int hours;
        public string comments;
        public int typeid;
        public DateTime date_requested;
        public DateTime date_approved;
    }

    public class DBAccess
    {

        private string conn;
        public bool error = false;
        public string errorMessage = "";

        public DBAccess(string connString)
        {
            conn = connString;
            
        }

        private void HandleError(Exception ex) {
                error = true;
                errorMessage = ex.ToString();
        }

        public DataTable runQuery(string query)
        {
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);
                con.Open();
                dataAdapter.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                HandleError(ex);
                return null;
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }
        }
        public DataTable GetUsers()
        {
            string query = "SELECT userid, name, admin FROM Users where active=1";
            return runQuery(query);
        }
        public DataTable GetTimeOffType()
        {
            string query = "SELECT typeid, description FROM TimeOffType where credit=0";
            return runQuery(query);
        }

        public DataTable Report_EmployeeBalance()
        {
            string subquery = "SELECT A.userid, A.Id, MIN(A.start_date) AS next_pto " +
                           " FROM PTORequests A INNER JOIN " +
                           " TimeOffType B ON A.typeid = B.typeid " +
                           " AND A.start_date >= GetDate() " +
                           " AND B.credit = 0 " +
                           " GROUP BY A.userid, A.Id ";
                

            string query = "SELECT C.userid, C.name, C.total_pto - C.used_pto AS balance_pto, E.start_date, E.end_date, E.hours, E.comments " +
                           " FROM Users C LEFT OUTER JOIN " + 
                           " (" + subquery + ") D  ON " +
                           " C.userid = D.userid LEFT OUTER JOIN " +
                           " PTORequests E ON E.Id = D.Id " ;

            
            return runQuery(query);
        }

        public DataTable Report_EmployeeDetail(int userid)
        {
            string query = "SELECT PTORequests.start_date, PTORequests.end_date, TimeOffType.description, TimeOffType.credit, PTORequests.hours " +
                          " FROM PTORequests INNER JOIN " +
                          " TimeOffType ON PTORequests.typeid = TimeOffType.typeid INNER JOIN " +
                          " Users ON PTORequests.userid = Users.userid " + 
                          " WHERE Users.userid=" + userid +
                          " ORDER BY PTORequests.start_date, TimeOffType.description ";

            return runQuery(query);
        }

        public bool InsertPTORequest(PTORequest request)
        {
            SqlConnection con = new SqlConnection(conn);

            try
            {
                SqlCommand cmd = new SqlCommand("spInsertPTORequest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("userid", request.userid);
                cmd.Parameters.AddWithValue("start_date", request.start_date);
                cmd.Parameters.AddWithValue("end_date", request.end_date);
                cmd.Parameters.AddWithValue("hours", request.hours);
                cmd.Parameters.AddWithValue("comments", request.comments);
                cmd.Parameters.AddWithValue("typeid", request.typeid);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                HandleError(ex);
                
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }

            return (error) ? false : true;

        }
    }
}
