using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieDatabase_ASP_WebForms
{
    public partial class MovieDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["MovieID"] != null)
            {
                String MovieID = this.Session["MovieID"].ToString();
                lblTitle.Text = "American Pie";
                lblOriginalTitle.Text = "";
                lblIMDBID.Text = "tt0163651";
                lblType.Text = "Movie";
                lblMPAARating.Text = "R";
                lblReleaseDate.Text = "July 9, 1999"; //19990709
                lblYear.Text = "1999";
                lblRuntime.Text = "95 min";
                lblRating.Text = "58";
                lblMetascore.Text = "7.0";
                lblVotes.Text = "-1";
                lbSeriesIMDBID.Text = "N/A";
                lblSeriesName.Text = "";
                linklIMDBURL.Text = "http://www.imdb.com/title/tt0163651";
                linklIMDBURL.Target = "_blank";
                linklIMDBURL.NavigateUrl = "http://www.imdb.com/title/tt0163651";
                lblSimplePlot.Text = "Four teenage boys enter a pact to lose their virginity by prom night.";
                lblPlot.Text = "Jim, Oz, Finch and Kevin are four friends who make a pact that before they graduate they will all lose their virginity. The hard job now is how to reach that goal by prom night. Whilst Oz begins singing to grab attention and Kevin tries to persuade his girlfriend, Finch tries any easy route of spreading rumors and Jim fails miserably. Whether it is being caught on top of a pie or on the Internet, Jim always ends up with his trusty sex advice from his father. Will they achieve their goal of getting laid by prom night? Or will they learn something much different?";



            }


        }
    }
}