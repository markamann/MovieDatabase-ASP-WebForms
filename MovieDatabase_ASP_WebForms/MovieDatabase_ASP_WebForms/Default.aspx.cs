using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieDatabase_ASP_WebForms
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Home - Movie Database - ASP.NET WebForms Version";

            lblTotalMovieEntries.Text = Global.BLL_General.CountMovieEntries().ToString();
            lblTotalMovies.Text = Global.BLL_General.CountMovies().ToString();
            lblTotalTVMovies.Text = Global.BLL_General.CountTVMovies().ToString();
            lblTotalTVSeries.Text = Global.BLL_General.CountTVSeries().ToString();
            lblTotalTVEpisodes.Text = Global.BLL_General.CountTVEpisodes().ToString();

            lblTotalPeople.Text = Global.BLL_General.CountPeople().ToString();
        }
    }
}