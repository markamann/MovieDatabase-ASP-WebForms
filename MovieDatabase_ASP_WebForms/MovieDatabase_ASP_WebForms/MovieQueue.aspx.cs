using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieDatabase_ASP_WebForms
{
    public partial class MovieQueue : System.Web.UI.Page
    {

        private DataTable _Table = null;
        private String SQL = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            long r = Global.BLL_MovieQueue.SelectCount();
            lblTotalQueueRecords.Text = r.ToString();

            SQL = "SELECT TOP 100 [Timestamp], IMDBID, Title, [Year], [Type], [Priority] FROM dbo.MovieQueue ORDER BY [Priority], [Timestamp]";
            using (SqlConnection con = new SqlConnection(Connections.ConnectionStrings.MovieDatabaseConnectionString_Private))
            {
                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        _Table = new DataTable();
                        adapter.Fill(_Table);
                    }
                }
            }

            if (_Table != null)
            {
                if (_Table.Rows.Count > 0)
                {
                    gvResults.DataSource = _Table;
                    gvResults.DataBind();
                    pnlResults.Visible = true;
                }
                else
                {

                }
            }

        }

        private long GetMovieQueueCount()
        {
            long r = -1;
            SQL = "SELECT COUNT(*) FROM MovieQueue";
            using (SqlConnection con = new SqlConnection(Connections.ConnectionStrings.MovieDatabaseConnectionString_Private))
            {
                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    r = Convert.ToInt64(cmd.ExecuteScalar());
                }
            }
            return r;
        }




    }
}