using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        }

        protected void PopulateDDLGenre()
        {

        }

        protected void PopulateDDLKeyword()
        {

        }

        protected void chkTitle_IncludeTVEpisodes_CheckedChanged(object sender, EventArgs e)
        {

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