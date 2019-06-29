using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MovieDatabase_ASP_WebForms
{
    public partial class FullCast : System.Web.UI.Page
    {

        private String SQL = String.Empty;
        private DataTable _Table = null;
        private DataTable _Quotes = null;
        private DataTable _Lines = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["MovieID"] != null)
            {
                String MovieID = this.Session["MovieID"].ToString();
                DA.Models.MovieDatabase.Movie movie = Global.BLL_Movies.SelectByMovieID_model(Int64.Parse(MovieID));

                // Base
                imgMoviePoster.AlternateText = movie.Title + " - Poster";
                imgMoviePoster.ImageUrl = movie.WebPosterURL;
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

                // Cast
                SQL = "SELECT PersonID, ActorIMDBID, ActorName, CharacterName, IMDBCharacterURL FROM CastMembers WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvCast.DataSource = _Table;
                    gvCast.DataBind();
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