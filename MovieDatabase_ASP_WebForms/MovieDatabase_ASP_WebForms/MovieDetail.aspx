<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetail.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.MovieDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="divMainContainer" class="MainContainer">
        <h2>Movie Detail</h2>
        <div id="divBaseBlock" class="BaseBlock">
            <div id="divMoviePoster" class="Photo">
                <asp:Image runat="server" ID="imgMoviePoster" Height="200px" />
            </div>
            <div id="divBaseDataBlock" class="BaseDataBlock">
                <div id="divTitle" class="ContentLine" style="width: 1200px;">
                    <asp:Label runat="server" ID="lblTitle_Label" Font-Bold="true" Text="Title:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblTitle" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divOriginalTitle" class="ContentLine" style="width: 1200px;">
                    <asp:Label runat="server" ID="lblOriginalTitle_Label" Font-Bold="true" Text="Original Title:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblOriginalTitle" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIMDBID" class="ContentLine" style="width: 250px;">
                    <asp:Label runat="server" ID="lblIMDBID_Label" Font-Bold="true" Text="IMDBID:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblIMDBID" Font-Bold="false" />
                </div>
                <div id="divIType" class="ContentLine" style="width: 250px;">
                    <asp:Label runat="server" ID="lblType_Label" Font-Bold="true" Text="Type:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblType" Font-Bold="false" />
                </div>
                <div id="divIMPAARating" class="ContentLine" style="width: 250px;">
                    <asp:Label runat="server" ID="lblMPAARating_Label" Font-Bold="true" Text="MPAA Rating:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblMPAARating" Font-Bold="false" />
                </div>
                <div id="divIReleaseDate" class="ContentLine" style="width: 250px;">
                    <asp:Label runat="server" ID="lblReleaseDate_Label" Font-Bold="true" Text="Release Date:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblReleaseDate" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIYear" class="ContentLine" style="width: 300px;">
                    <asp:Label runat="server" ID="lblYearl_Label" Font-Bold="true" Text="Year:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblYear" Font-Bold="false" />
                </div>
                <div id="divIRuntime" class="ContentLine" style="width: 300px;">
                    <asp:Label runat="server" ID="lblRuntime_Label" Font-Bold="true" Text="Runtime:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblRuntime" Font-Bold="false" />
                </div>
                <div id="divIRating" class="ContentLine" style="width: 200px;">
                    <asp:Label runat="server" ID="lblRating_Label" Font-Bold="true" Text="Rating:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblRating" Font-Bold="false" />
                </div>
                <div id="divIMetascore" class="ContentLine" style="width: 200px;">
                    <asp:Label runat="server" ID="lblMetascore_Label" Font-Bold="true" Text="Metascore:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblMetascore" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIVotes" class="ContentLine" style="width: 200px;">
                    <asp:Label runat="server" ID="lblVotes_Label" Font-Bold="true" Text="Votes:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblVotes" Font-Bold="false" />
                </div>
                <div id="divISeriesIMDBID" class="ContentLine" style="width: 400px;">
                    <asp:Label runat="server" ID="lblSeriesIMDBID_Label" Font-Bold="true" Text="Series IMDBID:" />
                    &nbsp;
                    <asp:LinkButton runat="server" ID="lbSeriesIMDBID" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divISeriesName" class="ContentLine" style="width: 1200px;">
                    <asp:Label runat="server" ID="lblSeriesName_Label" Font-Bold="true" Text="Series Name:" />
                    &nbsp;
                    <asp:Label runat="server" ID="lblSeriesName" Font-Bold="false" />
                </div>
                <div style="clear: both;"></div>
                <div id="divIIMDBURL" class="ContentLine" style="width: 1200px;">
                    <asp:Label runat="server" ID="lblIIMDBURL_Label" Font-Bold="true" Text="IIMDB URL:" />
                    &nbsp;
                    <asp:HyperLink runat="server" ID="linklIMDBURL" />
                </div>
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divSimplePlot" class="FullContentBlock">
            <asp:Label runat="server" ID="lblSimplePlot_Label" Font-Bold="true" Text="Simple Plot:" />
            <br />
            <asp:Label runat="server" ID="lblSimplePlot" style="width: 1400px;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divPlot" class="FullContentBlock">
            <asp:Label runat="server" ID="lblPlot_Label" Font-Bold="true" Text="Plot:" />
            <br />
            <asp:Label runat="server" ID="lblPlot" style="width: 1400px;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divCast" class="FullContentBlock">
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
            <asp:Hyperlink runat="server" ID="linkSeeFullCast" Text="See Full Cast" NavigateUrl="FullCast.aspx" Target="_blank" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divDirectors" class="FullContentBlock">
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
        <div id="divWriters" class="FullContentBlock">
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
        <div id="divSimpleTVEpisodes" class="FullContentBlock">
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
        <div id="divGenres" class="FullContentBlock">
            <asp:Label runat="server" ID="lblGenres_Label" Font-Bold="true" Text="Genres:" />
            <br />
             <asp:GridView ID="gvGenres" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="GenreName" HeaderText="Genre" ControlStyle-Width="1400px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divMovieTrivia" class="FullContentBlock">
            <asp:Label runat="server" ID="lblMovieTrivia_Label" Font-Bold="true" Text="Movie Trivia:" />
            <br />
             <asp:GridView ID="gvMovieTrivia" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Trivia" HeaderText="Trivia" ControlStyle-Width="1400px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divGoofs" class="FullContentBlock">
            <asp:Label runat="server" ID="lblGoofs_Label" Font-Bold="true" Text="Goofs:" />
            <br />
             <asp:GridView ID="gvGoofs" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Type" HeaderText="Goof Type" ControlStyle-Width="400px" />
                     <asp:BoundField DataField="GoofText" HeaderText="Text" ControlStyle-Width="1000px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divMovieQuotes" class="FullContentBlock">
            <asp:Label runat="server" ID="lblMovieQuotes" Font-Bold="true" Text="Quotes:" />
            <br />
            <asp:Table runat="server" ID="tblMovieQuotes" Width="100%" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divCountries" class="FullContentBlock">
            <asp:Label runat="server" ID="lblCountries_Label" Font-Bold="true" Text="Countries:" />
            <br />
             <asp:GridView ID="gvCountries" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="CountryName" HeaderText="Country" ControlStyle-Width="1400px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divFilmingLocations" class="FullContentBlock">
            <asp:Label runat="server" ID="lblFilmingLocations_Label" Font-Bold="true" Text="Filming Locations:" />
            <br />
             <asp:GridView ID="gvFilmingLocations" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Location" HeaderText="Location" ControlStyle-Width="600px" />
                     <asp:BoundField DataField="Remarks" HeaderText="Remarks" ControlStyle-Width="800px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divLanguages" class="FullContentBlock">
            <asp:Label runat="server" ID="lblLanguages_Label" Font-Bold="true" Text="Languages:" />
            <br />
             <asp:GridView ID="gvLanguages" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="LanguageName" HeaderText="Language" ControlStyle-Width="1400px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divAKAs" class="FullContentBlock">
            <asp:Label runat="server" ID="lblAKAs_Label" Font-Bold="true" Text="AKAs:" />
            <br />
             <asp:GridView ID="gvAKAs" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Country" HeaderText="Country" ControlStyle-Width="300px" />
                     <asp:BoundField DataField="Title" HeaderText="Title" ControlStyle-Width="500px" />
                     <asp:BoundField DataField="Comment" HeaderText="Comment" ControlStyle-Width="600px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divSimilarMovies" class="FullContentBlock">
            <asp:Label runat="server" ID="lblSimilarMovies_Label" Font-Bold="true" Text="Similar Movies:" />
            <br />
             <asp:GridView ID="gvSimilarMovies" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="IMDBID" HeaderText="IMDBID" ControlStyle-Width="200px" />
                     <asp:BoundField DataField="MovieName" HeaderText="Title" ControlStyle-Width="1200px" />
                </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divBusinessData" class="FullContentBlock">
            <asp:Label runat="server" ID="lblBusinessData_Label" Font-Bold="true" Text="Business Data:" />
            <br />
            <div id="divBudget" class="HalfContentLine">
                <asp:Label runat="server" ID="lblBudget_Label" Font-Bold="true" Text="Budget:" />
                &nbsp;
                <asp:Label runat="server" ID="lblBudget" Font-Bold="false" />
            </div>
            <div id="divOpeningWeekend" class="HalfContentLine">
                <asp:Label runat="server" ID="lblOpeningWeekend_Label" Font-Bold="true" Text="Opening Weekend:" />
                &nbsp;
                <asp:Label runat="server" ID="lblOpeningWeekend" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divGrossUSA" class="HalfContentLine">
                <asp:Label runat="server" ID="lblGrossUSA_Label" Font-Bold="true" Text="Gross USA:" />
                &nbsp;
                <asp:Label runat="server" ID="lblGrossUSA" Font-Bold="false" />
            </div>
            <div id="divWorldwide" class="HalfContentLine">
                <asp:Label runat="server" ID="lblWorldwide_Label" Font-Bold="true" Text="Worldwide:" />
                &nbsp;
                <asp:Label runat="server" ID="lblWorldwide" Font-Bold="false" />
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divTechnicalData" class="FullContentBlock">
            <asp:Label runat="server" ID="lblTechnicalData_Label" Font-Bold="true" Text="Technical Data:" />
            <br />
            <div id="divRuntime" class="HalfContentLine">
                <asp:Label runat="server" ID="lblTechnicalData_Runtime_Label" Font-Bold="true" Text="Runtime:" />
                &nbsp;
                <asp:Label runat="server" ID="lblTechnicalData_Runtime" Font-Bold="false" />
            </div>
            <div id="divSoundMix" class="HalfContentLine">
                <asp:Label runat="server" ID="lblSoundMix_Label" Font-Bold="true" Text="Sound Mix:" />
                &nbsp;
                <asp:Label runat="server" ID="lblSoundMix" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divColor" class="HalfContentLine">
                <asp:Label runat="server" ID="lblColor_Label" Font-Bold="true" Text="Color:" />
                &nbsp;
                <asp:Label runat="server" ID="lblColor" Font-Bold="false" />
            </div>
            <div id="divAspectRatio" class="HalfContentLine">
                <asp:Label runat="server" ID="lblAspectRatio_Label" Font-Bold="true" Text="Aspect Ratio:" />
                &nbsp;
                <asp:Label runat="server" ID="lblAspectRatio" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divCamera" class="HalfContentLine">
                <asp:Label runat="server" ID="lblCamera_Label" Font-Bold="true" Text="Camera:" />
                &nbsp;
                <asp:Label runat="server" ID="lblCamera" Font-Bold="false" />
            </div>
            <div id="divLaboratory" class="HalfContentLine">
                <asp:Label runat="server" ID="lblLaboratory_Label" Font-Bold="true" Text="Laboratory:" />
                &nbsp;
                <asp:Label runat="server" ID="lblLaboratory" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divFilmLength" class="HalfContentLine">
                <asp:Label runat="server" ID="lblFilmLength_Label" Font-Bold="true" Text="Film Length:" />
                &nbsp;
                <asp:Label runat="server" ID="lblFilmLength" Font-Bold="false" />
            </div>
            <div id="divNegativeFormat" class="HalfContentLine">
                <asp:Label runat="server" ID="lblNegativeFormat_Label" Font-Bold="true" Text="Negative Format:" />
                &nbsp;
                <asp:Label runat="server" ID="lblNegativeFormat" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divCinematographicProcess" class="HalfContentLine">
                <asp:Label runat="server" ID="lblCinematographicProcess_Label" Font-Bold="true" Text="Cinematographic Process:" />
                &nbsp;
                <asp:Label runat="server" ID="lblCinematographicProcess" Font-Bold="false" />
            </div>
            <div id="divPrintedFilmFormat" class="HalfContentLine">
                <asp:Label runat="server" ID="lblPrintedFilmFormat_Label" Font-Bold="true" Text="Printed Film Format:" />
                &nbsp;
                <asp:Label runat="server" ID="lblPrintedFilmFormat" Font-Bold="false" />
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divKeywords" class="FullContentBlock">
            <asp:Label runat="server" ID="lblKeywords_Label" Font-Bold="true" Text="Keywords:" />
            <br />
            <asp:Label runat="server" ID="lblKeywords" Font-Bold="false" Width="1400px" />
        </div>
    </div>
    <br /><br /><br /><br />
    <asp:Label runat="server" ID="lblPlaceholder" Font-Bold="false" Width="1400px" Text="" />
</asp:Content>
