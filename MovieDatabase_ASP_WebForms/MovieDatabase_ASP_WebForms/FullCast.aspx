<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FullCast.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.FullCast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="divMainContainer" class="MainContainer">
        <h2>Movie Detail - Full Cast</h2>
        <div id="divMoviePosterAndTitleBlock" class="MoviePosterAndTitleBlock">
            <div id="divMoviePoster" class="MoviePoster">
                <asp:HyperLink runat="server" ID="linkMoviePoster"><asp:Image runat="server" ID="imgMoviePoster" Height="200" /></asp:HyperLink>
            </div>
            <div id="divTitle" class="TitleBlock">
                <asp:Label runat="server" ID="lblTitle" Font-Bold="true" Font-Size="36pt" />
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divMovieBaseDataBlock" class="MarginContainer">
            <div id="divOriginalTitle" class="ContentLine" style="width: 100%;">
                <asp:Label runat="server" ID="lblOriginalTitle_Label" Font-Bold="true" Text="Original Title:" />
                &nbsp;
                <asp:Label runat="server" ID="lblOriginalTitle" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divIMDBID" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblIMDBID_Label" Font-Bold="true" Text="IMDBID:" />
                &nbsp;
                <asp:Label runat="server" ID="lblIMDBID" Font-Bold="false" />
            </div>
            <div id="divIType" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblType_Label" Font-Bold="true" Text="Type:" />
                &nbsp;
                <asp:Label runat="server" ID="lblType" Font-Bold="false" />
            </div>
            <div id="divIMPAARating" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblMPAARating_Label" Font-Bold="true" Text="MPAA Rating:" />
                &nbsp;
                <asp:Label runat="server" ID="lblMPAARating" Font-Bold="false" />
            </div>
            <div id="divIReleaseDate" class="ContentLine" style="width: 40%;">
                <asp:Label runat="server" ID="lblReleaseDate_Label" Font-Bold="true" Text="Release Date:" />
                &nbsp;
                <asp:Label runat="server" ID="lblReleaseDate" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divIYear" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblYear_Label" Font-Bold="true" Text="Year:" />
                &nbsp;
                <asp:Label runat="server" ID="lblYear" Font-Bold="false" />
            </div>
            <div id="divIRuntime" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblRuntime_Label" Font-Bold="true" Text="Runtime:" />
                &nbsp;
                <asp:Label runat="server" ID="lblRuntime" Font-Bold="false" />
            </div>
            <div id="divIRating" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblRating_Label" Font-Bold="true" Text="Rating:" />
                &nbsp;
                <asp:Label runat="server" ID="lblRating" Font-Bold="false" />
            </div>
            <div id="divIMetascore" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblMetascore_Label" Font-Bold="true" Text="Metascore:" />
                &nbsp;
                <asp:Label runat="server" ID="lblMetascore" Font-Bold="false" />
            </div>
            <div id="divIVotes" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblVotes_Label" Font-Bold="true" Text="Votes:" />
                &nbsp;
                <asp:Label runat="server" ID="lblVotes" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divISeriesIMDBID" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblSeriesIMDBID_Label" Font-Bold="true" Text="Series IMDBID:" />
                &nbsp;
                <asp:LinkButton runat="server" ID="lbSeriesIMDBID" Font-Bold="false" />
            </div>
            <div id="divISeriesName" class="ContentLine" style="width: 75%;">
                <asp:Label runat="server" ID="lblSeriesName_Label" Font-Bold="true" Text="Series Name:" />
                &nbsp;
                <asp:Label runat="server" ID="lblSeriesName" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divIIMDBURL" class="ContentLine" style="width: 100%;">
                <asp:Label runat="server" ID="lblIIMDBURL_Label" Font-Bold="true" Text="IIMDB URL:" />
                &nbsp;
                <asp:HyperLink runat="server" ID="linklIMDBURL" />
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divCast" class="FullContentBlock">
            <asp:Label runat="server" ID="lblCast" Font-Bold="true" Text="Cast:" />
            <br />
             <asp:GridView ID="gvCast" runat="server" AutoGenerateColumns="false" OnRowCommand="gvCast_RowCommand" Width="100%">
                 <Columns>
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="5%">
                        <ItemTemplate>
                            <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("PersonID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="ActorIMDBID" HeaderText="IMDB ID" ControlStyle-Width="10%" />
                     <asp:BoundField DataField="ActorName" HeaderText="Actor Name" ControlStyle-Width="30%" />
                     <asp:BoundField DataField="CharacterName" HeaderText="Character Name" ControlStyle-Width="30%" />
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="25%">
                        <ItemTemplate>
                            <asp:HyperLink ID = "linkCast_IMDBURL" runat="server" Text="IMDB&nbsp;Page" NavigateUrl='<% #Eval("IMDBCharacterURL") %>' Target="_blank" />
                        </ItemTemplate>
                    </asp:TemplateField>
                 </Columns>
             </asp:GridView>
        </div>
    </div>
    <br /><br /><br /><br />
    <asp:Label runat="server" ID="lblPlaceholder" Font-Bold="false" Width="100%" Text="" />
</asp:Content>
