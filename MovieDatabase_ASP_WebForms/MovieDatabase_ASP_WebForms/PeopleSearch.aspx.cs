using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieDatabase_ASP_WebForms
{
    public partial class PeopleSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "People Search - Movie Database - ASP.NET WebForms Version";

        }





        protected void lbFullName_Click(object sender, EventArgs e)
        {
        }

        protected void lbActorActress_Click(object sender, EventArgs e)
        {
        }

        protected void lbSex_Click(object sender, EventArgs e)
        {
        }

        protected void lbIMDBID_Click(object sender, EventArgs e)
        {
        }

    }
}


/*
            <asp:LinkButton runat="server" ID="lbIMDBID" Text="IMDB ID" OnClick="lbIMDBID_Click" />

 */

