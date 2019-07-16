using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace MovieDatabase_ASP_WebForms
{
    public partial class MovieSearch : System.Web.UI.Page
    {

        private DataTable _Table = null;
        private String SQL = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Movie Search - Movie Database - ASP.NET WebForms Version";

                pnlType.Visible = false;
                pnlTitle.Visible = false;
                pnlGenre.Visible = false;
                pnlKeyword.Visible = false;
                pnlPerson.Visible = false;
                pnlIMDBID.Visible = false;
                pnlResults.Visible = false;
                lblSearchByIMDBID_Error.Text = "";

                Populate();
                chkTitle_IncludeTVEpisodes.CheckedChanged += chkTitle_IncludeTVEpisodes_CheckedChanged;
            }

           
        }

        protected void Populate()
        {
            PopulateDDLTitle();
            PopulateDDLGenre();
            PopulateDDLKeyword();
            PopulateDDLPeople();
        }

        protected void PopulateDDLTitle()
        {
            if (chkTitle_IncludeTVEpisodes.Checked)
            {
                SQL = "SELECT MovieID, Title FROM Movies ORDER BY Title";
            }
            else
            {
                SQL = "SELECT MovieID, Title FROM Movies WHERE [Type] <> 'TV Episode' ORDER BY Title";
            }

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

            ddlTitle.Items.Clear();
            ListItem li;

            for (int x = 0; x < _Table.Rows.Count; ++x)
            {
                li = new ListItem(_Table.Rows[x]["Title"].ToString(), _Table.Rows[x]["MovieID"].ToString());
                ddlTitle.Items.Add(li);
            }
        }

        protected void PopulateDDLGenre()
        {
            List<String> genres = Global.BLL_Genres.SelectDistinctGenres_list();
            ddlGenre.Items.Clear();
            ListItem li;

            foreach (String g in genres)
            {
                li = new ListItem(g, g);
                ddlGenre.Items.Add(li);
            }
        }

        protected void PopulateDDLKeyword()
        {
            List<DA.Models.MovieDatabase.KeywordList> kl = Global.BLL_KeywordList.SelectAll_list();
            ddlKeyword.Items.Clear();
            ListItem li;

            foreach (DA.Models.MovieDatabase.KeywordList k in kl)
            {
                li = new ListItem(k.Keyword, k.KeywordID.ToString());
                ddlKeyword.Items.Add(li);
            }
        }

        protected void PopulateDDLPeople()
        {
            SQL = "SELECT PersonID, FullName FROM People ORDER BY FullName";
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

            ddlPeople.Items.Clear();
            if (_Table != null)
            {
                ddlPeople.Items.Clear();
                ddlPeople.DataSource = _Table;
                ddlPeople.DataTextField = "FullName";
                ddlPeople.DataValueField = "PersonID";
                ddlPeople.DataBind();
            }

        }

        protected void chkTitle_IncludeTVEpisodes_CheckedChanged(object sender, EventArgs e)
        {
            PopulateDDLTitle();
        }

        protected void lbType_Click(object sender, EventArgs e)
        {
            pnlType.Visible = true;
            pnlTitle.Visible = false;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = false;
            pnlPerson.Visible = false;
            pnlIMDBID.Visible = false;
        }

        protected void lbTitle_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = true;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = false;
            pnlPerson.Visible = false;
            pnlIMDBID.Visible = false;
        }

        protected void lbGenre_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = true;
            pnlKeyword.Visible = false;
            pnlPerson.Visible = false;
            pnlIMDBID.Visible = false;
        }

        protected void lbKeyword_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = true;
            pnlPerson.Visible = false;
            pnlIMDBID.Visible = false;
        }

        protected void lbPerson_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = false;
            pnlPerson.Visible = true;
            pnlIMDBID.Visible = false;
        }

        protected void lbIMDBID_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = false;
            pnlPerson.Visible = false;
            pnlIMDBID.Visible = true;
        }

        protected void gvResults_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                String MovieID = e.CommandArgument.ToString();

                this.Session["MovieID"] = MovieID;
                this.Session["ReferringPage"] = "MovieSearch.aspx";

                Response.Redirect("MovieDetail.aspx");
            }
        }

        protected void btnSearchByType_Click(object sender, EventArgs e)
        {
            if (ddlType.SelectedItem != null)
            {
                SQL = "SELECT MovieID, Title, [Type], [Year] FROM Movies WHERE [Type] = '" + ddlType.SelectedItem.ToString() + "' ORDER BY Title";
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
                        lblRecordsReturned.Text = _Table.Rows.Count.ToString() + " record(s) returned";
                        gvResults.DataSource = _Table;
                        gvResults.DataBind();
                        pnlResults.Visible = true;
                    }
                    else
                    {
                        lblRecordsReturned.Text = "No records returned";
                    }
                }
                else
                {
                    lblRecordsReturned.Text = "No records returned";
                }
            }
        }

        protected void btnSearchByTitle_Click(object sender, EventArgs e)
        {
            if (ddlTitle.SelectedItem != null)
            {
                SQL = "SELECT MovieID, Title, [Type], [Year] FROM Movies WHERE Title = '" + ddlTitle.SelectedItem.ToString() + "' ORDER BY [Year]";
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
                        lblRecordsReturned.Text = _Table.Rows.Count.ToString() + " record(s) returned";
                        gvResults.DataSource = _Table;
                        gvResults.DataBind();
                        pnlResults.Visible = true;
                    }
                    else
                    {
                        lblRecordsReturned.Text = "No records returned";
                    }
                }
                else
                {
                    lblRecordsReturned.Text = "No records returned";
                }
            }
        }

        protected void btnSearchByGenre_Click(object sender, EventArgs e)
        {
            if (ddlGenre.SelectedItem != null)
            {
                SQL = "SELECT MovieID, Title, [Type], [Year] FROM Movies WHERE MovieID IN (SELECT DISTINCT MovieID FROM Genres WHERE GenreName = '" + ddlGenre.SelectedItem.ToString() + "') ORDER BY [Title]";
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
                        lblRecordsReturned.Text = _Table.Rows.Count.ToString() + " record(s) returned";
                        gvResults.DataSource = _Table;
                        gvResults.DataBind();
                        pnlResults.Visible = true;
                    }
                    else
                    {
                        lblRecordsReturned.Text = "No records returned";
                    }
                }
                else
                {
                    lblRecordsReturned.Text = "No records returned";
                }
            }
        }

        protected void btnSearchByKeyword_Click(object sender, EventArgs e)
        {
            if (ddlKeyword.SelectedItem != null)
            {
                SQL = "SELECT MovieID, Title, [Type], [Year] FROM Movies WHERE MovieID IN (SELECT MovieID FROM Keywords K INNER JOIN KeywordList KL ON K.KeywordID = KL.KeywordID WHERE KL.Keyword = '" + ddlKeyword.SelectedItem.ToString() + "') ORDER BY [Title]";
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
                        lblRecordsReturned.Text = _Table.Rows.Count.ToString() + " record(s) returned";
                        gvResults.DataSource = _Table;
                        gvResults.DataBind();
                        pnlResults.Visible = true;
                    }
                    else
                    {
                        lblRecordsReturned.Text = "No records returned";
                    }
                }
                else
                {
                    lblRecordsReturned.Text = "No records returned";
                }
            }
        }

        protected void btnSearchByPerson_Click(object sender, EventArgs e)
        {
            if (ddlPeople.SelectedValue != null)
            {
                SQL = "SELECT M.MovieID, M.Title, M.[Type], M.[Year] FROM Movies M WHERE MovieID IN (SELECT DISTINCT MovieID FROM CastMembers WHERE PersonID = " + ddlPeople.SelectedValue.ToString() + ") ORDER BY[Title]";
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
                        lblRecordsReturned.Text = _Table.Rows.Count.ToString() + " record(s) returned";
                        gvResults.DataSource = _Table;
                        gvResults.DataBind();
                        pnlResults.Visible = true;
                    }
                    else
                    {
                        lblRecordsReturned.Text = "No records returned";
                    }
                }
                else
                {
                    lblRecordsReturned.Text = "No records returned";
                }
            }
        }

        protected void btnSearchByIMDBID_Click(object sender, EventArgs e)
        {
            lblSearchByIMDBID_Error.Text = "";
            if (txtSearchBy_IMDBID.Text.Equals(""))
            {
                lblSearchByIMDBID_Error.Text = "Please enter a valid IMDB ID.";
                pnlResults.Visible = false;
            }
            else
            {
                if (!Global.BLL_Movies.Contains(txtSearchBy_IMDBID.Text.Trim()))
                {
                    lblSearchByIMDBID_Error.Text = "It appears that the IMDB ID you entered does not match any entries in the database.  Please try another IMDB ID.";
                    pnlResults.Visible = false;
                }
                else
                {
                    DA.Models.MovieDatabase.Movie movie = Global.BLL_Movies.SelectByIMDBID_model(txtSearchBy_IMDBID.Text.Trim());
                    SQL = "SELECT MovieID, Title, [Type], [Year] FROM Movies WHERE MovieID = " + movie.MovieID.ToString();
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
                            lblRecordsReturned.Text = _Table.Rows.Count.ToString() + " record(s) returned";
                            gvResults.DataSource = _Table;
                            gvResults.DataBind();
                            pnlResults.Visible = true;
                        }
                        else
                        {
                            lblRecordsReturned.Text = "No records returned";
                        }
                    }
                    else
                    {
                        lblRecordsReturned.Text = "No records returned";
                    }
                }
            }
        }

    }
}