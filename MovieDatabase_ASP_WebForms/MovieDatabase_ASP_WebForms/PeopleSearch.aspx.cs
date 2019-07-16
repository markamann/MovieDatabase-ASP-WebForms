using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieDatabase_ASP_WebForms
{
    public partial class PeopleSearch : System.Web.UI.Page
    {

        private DataTable _Table = null;
        private String SQL = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "People Search - Movie Database - ASP.NET WebForms Version";

                pnlFullName.Visible = false;
                pnlSex.Visible = false;
                pnlIMDBID.Visible = false;
                pnlResults.Visible = false;

                Populate();
            }

        }

        protected void Populate()
        {
            PopulateDDLFullName();
        }

        protected void PopulateDDLFullName()
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

            ddlFullName.Items.Clear();
            if (_Table != null)
            {
                ddlFullName.DataSource = _Table;
                ddlFullName.DataTextField = "FullName";
                ddlFullName.DataValueField = "PersonID";
                ddlFullName.DataBind();
            }
        }

        protected void lbFullName_Click(object sender, EventArgs e)
        {
            pnlFullName.Visible = true;
            pnlSex.Visible = false;
            pnlIMDBID.Visible = false;

        }

        protected void lbSex_Click(object sender, EventArgs e)
        {
            pnlFullName.Visible = false;
            pnlSex.Visible = true;
            pnlIMDBID.Visible = false;

        }

        protected void lbIMDBID_Click(object sender, EventArgs e)
        {
            pnlFullName.Visible = false;
            pnlSex.Visible = false;
            pnlIMDBID.Visible = true;

        }

        protected void gvResults_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                String PersonID = e.CommandArgument.ToString();

                this.Session["PersonID"] = PersonID;
                this.Session["ReferringPage"] = "PeopleSearch.aspx";

                Response.Redirect("PersonDetail.aspx");
            }
        }

        protected void btnSearchByFullName_Click(object sender, EventArgs e)
        {
            if (ddlFullName.SelectedValue != null)
            {
                SQL = "SELECT PersonID, IMDBID, FullName, Sex FROM People WHERE FullName = '" + ddlFullName.SelectedItem.ToString() + "' ORDER BY FullName";
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

        protected void btnSearchBySex_Click(object sender, EventArgs e)
        {
            if (ddlSex.SelectedItem != null)
            {
                switch (ddlSex.SelectedItem.ToString())
                {
                    case "Female":
                        SQL = "SELECT PersonID, IMDBID, FullName, Sex FROM People WHERE Sex = 'Female' ORDER BY FullName";
                        break;
                    case "Male":
                        SQL = "SELECT PersonID, IMDBID, FullName, Sex FROM People WHERE Sex = 'Male' ORDER BY FullName";
                        break;
                    case "Unspecified":
                        SQL = "SELECT PersonID, IMDBID, FullName, Sex FROM People WHERE Sex = '' ORDER BY FullName";
                        break;
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
                if (!Global.BLL_People.Contains(txtSearchBy_IMDBID.Text.Trim()))
                {
                    lblSearchByIMDBID_Error.Text = "It appears that the IMDB ID you entered does not match any entries in the database.  Please try another IMDB ID.";
                    pnlResults.Visible = false;
                }
                else
                {
                    DA.Models.MovieDatabase.Person person = Global.BLL_People.SelectByIMDBID_model(txtSearchBy_IMDBID.Text.Trim());
                    SQL = "SELECT PersonID, IMDBID, FullName, Sex FROM People WHERE PersonID = " + person.PersonID.ToString() + " ORDER BY FullName";
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
