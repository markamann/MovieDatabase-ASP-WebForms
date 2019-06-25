<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div style="float: left; width: 50%; margin: 20px;">
        <br /><br />
        Welcome to my Movie Database application.  The purpose of this applicaiton is to
        demonstrate interacting with my Movie Database using ASP.NET web forms technology.
        <br /><br />
        Please read the <a href="About.aspx">About</a> page for more details.
    </div>
    <div style="float: right; width: 30%; margin: 20px;">
        <br /><br />
        <asp:Label runat="server" ID="lblHeadingTitle" Font-Bold="true" Font-Underline="true" Text="Database Statistics"></asp:Label>
        <br /><br />
        <asp:Label runat="server" ID="lblTotalMovieEntries_Label" Font-Bold="true" Text="Total Movie Entries:"></asp:Label>
        &nbsp;
        <asp:Label runat="server" ID="lblTotalMovieEntries" Font-Bold="false"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label runat="server" ID="lblTotalMovies_Lable" Font-Bold="true" Text="Total Movies:"></asp:Label>
        &nbsp;
        <asp:Label runat="server" ID="lblTotalMovies" Font-Bold="false"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label runat="server" ID="lblTotalTVMovies_Label" Font-Bold="true" Text="Total TV Movies:"></asp:Label>
        &nbsp;
        <asp:Label runat="server" ID="lblTotalTVMovies" Font-Bold="false"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label runat="server" ID="lblTotalTVSeries_Label" Font-Bold="true" Text="Total TV Series:"></asp:Label>
        &nbsp;
        <asp:Label runat="server" ID="lblTotalTVSeries" Font-Bold="false"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label runat="server" ID="lblTotalTVEpisodes_Label" Font-Bold="true" Text="Total TV Episodes:"></asp:Label>
        &nbsp;
        <asp:Label runat="server" ID="lblTotalTVEpisodes" Font-Bold="false"></asp:Label>
        <br />
        <asp:Label runat="server" ID="lblTotalPeople_Label" Font-Bold="true" Text="Total People:"></asp:Label>
        &nbsp;
        <asp:Label runat="server" ID="lblTotalPeople" Font-Bold="false"></asp:Label>
    </div>
</asp:Content>
