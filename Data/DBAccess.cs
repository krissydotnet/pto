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
        public int Id { get; set; }
        public int UserId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Hours { get; set; }
        public string Comments { get; set; }
        public int TypeId { get; set; }
        public DateTime DateRequested { get; set; }
        public DateTime DateApproved { get; set; }
    }
    public class User
    {
        public int userid;
        public string name;
        public bool admin;
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

        private DataTable RunQuery(string query)
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
            return RunQuery(query);
        }

        public User GetUserInfo(int userid)
        {
            string query = "SELECT userid, name, admin FROM Users where userid=" + userid;
            DataTable results = RunQuery(query);
            if ((results != null) && (results.Rows.Count > 0))
            {
                User userInfo = new User
                {
                    userid = (int)results.Rows[0]["userid"],
                    name = (string)results.Rows[0]["name"],
                    admin = (bool)results.Rows[0]["admin"]
                };
                return userInfo;
            }
            else
            {
                return null;
            }


        }
        public DataTable GetTimeOffType()
        {
            string query = "SELECT typeid, description FROM TimeOffType where credit=0";
            return RunQuery(query);
        }

        public DataTable Report_EmployeeBalance()
        {

            string query = "SELECT userid, name, total_pto - used_pto AS balance_pto " +
                           " FROM Users " ;

            return RunQuery(query);
        }
        public DataTable Report_EmployeeNextScheduledPTO()
        {


            string query = "SELECT Users.name, Users.total_pto - Users.used_pto AS balance_pto, NextEvent.start_date, NextEvent.end_date, NextEvent.hours, NextEvent.description " +
                    " FROM Users LEFT OUTER JOIN " +
                    " (SELECT A.userid, A.start_date, A.end_date, A.hours, B.description, B.credit " +
                    " FROM PTORequests A INNER JOIN " +
                    " TimeOffType B ON A.typeid = B.typeid " +
                    " WHERE B.credit = 0 AND A.start_date = ( " +
                    " SELECT MIN(PTORequests.start_date) " +
                    " FROM PTORequests INNER JOIN " +
                    " TimeOffType ON PTORequests.typeid = TimeOffType.typeid " + 
                    " WHERE(TimeOffType.credit = 0) AND userid = A.userid)) AS NextEvent " +
                    " ON Users.userid = NextEvent.userid" + 
                    " ORDER BY Users.name"; 


      
            return RunQuery(query);
        }

        public DataTable Report_EmployeeDetail(int userid, DateTime start, DateTime end )
        {
            string query = "SELECT PTORequests.start_date, PTORequests.end_date, TimeOffType.description, TimeOffType.credit, PTORequests.hours " +
                          " FROM PTORequests INNER JOIN " +
                          " TimeOffType ON PTORequests.typeid = TimeOffType.typeid INNER JOIN " +
                          " Users ON PTORequests.userid = Users.userid " + 
                          " WHERE Users.userid=@userid " +
                          " AND PTORequests.start_date >= @start " +  
                          " AND PTORequests.start_date <= @end " +
                          " ORDER BY PTORequests.start_date, TimeOffType.description ";

 
            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@userid", userid));
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@start", start));
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@end", end));
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

        public bool InsertPTORequest(PTORequest request)
        {
            SqlConnection con = new SqlConnection(conn);

            try
            {
                SqlCommand cmd = new SqlCommand("spInsertPTORequest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("userid", request.UserId);
                cmd.Parameters.AddWithValue("start_date", request.StartDate);
                cmd.Parameters.AddWithValue("end_date", request.EndDate);
                cmd.Parameters.AddWithValue("hours", request.Hours);
                cmd.Parameters.AddWithValue("comments", request.Comments);
                cmd.Parameters.AddWithValue("typeid", request.TypeId);
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
        
        public DataTable PTORequestsInRange(int userid, DateTime start, DateTime end)
        {
            string query = "SELECT PTORequests.Id, PTORequests.userid, PTORequests.start_date, PTORequests.end_date, PTORequests.hours, TimeOffType.description " +
               " FROM     PTORequests INNER JOIN " +
               " TimeOffType ON PTORequests.typeid = TimeOffType.typeid " +
               " WHERE  (PTORequests.userid = @userid) AND(TimeOffType.credit = 0) AND " +
               " ((PTORequests.start_date BETWEEN @start_date AND @end_date) OR " +
               " (PTORequests.end_date  BETWEEN @start_date AND @end_date) OR " +
               " (PTORequests.start_date <= @start_date AND PTORequests.end_date >= @end_date))";


            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@userid", userid));
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@start_date", start));
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@end_date", end));
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
        public PTORequest GetPTORequestByID(int id, int userid)
        {
            string query = "SELECT Id, userid, start_date, end_date, hours, typeid, comments " +
                           " FROM PTORequests " +
                           " WHERE  id=@id AND userid=@userid";


            SqlConnection con = new SqlConnection(conn);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
    
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, con);
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@id", id));
                dataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@userid", userid));
                con.Open();
                dataAdapter.Fill(dt);
                PTORequest request = new PTORequest
                {
                    Id = Int32.Parse(dt.Rows[0]["id"].ToString()),
                    TypeId = Int32.Parse(dt.Rows[0]["typeid"].ToString()),
                    StartDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString()),
                    EndDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString()),
                    Comments = dt.Rows[0]["comments"].ToString(),
                    Hours = Int32.Parse(dt.Rows[0]["hours"].ToString())
                };
                return request;
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
    }
}
