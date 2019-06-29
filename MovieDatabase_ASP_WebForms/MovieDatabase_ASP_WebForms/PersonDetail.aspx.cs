using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MovieDatabase_ASP_WebForms
{
    public partial class PersonDetail : System.Web.UI.Page
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
                lblSimplePlot.Text = movie.SimplePlot;
                lblPlot.Text = movie.Plot;

                // Cast
                SQL = "SELECT TOP 20 PersonID, ActorIMDBID, ActorName, CharacterName, IMDBCharacterURL FROM CastMembers WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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

                // Directors
                SQL = "SELECT D.MovieID, D.DirectorIMDBID, D.DirectorPersonID, P.FullName, P.IMDBURL FROM Directors D INNER JOIN People P ON D.DirectorPersonID = P.PersonID WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvDirectors.DataSource = _Table;
                    gvDirectors.DataBind();
                }

                // Writers
                SQL = "SELECT W.MovieID, W.WriterIMDBID, W.WriterPersonID, P.FullName, P.IMDBURL FROM Writers W INNER JOIN People P ON W.WriterPersonID = P.PersonID WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvWriters.DataSource = _Table;
                    gvWriters.DataBind();
                }

                // Simple TV Episodes
                SQL = "SELECT EpisodeMovieID, EpisodeTitle, Season, Episode, AirDate FROM SimpleTVEpisodes WHERE SeriesMovieID = " + MovieID + " ORDER BY SimpleTVEpisodeID";
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
                    gvSimpleTVEpisodes.DataSource = _Table;
                    gvSimpleTVEpisodes.DataBind();
                }

                // Genres
                SQL = "SELECT GenreName FROM Genres WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvGenres.DataSource = _Table;
                    gvGenres.DataBind();
                }

                // Movie Trivia
                SQL = "SELECT Trivia FROM MovieTrivia WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvMovieTrivia.DataSource = _Table;
                    gvMovieTrivia.DataBind();
                }

                // Goofs
                SQL = "SELECT [Type], GoofText FROM Goofs WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvGoofs.DataSource = _Table;
                    gvGoofs.DataBind();
                }

                // MovieQuotes
                TableRow tr;
                TableCell tc;
                Label lbl;

                SQL = "SELECT QuoteID FROM MovieQuotes WHERE MovieID = " + MovieID + " ORDER BY QuoteOrdinal";
                using (SqlConnection con = new SqlConnection(Connections.ConnectionStrings.MovieDatabaseConnectionString_Private))
                {
                    using (SqlCommand cmd = new SqlCommand(SQL, con))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            _Quotes = new DataTable();
                            adapter.Fill(_Quotes);
                        }
                    }
                }

                if (_Quotes != null)
                {
                    if (_Quotes.Rows.Count > 0)
                    {
                        for (int x = 0; x < _Quotes.Rows.Count; ++x)
                        {
                            // Introductory row denoting new quote
                            tr = new TableRow();

                            // Label column
                            tc = new TableCell();
                            tc.Width = new Unit("15%");
                            lbl = new Label();
                            lbl.Font.Bold = true;
                            lbl.Text = "Quote:";
                            tc.Controls.Add(lbl);
                            tr.Cells.Add(tc);

                            // Character Name column
                            tc = new TableCell();
                            tc.Width = new Unit("20%");
                            lbl = new Label();
                            lbl.Font.Bold = false;
                            lbl.Text = "";
                            tc.Controls.Add(lbl);
                            tr.Cells.Add(tc);

                            // Line Text column
                            tc = new TableCell();
                            tc.Width = new Unit("65%");
                            lbl = new Label();
                            lbl.Font.Bold = false;
                            lbl.Text = "";
                            tc.Controls.Add(lbl);
                            tr.Cells.Add(tc);

                            tblMovieQuotes.Rows.Add(tr);

                            SQL = "SELECT CharacterName, LineText FROM Lines WHERE MovieID = " + MovieID + " AND QuoteID = " + _Quotes.Rows[x]["QuoteID"].ToString() + " ORDER BY LineOrdinal";
                            using (SqlConnection con = new SqlConnection(Connections.ConnectionStrings.MovieDatabaseConnectionString_Private))
                            {
                                using (SqlCommand cmd = new SqlCommand(SQL, con))
                                {
                                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                                    {
                                        _Lines = new DataTable();
                                        adapter.Fill(_Lines);
                                    }
                                }
                            }

                            if (_Lines != null)
                            {
                                if (_Lines.Rows.Count > 0)
                                {
                                    for (int y = 0; y < _Lines.Rows.Count; ++y)
                                    {
                                        tr = new TableRow();

                                        // Label column
                                        tc = new TableCell();
                                        tc.Width = new Unit("15%");
                                        lbl = new Label();
                                        lbl.Font.Bold = true;
                                        lbl.Text = "";
                                        tc.Controls.Add(lbl);
                                        tr.Cells.Add(tc);

                                        // Character Name column
                                        tc = new TableCell();
                                        tc.Width = new Unit("20%");
                                        lbl = new Label();
                                        lbl.Font.Bold = false;
                                        lbl.Text = _Lines.Rows[y]["CharacterName"].ToString();
                                        tc.Controls.Add(lbl);
                                        tr.Cells.Add(tc);

                                        // Line Text column
                                        tc = new TableCell();
                                        tc.Width = new Unit("65%");
                                        lbl = new Label();
                                        lbl.Font.Bold = false;
                                        lbl.Text = _Lines.Rows[y]["LineText"].ToString();
                                        tc.Controls.Add(lbl);
                                        tr.Cells.Add(tc);

                                        tblMovieQuotes.Rows.Add(tr);
                                    }
                                }
                            }
                        }
                    }
                }

                // Countries
                SQL = "SELECT CountryName FROM Countries WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvCountries.DataSource = _Table;
                    gvCountries.DataBind();
                }

                // FilmingLocations
                SQL = "SELECT Location, Remarks FROM FilmingLocations WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvFilmingLocations.DataSource = _Table;
                    gvFilmingLocations.DataBind();
                }

                // Languages
                SQL = "SELECT LanguageName FROM Languages WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvLanguages.DataSource = _Table;
                    gvLanguages.DataBind();
                }

                // AKAs
                SQL = "SELECT Country, Title, Comment FROM AKAs WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvAKAs.DataSource = _Table;
                    gvAKAs.DataBind();
                }

                // SimilarMovies
                SQL = "SELECT IMDBID, MovieName FROM SimilarMovies WHERE MovieID = " + MovieID + " ORDER BY Ordinal";
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
                    gvSimilarMovies.DataSource = _Table;
                    gvSimilarMovies.DataBind();
                }

                // Business Data
                if (movie.BusinessData != null)
                {
                    if (movie.BusinessData.Budget != null)
                    {
                        lblBudget.Text = movie.BusinessData.Budget;
                    }
                    else
                    {
                        lblBudget.Text = "";
                    }

                    if (movie.BusinessData.OpeningWeekend != null)
                    {
                        lblOpeningWeekend.Text = movie.BusinessData.OpeningWeekend;
                    }
                    else
                    {
                        lblOpeningWeekend.Text = "";
                    }

                    if (movie.BusinessData.GrossUSA != null)
                    {
                        lblGrossUSA.Text = movie.BusinessData.GrossUSA;
                    }
                    else
                    {
                        lblGrossUSA.Text = "";
                    }

                    if (movie.BusinessData.Worldwide != null)
                    {
                        lblWorldwide.Text = movie.BusinessData.Worldwide;
                    }
                    else
                    {
                        lblWorldwide.Text = "";
                    }
                }
                else
                {
                    lblBudget.Text = "";
                    lblOpeningWeekend.Text = "";
                    lblGrossUSA.Text = "";
                    lblWorldwide.Text = "";
                }


                // Technical Data
                if (movie.TechnicalData != null)
                {
                    if (movie.TechnicalData.Runtime != null)
                    {
                        lblTechnicalData_Runtime.Text = movie.TechnicalData.Runtime;
                    }
                    else
                    {
                        lblTechnicalData_Runtime.Text = "";
                    }

                    if (movie.TechnicalData.SoundMix != null)
                    {
                        lblSoundMix.Text = movie.TechnicalData.SoundMix;
                    }
                    else
                    {
                        lblSoundMix.Text = "";
                    }

                    if (movie.TechnicalData.Color != null)
                    {
                        lblColor.Text = movie.TechnicalData.Color;
                    }
                    else
                    {
                        lblColor.Text = "";
                    }

                    if (movie.TechnicalData.AspectRatio != null)
                    {
                        lblAspectRatio.Text = movie.TechnicalData.AspectRatio;
                    }
                    else
                    {
                        lblAspectRatio.Text = "";
                    }

                    if (movie.TechnicalData.Camera != null)
                    {
                        lblCamera.Text = movie.TechnicalData.Camera;
                    }
                    else
                    {
                        lblCamera.Text = "";
                    }

                    if (movie.TechnicalData.Laboratory != null)
                    {
                        lblLaboratory.Text = movie.TechnicalData.Laboratory;
                    }
                    else
                    {
                        lblLaboratory.Text = "";
                    }

                    if (movie.TechnicalData.FilmLength != null)
                    {
                        lblFilmLength.Text = movie.TechnicalData.FilmLength;
                    }
                    else
                    {
                        lblFilmLength.Text = "";
                    }

                    if (movie.TechnicalData.NegativeFormat != null)
                    {
                        lblNegativeFormat.Text = movie.TechnicalData.NegativeFormat;
                    }
                    else
                    {
                        lblNegativeFormat.Text = "";
                    }

                    if (movie.TechnicalData.CinematographicProcess != null)
                    {
                        lblCinematographicProcess.Text = movie.TechnicalData.CinematographicProcess;
                    }
                    else
                    {
                        lblCinematographicProcess.Text = "";
                    }

                    if (movie.TechnicalData.PrintedFilmFormat != null)
                    {
                        lblPrintedFilmFormat.Text = movie.TechnicalData.PrintedFilmFormat;
                    }
                    else
                    {
                        lblPrintedFilmFormat.Text = "";
                    }
                }
                else
                {
                    lblTechnicalData_Runtime.Text = "";
                    lblSoundMix.Text = "";
                    lblColor.Text = "";
                    lblAspectRatio.Text = "";
                    lblCamera.Text = "";
                    lblLaboratory.Text = "";
                    lblFilmLength.Text = "";
                    lblNegativeFormat.Text = "";
                    lblCinematographicProcess.Text = "";
                    lblPrintedFilmFormat.Text = "";
                }

                // Keywords
                SQL = "SELECT KL.Keyword FROM Keywords K INNER JOIN KeywordList KL ON K.KeywordID = KL.KeywordID WHERE MovieID = " + MovieID + " ORDER BY KL.Keyword";
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

                String keywords = String.Empty;
                if (_Table != null)
                {
                    if (_Table.Rows.Count > 0)
                    {
                        for (int x = 0; x < _Table.Rows.Count; ++x)
                        {
                            keywords = keywords + _Table.Rows[x]["Keyword"].ToString() + ", ";
                        }

                        if (keywords.EndsWith(", "))
                        {
                            keywords = keywords.Substring(0, keywords.Length - 2);
                        }
                    }
                }
                lblKeywords.Text = keywords;

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