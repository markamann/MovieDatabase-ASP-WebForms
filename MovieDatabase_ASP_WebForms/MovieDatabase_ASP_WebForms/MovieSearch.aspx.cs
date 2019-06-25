using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MovieDatabase_ASP_WebForms
{
    public partial class MovieSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Movie Search - Movie Database - ASP.NET WebForms Version";

                pnlType.Visible = false;
                pnlTitle.Visible = false;
                pnlGenre.Visible = false;
                pnlKeyword.Visible = false;
                pnlIMDBID.Visible = false;
                pnlResults.Visible = false;

                Populate();
                chkTitle_IncludeTVEpisodes.CheckedChanged += chkTitle_IncludeTVEpisodes_CheckedChanged;
            }

           
        }

        protected void Populate()
        {
            PopulateDDLTitle();
            PopulateDDLGenre();
            PopulateDDLKeyword();
        }

        protected void PopulateDDLTitle()
        {
            String SQL = String.Empty;

            if (chkTitle_IncludeTVEpisodes.Checked)
            {
                SQL = "SELECT MovieID, Title FROM Movies ORDER BY Title";
            }
            else
            {
                SQL = "SELECT MovieID, Title FROM Movies WHERE [Type] <> 'TV Episode' ORDER BY Title";
            }

            SqlConnection _Cn = new SqlConnection(Connections.ConnectionStrings.MovieDatabaseConnectionString_Private);
            SqlCommand _Cmd = new SqlCommand(SQL, _Cn);
            DataTable _Table = new DataTable();
            SqlDataAdapter _Adapter = new SqlDataAdapter(_Cmd);
            _Adapter.Fill(_Table);
            _Adapter.Dispose();
            _Cmd.Dispose();

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
            pnlIMDBID.Visible = false;
        }

        protected void lbTitle_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = true;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = false;
            pnlIMDBID.Visible = false;
        }

        protected void lbGenre_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = true;
            pnlKeyword.Visible = false;
            pnlIMDBID.Visible = false;
        }

        protected void lbKeyword_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = true;
            pnlIMDBID.Visible = false;
        }

        protected void lbIMDBID_Click(object sender, EventArgs e)
        {
            pnlType.Visible = false;
            pnlTitle.Visible = false;
            pnlGenre.Visible = false;
            pnlKeyword.Visible = false;
            pnlIMDBID.Visible = true;
        }

        protected void btnSearchByType_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearchByTitle_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearchByGenre_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearchByKeyword_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearchByIMDBID_Click(object sender, EventArgs e)
        {

        }



    }
}