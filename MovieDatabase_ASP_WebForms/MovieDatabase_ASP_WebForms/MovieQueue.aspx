<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieQueue.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.MovieQueue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="MainContainer" class="MarginContainer">
        <h2>Movie Queue</h2>
        This web site pulls data from a Microsoft SQL Server database.  As movies are added, the cast list is retrieved and stored.  The movies in the filmographies of the actors are added to a Movie Queue for future processing.
        <br /><br />
        Since there are currently <asp:Label runat="server" ID="lblTotalQueueRecords" /> records in the table, displaying the entire queue would be impractical.  So, below are the top 100 records sorted by priority and timestamp.
        <br /><br />
        <asp:Panel runat="server" ID="pnlResults">
            <div id="divResults" class="MarginContainer">
                 <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="false" Width="100%">
                     <Columns>
                         <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" ControlStyle-Width="20%" />
                         <asp:BoundField DataField="IMDBID" HeaderText="IMDB ID" ControlStyle-Width="20%" />
                         <asp:BoundField DataField="Title" HeaderText="Title" ControlStyle-Width="30%" />
                         <asp:BoundField DataField="Year" HeaderText="Year" ControlStyle-Width="10%" />
                         <asp:BoundField DataField="Type" HeaderText="Type" ControlStyle-Width="10%" />
                         <asp:BoundField DataField="Priority" HeaderText="Priority" ControlStyle-Width="10%" />
                     </Columns>
                 </asp:GridView>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
