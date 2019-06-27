﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetail.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.MovieDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="divMainContainer" style="width: 100%; text-align: center;">
        <h2>Movie Search</h2>
        <div id="divBaseBlock" style="float:left; width: 1400px; text-align: center; vertical-align: top;">
            <div id="divMoviePoster" style="float:left; width: 200px; height: 200px; text-align: center; vertical-align: middle;">
                <img src="http://www.mjafileserver.com/MovieDatabase/Photos/MoviePosters/American_Pie_(1999)_1.jpg" height="200" alt="American Pie - Poster" />
            </div>
            <div id="divBaseDataBlock" style="float:left; width: 1200px; height: 30px; text-align: left; vertical-align: top;">
                <div id="divTitle" style="float:left; width: 1200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblTitle_Label" Font-Bold="true" Text="Title:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblTitle" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divOriginalTitle" style="float:left; width: 1200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblOriginalTitle_Label" Font-Bold="true" Text="Original Title:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblOriginalTitle" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIMDBID" style="float:left; width: 250px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblIMDBID_Label" Font-Bold="true" Text="IMDBID:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblIMDBID" Font-Bold="false" />
                </div>
                <div id="divIType" style="float:left; width: 250px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblType_Label" Font-Bold="true" Text="Type:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblType" Font-Bold="false" />
                </div>
                <div id="divIMPAARating" style="float:left; width: 250px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblMPAARating_Label" Font-Bold="true" Text="MPAA Rating:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblMPAARating" Font-Bold="false" />
                </div>
                <div id="divIReleaseDate" style="float:left; width: 250px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblReleaseDate_Label" Font-Bold="true" Text="Release Date:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblReleaseDate" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIYear" style="float:left; width: 300px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblYearl_Label" Font-Bold="true" Text="Year:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblYear" Font-Bold="false" />
                </div>
                <div id="divIRuntime" style="float:left; width: 300px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblRuntime_Label" Font-Bold="true" Text="Runtime:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblRuntime" Font-Bold="false" />
                </div>
                <div id="divIRating" style="float:left; width: 200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblRating_Label" Font-Bold="true" Text="Rating:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblRating" Font-Bold="false" />
                </div>
                <div id="divIMetascore" style="float:left; width: 200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblMetascore_Label" Font-Bold="true" Text="Metascore:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblMetascore" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIVotes" style="float:left; width: 200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblVotes_Label" Font-Bold="true" Text="Votes:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblVotes" Font-Bold="false" />
                </div>
                <div id="divISeriesIMDBID" style="float:left; width: 400px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblSeriesIMDBID_Label" Font-Bold="true" Text="Series IMDBID:" />
                    &nbsp;
                    <asp:LinkButton runat="server" ID="lbSeriesIMDBID" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divISeriesName" style="float:left; width: 1200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblSeriesName_Label" Font-Bold="true" Text="Series Name:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblSeriesName" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIIMDBURL" style="float:left; width: 1200px; height: 30px; text-align: left; vertical-align: middle;">
                    <asp:Label runat="server" ID="lblIIMDBURL_Label" Font-Bold="true" Text="IIMDB URL:" />
                    &nbsp;
                    <asp:HyperLink runat="server" ID="linklIMDBURL" />
                </div>
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divSimplePlot" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblSimplePlot_Label" Font-Bold="true" Text="Simple Plot:" />
            <br />
            <asp:Label runat="server" ID="lblSimplePlot" style="width: 1400px;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divPlot" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblPlot_Label" Font-Bold="true" Text="Plot:" />
            <br />
            <asp:Label runat="server" ID="lblPlot" style="width: 1400px;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divCast" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblCast" Font-Bold="true" Text="Cast:" />
            <br />
             <asp:GridView ID="gvCast" runat="server" AutoGenerateColumns="false" OnRowCommand="gvCast_RowCommand" Width="100%">
                 <Columns>
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("PersonID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="ActorIMDBID" HeaderText="IMDB ID" ControlStyle-Width="200px" />
                     <asp:BoundField DataField="ActorName" HeaderText="Actor Name" ControlStyle-Width="400px" />
                     <asp:BoundField DataField="CharacterName" HeaderText="Character Name" ControlStyle-Width="400px" />
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:HyperLink ID = "linkCast_IMDBURL" runat="server" Text="IMDB Page" NavigateUrl='<% #Eval("IMDBCharacterURL") %>' Target="_blank" />
                        </ItemTemplate>
                    </asp:TemplateField>
                 </Columns>
             </asp:GridView>
            <br />
            <asp:Hyperlink runat="server" ID="linkSeeFullCast" Text="See Full Cast" NavigateUrl="FullCast.aspx" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divDirectors" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblDirectors_Label" Font-Bold="true" Text="Directors:" />
            <br />
             <asp:GridView ID="gvDirectors" runat="server" AutoGenerateColumns="false" OnRowCommand="gvDirectors_RowCommand" Width="100%">
                 <Columns>
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("DirectorPersonID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="DirectorIMDBID" HeaderText="IMDB ID" ControlStyle-Width="200px" />
                     <asp:BoundField DataField="FullName" HeaderText="Name" ControlStyle-Width="600px" />
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:HyperLink ID = "linkDirectors_IMDBURL" runat="server" Text="IMDB Page" NavigateUrl='<% #Eval("IMDBURL") %>' Target="_blank" />
                        </ItemTemplate>
                    </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divWriters" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblWriters_Label" Font-Bold="true" Text="Writers:" />
            <br />
             <asp:GridView ID="gvWriters" runat="server" AutoGenerateColumns="false" OnRowCommand="gvWriters_RowCommand" Width="100%">
                 <Columns>
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("WriterPersonID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="WriterIMDBID" HeaderText="IMDB ID" ControlStyle-Width="200px" />
                     <asp:BoundField DataField="FullName" HeaderText="Name" ControlStyle-Width="600px" />
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:HyperLink ID = "linkWriters_IMDBURL" runat="server" Text="IMDB Page" NavigateUrl='<% #Eval("IMDBURL") %>' Target="_blank" />
                        </ItemTemplate>
                    </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divSimpleTVEpisodes" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblSimpleTVEpisodes_Label" Font-Bold="true" Text="Simple TV Episodes:" />
            <br />
             <asp:GridView ID="gvSimpleTVEpisodes" runat="server" AutoGenerateColumns="false" OnRowCommand="gvSimpleTVEpisodes_RowCommand" Width="100%">
                 <Columns>
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("EpisodeMovieID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="EpisodeTitle" HeaderText="Episode Title" ControlStyle-Width="700px" />
                     <asp:BoundField DataField="Season" HeaderText="Season" ControlStyle-Width="100px" />
                     <asp:BoundField DataField="Episode" HeaderText="Episode" ControlStyle-Width="100px" />
                     <asp:BoundField DataField="AirDate" HeaderText="Air Date" ControlStyle-Width="300px" />
                 </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divGenres" style="float:left; width: 1400px; text-align: left; vertical-align: top;">
            <asp:Label runat="server" ID="lblGenres_Label" Font-Bold="true" Text="Genres:" />
            <br />
             <asp:GridView ID="gvGenres" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="GenreName" HeaderText="Genre" ControlStyle-Width="1400px" />
                </Columns>
             </asp:GridView>
        </div>









    </div>


<!--
        [Display(Name = "Genres")]
        public List<Genre> Genres { get; set; }

        [Display(Name = "Movie Trivia")]
        public List<MovieTrivia> Trivia { get; set; }

        [Display(Name = "Goofs")]
        public List<Goof> Goofs { get; set; }

        [Display(Name = "Countries")]
        public List<Country> Countries { get; set; }

        [Display(Name = "Filming Locations")]
        public List<FilmingLocation> FilmingLocations { get; set; }

        [Display(Name = "Languages")]
        public List<Language> Languages { get; set; }

        [Display(Name = "AKA")]
        public List<AKA> AKA { get; set; }

        [Display(Name = "Business Data")]
        public Business BusinessData { get; set; }

        [Display(Name = "Technical Data")]
        public Technical TechnicalData { get; set; }

        [Display(Name = "Similar Movies")]
        public List<SimilarMovie> SimilarMovies { get; set; }

        [Display(Name = "Movie Quotes")]
        public List<MovieQuote> MovieQuotes { get; set; }

        [Display(Name = "Keywords")]
        public List<Keyword> Keywords { get; set; }
-->

</asp:Content>