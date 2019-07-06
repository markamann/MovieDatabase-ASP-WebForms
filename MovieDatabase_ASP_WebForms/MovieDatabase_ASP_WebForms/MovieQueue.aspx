<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieQueue.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.MovieQueue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div style="float: left; width: 90%; margin: 20px;">
        <h2>About This Site</h2>
        <br />
        This web site pulls data from a Microsoft SQL Server database.  As movies are added, the cast list is retrieved and stored.  The movies in the filmographies of the actors are added to a Movie Queue for future processing.
        <br /><br />
        Since there are currently <asp:Label runat="server" ID="lblTotalQueueRecords" /> records in the table, displaying the entire queue would be impractical.  So, below are the top 100 records sorted by priority and timestamp.
        <br /><br />
        <asp:Panel runat="server" ID="pnlResults">
            <div id="divResults" style="width: 100%; text-align: center;">
                 <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="false" Width="100%">
                     <Columns>
                         <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" ControlStyle-Width="300px" />
                         <asp:BoundField DataField="IMDBID" HeaderText="IMDB ID" ControlStyle-Width="250px" />
                         <asp:BoundField DataField="Title" HeaderText="Title" ControlStyle-Width="500px" />
                         <asp:BoundField DataField="Year" HeaderText="Year" ControlStyle-Width="250px" />
                         <asp:BoundField DataField="Type" HeaderText="Type" ControlStyle-Width="300px" />
                         <asp:BoundField DataField="Priority" HeaderText="Priority" ControlStyle-Width="250px" />
                     </Columns>
                 </asp:GridView>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
