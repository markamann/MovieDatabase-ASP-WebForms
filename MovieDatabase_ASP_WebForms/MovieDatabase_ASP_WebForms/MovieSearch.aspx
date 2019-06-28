<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieSearch.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.MovieSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2>Movie Search</h2>
    <asp:Panel runat="server" ID="pnSearchBy">
        <asp:Label runat="server" ID="lblSearchBy" Font-Bold="true" Text="Search by:"></asp:Label>
        <br />
        <div id="searchby" style="float: left; width: 100%; text-align: left;">
            <asp:LinkButton runat="server" ID="lbType" Text="Type" OnClick="lbType_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="lbTitle" Text="Title" OnClick="lbTitle_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="lbGenre" Text="Genre" OnClick="lbGenre_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="lbKeyword" Text="Keyword" OnClick="lbKeyword_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" ID="lbIMDBID" Text="IMDB ID" OnClick="lbIMDBID_Click" />
        </div>
    </asp:Panel>
    <br />
    <asp:Panel runat="server" ID="pnlType">
        <div id="divType" style="width: 100%; margin: 10px;">
            <asp:Label runat="server" ID="lblSearchBy_Type" Font-Bold="true" Text="Type:" />
            &nbsp;
            <asp:DropDownList runat="server" ID="ddlType" Font-Size="18pt">
                <asp:ListItem Text="All" Value="All" Selected="True" />
                <asp:ListItem Text="All Movies" Value="All Movies" />
                <asp:ListItem Text="Movie" Value="Movie" />
                <asp:ListItem Text="TV Movie" Value="TV Movie" />
                <asp:ListItem Text="TV Series" Value="TV Series" />
                <asp:ListItem Text="TV Episode" Value="TV Episode" />
            </asp:DropDownList>
            &nbsp;
            <asp:Button ID="btnSearchByType" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByType_Click" Font-Size="18pt" />
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlTitle">
        <div id="divTitle" style="width: 100%; margin: 10px;">
            <asp:CheckBox runat="server" ID="chkTitle_IncludeTVEpisodes" Text="Include TV Episodes?" OnCheckedChanged="chkTitle_IncludeTVEpisodes_CheckedChanged" AutoPostBack="true" />
            <br />
            <asp:Label runat="server" ID="lblSearchBy_Title" Font-Bold="true" Text="Title:" />
            &nbsp;
            <asp:DropDownList runat="server" ID="ddlTitle" />
            &nbsp;
            <asp:Button ID="btnSearchByTitle" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByTitle_Click" />
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlGenre">
        <div id="divGenre" style="width: 100%; margin: 10px;">
            <asp:Label runat="server" ID="lblSearchBy_Genre" Font-Bold="true" Text="Genre:" />
            &nbsp;
            <asp:DropDownList runat="server" ID="ddlGenre" />
            &nbsp;
            <asp:Button ID="btnSearchByGenre" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByGenre_Click" />
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlKeyword">
        <div id="divKeyword" style="width: 100%; margin: 10px;">
            <asp:Label runat="server" ID="lblSearchBy_Keyword" Font-Bold="true" Text="Keyword:" />
            &nbsp;
            <asp:DropDownList runat="server" ID="ddlKeyword" />
            &nbsp;
            <asp:Button ID="btnSearchByKeyword" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByKeyword_Click" />
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlIMDBID">
        <div id="divIMDBID" style="width: 100%; margin: 10px;">
            <asp:Label runat="server" ID="lblSearchBy_IMDBID" Font-Bold="true" Text="IMDB ID:" />
            &nbsp;
            <asp:TextBox runat="server" ID="txtSearchBy_IMDBID" />
            &nbsp;
            <asp:Button ID="btnSearchByIMDBID" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByIMDBID_Click" />
            <br />
            <asp:Label runat="server" ID="lblSearchByIMDBID_Error" Font-Bold="false" ForeColor="Red" />
        </div>
    </asp:Panel>
    <br /><br />
    <asp:Panel runat="server" ID="pnlResults">
        <div id="divResults" style="width: 100%; text-align: center;">
            <asp:Label runat="server" ID="lblRecordsReturned" Font-Bold="false" />
             <asp:GridView
                 ID="gvResults"
                 runat="server"
                 AutoGenerateColumns="false"
                 PageSize="20"
                 OnRowCommand="gvResults_RowCommand"
                 Width="100%">
                 <Columns>
                    <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                        <ItemTemplate>
                            <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("MovieID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="Title" HeaderText="Title" ControlStyle-Width="500px" />
                     <asp:BoundField DataField="Type" HeaderText="Type" ControlStyle-Width="300px" />
                     <asp:BoundField DataField="Year" HeaderText="Year" ControlStyle-Width="300px" />
                 </Columns>
             </asp:GridView>
        </div>
    </asp:Panel>
    <br /><br /><br /><br />
</asp:Content>
