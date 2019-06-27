using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace MovieDatabase_ASP_WebForms
{
    public partial class MovieDetail : System.Web.UI.Page
    {

        private SqlConnection _Cn = new SqlConnection(Connections.ConnectionStrings.MovieDatabaseConnectionString_Private);
        private SqlCommand _Cmd = null;
        private DataTable _Table = null;
        private SqlDataAdapter _Adapter = null;
        private String SQL = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["MovieID"] != null)
            {
                String MovieID = this.Session["MovieID"].ToString();
                DA.Models.MovieDatabase.Movie movie = Global.BLL_Movies.SelectByMovieID_model(Int64.Parse(MovieID));

                // Base
                lblTitle.Text = movie.Title;
                lblOriginalTitle.Text = movie.OriginalTitle;
                lblIMDBID.Text = movie.IMDBID;
                lblType.Text = movie.Type;
                lblMPAARating.Text = movie.MPAARating;
                lblReleaseDate.Text = ConvertDate(movie.ReleaseDate);
                lblYear.Text = movie.Year;
                lblRuntime.Text = movie.Runtime;
                lblRating.Text = movie.Rating;
                lblMetascore.Text = movie.Metascore;
                if (movie.Votes != -1)
                {
                    lblVotes.Text = movie.Votes.ToString();
                }
                else
                {
                    lblVotes.Text = "";
                }
                lbSeriesIMDBID.Text = movie.SeriesIMDBID;
                lblSeriesName.Text = movie.SeriesName;
                linklIMDBURL.Text = movie.IMDBURL;
                linklIMDBURL.Target = "_blank";
                linklIMDBURL.NavigateUrl = movie.IMDBURL;
                lblSimplePlot.Text = movie.SimplePlot;
                lblPlot.Text = movie.Plot;

                // Cast
                SQL = "SELECT TOP 20 PersonID, ActorIMDBID, ActorName, CharacterName, IMDBCharacterURL FROM CastMembers WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
                _Cn.Open();
                _Cmd = new SqlCommand(SQL, _Cn);
                _Table = new DataTable();
                _Adapter = new SqlDataAdapter(_Cmd);
                _Adapter.Fill(_Table);
                _Cn.Close();
                _Adapter.Dispose();
                _Cmd.Dispose();

                if (_Table != null)
                {
                    gvCast.DataSource = _Table;
                    gvCast.DataBind();
                }

                // Directors
                SQL = "SELECT D.MovieID, D.DirectorIMDBID, D.DirectorPersonID, P.FullName, P.IMDBURL FROM Directors D INNER JOIN People P ON D.DirectorPersonID = P.PersonID WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
                _Cn.Open();
                _Cmd = new SqlCommand(SQL, _Cn);
                _Table = new DataTable();
                _Adapter = new SqlDataAdapter(_Cmd);
                _Adapter.Fill(_Table);
                _Cn.Close();
                _Adapter.Dispose();
                _Cmd.Dispose();

                if (_Table != null)
                {
                    gvDirectors.DataSource = _Table;
                    gvDirectors.DataBind();
                }

                // Writers
                SQL = "SELECT W.MovieID, W.WriterIMDBID, W.WriterPersonID, P.FullName, P.IMDBURL FROM Writers W INNER JOIN People P ON W.WriterPersonID = P.PersonID WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
                _Cn.Open();
                _Cmd = new SqlCommand(SQL, _Cn);
                _Table = new DataTable();
                _Adapter = new SqlDataAdapter(_Cmd);
                _Adapter.Fill(_Table);
                _Cn.Close();
                _Adapter.Dispose();
                _Cmd.Dispose();

                if (_Table != null)
                {
                    gvWriters.DataSource = _Table;
                    gvWriters.DataBind();
                }

                // Simple TV Episodes
                SQL = "SELECT EpisodeMovieID, EpisodeTitle, Season, Episode, AirDate FROM SimpleTVEpisodes WHERE SeriesMovieID = " + MovieID + " ORDER BY SimpleTVEpisodeID";
                _Cn.Open();
                _Cmd = new SqlCommand(SQL, _Cn);
                _Table = new DataTable();
                _Adapter = new SqlDataAdapter(_Cmd);
                _Adapter.Fill(_Table);
                _Cn.Close();
                _Adapter.Dispose();
                _Cmd.Dispose();

                if (_Table != null)
                {
                    gvSimpleTVEpisodes.DataSource = _Table;
                    gvSimpleTVEpisodes.DataBind();
                }

                // Genres
                SQL = "SELECT GenreName FROM Genres WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
                _Cn.Open();
                _Cmd = new SqlCommand(SQL, _Cn);
                _Table = new DataTable();
                _Adapter = new SqlDataAdapter(_Cmd);
                _Adapter.Fill(_Table);
                _Cn.Close();
                _Adapter.Dispose();
                _Cmd.Dispose();

                if (_Table != null)
                {
                    gvGenres.DataSource = _Table;
                    gvGenres.DataBind();
                }






            }

        }

        protected void gvCast_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                // TODO
                String MovieID = e.CommandArgument.ToString();

                this.Session["MovieID"] = MovieID;
                this.Session["ReferringPage"] = "MovieSearch.aspx";

                Response.Redirect("MovieDetail.aspx");
            }
        }

        protected void gvDirectors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                // TODO

            }
        }

        protected void gvWriters_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                // TODO

            }
        }

        protected void gvSimpleTVEpisodes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                // TODO

            }
        }


        private String ConvertDate(String originaldate)
        {
            String year = originaldate.Substring(0, 4);
            String month = originaldate.Substring(4, 2);
            String day = originaldate.Substring(6, 2);
            DateTime newdate = new DateTime(Int32.Parse(year), Int32.Parse(month), Int32.Parse(day));
            return newdate.ToLongDateString();
        }




    }
}