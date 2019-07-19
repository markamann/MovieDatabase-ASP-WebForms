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
            if (this.Session["PersonID"] != null)
            {
                String PersonID = this.Session["PersonID"].ToString();
                DA.Models.MovieDatabase.Person person = Global.BLL_People.SelectByPersonID_model(Int64.Parse(PersonID));

                // Base
                lblFullName.Text = person.FullName;
                imgPersonPhoto.ImageUrl = person.WebPhotoURL;
                linkPersonPhoto.NavigateUrl = person.WebPhotoURL;
                linkPersonPhoto.Target = "_blank";
                lblFirstName.Text = person.FirstName;
                lblMiddleName.Text = person.MiddleName;
                lblLastName.Text = person.LastName;
                lblSuffix.Text = person.Suffix;
                lblIMDBID.Text = person.IMDBID;
                lblBirthName.Text = person.BirthName;
                lblDateOfBirth.Text = person.DateOfBirth;
                lblDateOfDeath.Text = person.DateOfDeath;
                lblPlaceOfBirth.Text = person.PlaceOfBirth;
                lblActorActress.Text = person.ActorActress;
                lblSex.Text = person.Sex;
                lblHeight.Text = person.Height;
                lblHeightFeet.Text = person.HeightFeet.ToString();
                lblHeightInches.Text = person.HeightInches.ToString();
                linklIMDBURL.Text = person.IMDBURL;
                linklIMDBURL.Target = "_blank";
                linklIMDBURL.NavigateUrl = person.IMDBURL;
                lblBio.Text = person.Bio;
                lblBorn.Text = person.Born;
                lblDied.Text = person.Died;

                // Nicknames
                SQL = "SELECT Name FROM Nicknames WHERE PersonID = " + PersonID + " ORDER BY Ordinal";
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
                    gvNicknames.DataSource = _Table;
                    gvNicknames.DataBind();
                }

                // Trivia
                SQL = "SELECT Trivia FROM PersonTrivia WHERE PersonID = " + PersonID + " ORDER BY Ordinal";
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
                    gvTrivia.DataSource = _Table;
                    gvTrivia.DataBind();
                }

                // Quotes
                SQL = "SELECT Quote FROM PersonQuotes WHERE PersonID = " + PersonID + " ORDER BY Ordinal";
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
                    gvQuotes.DataSource = _Table;
                    gvQuotes.DataBind();
                }

                // Filmography
                SQL = "SELECT PersonID, MovieID, IMDBID, Title, [Year], [Remarks], Ordinal FROM Filmographies WHERE PersonID = " + PersonID + " ORDER BY [Year]";
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
                    gvFilmography.DataSource = _Table;
                    gvFilmography.DataBind();
                }

            }
        }

        protected void gvFilmography_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                String MovieID = e.CommandArgument.ToString();

                this.Session["MovieID"] = MovieID;
                this.Session["ReferringPage"] = "PersonDetail.aspx";

                Response.Redirect("MovieDetail.aspx");
            }
        }

        protected Boolean IsMovieInDatabase(String imdbid)
        {
            SQL = "SELECT MovieID, Title FROM Movies WHERE IMDBID = '" + imdbid + "'";
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

            if (_Table == null)
            {
                return false;
            }
            else
            {
                return (_Table.Rows.Count > 0);
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