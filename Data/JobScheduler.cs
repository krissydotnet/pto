using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace DataLayer
{
    public class JobScheduler
    {
  

        public static void HandleError(Exception ex, string source)
        {

            ExceptionUtility.LogException(ex, source);
        }
        public static void RunDailyCheckPTOOccurred(string conn)
        {

        }
        public static void RunAccrualJob(string conn)
        {
            SqlConnection con = new SqlConnection(conn);

            try
            {
                SqlCommand cmd = new SqlCommand("spAutoAccrual", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                HandleError(ex, "spAutoAccrual");

            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }


        }
        public static void RunDailyPTOCheck(string conn)
        {
            SqlConnection con = new SqlConnection(conn);

            try
            {
                SqlCommand cmd = new SqlCommand("spUpdatePTOUsed", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                HandleError(ex, "spUpdatePTOUsed");

            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }


        }


    }
}
