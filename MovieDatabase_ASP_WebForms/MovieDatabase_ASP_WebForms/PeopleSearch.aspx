<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PeopleSearch.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.PeopleSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/chosen.min.css" rel="stylesheet" />  
    <script src="Scripts/jquery-3.3.1.min.js"></script>  
    <script src="Scripts/chosen.jquery.min.js"></script>  
    <script type="text/javascript">  
        $(document).ready(function () {  
            InitDropDown();  
        })  
  
        function InitDropDown() {  
            var config = {  
                '.ChosenSelector': { allow_single_deselect: true, search_contains: true, width: "350px", font-size: "18pt" },  
            }  
            for (var selector in config) {  
                $(selector).chosen(config[selector]);  
            }  
        }  
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="divMainContainer" class="MarginContainer">
        <h2>People Search</h2>
        <asp:Panel runat="server" ID="pnSearchBy">
            <asp:Label runat="server" ID="lblSearchBy" Font-Bold="true" Text="Search by:"></asp:Label>
            <br />
             <div id="divSearchBy" style="float: left; width: 100%; text-align: left;">
                <asp:LinkButton runat="server" ID="lbFullName" Text="FullName" OnClick="lbFullName_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton runat="server" ID="lbSex" Text="Sex" OnClick="lbSex_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton runat="server" ID="lbIMDBID" Text="IMDB ID" OnClick="lbIMDBID_Click" />
            </div>
        </asp:Panel>
        <br />

        <asp:Panel runat="server" ID="pnlFullName">
            <div id="divFullName" class="MarginContainer">
                <asp:Label runat="server" ID="lblSearchBy_FullName" Font-Bold="true" Text="Full Name:" />
                &nbsp;
                <asp:DropDownList runat="server" ID="ddlFullName" CssClass="ChosenSelector" Font-Size="18pt" />
                &nbsp;
                <asp:Button ID="btnSearchByFullName" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByFullName_Click" Font-Size="18pt" />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlSex">
            <div id="divSex" class="MarginContainer">
                <asp:Label runat="server" ID="lblSearchBy_Sex" Font-Bold="true" Text="Sex:" />
                &nbsp;
                <asp:DropDownList runat="server" ID="ddlSex" CssClass="ChosenSelector" Font-Size="18pt">
                    <asp:ListItem Selected="True">Female</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Unspecified</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                <asp:Button ID="btnSearchBySex" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchBySex_Click" Font-Size="18pt" />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlIMDBID">
            <div id="divIMDBID" class="MarginContainer">
                <asp:Label runat="server" ID="lblSearchBy_IMDBID" Font-Bold="true" Text="IMDB ID:" />
                &nbsp;
                <asp:TextBox runat="server" ID="txtSearchBy_IMDBID" Font-Size="18pt" />
                &nbsp;
                <asp:Button ID="btnSearchByIMDBID" runat="server" BackColor="#000000" Font-Bold="True" ForeColor="Lime" Text="Search" OnClick="btnSearchByIMDBID_Click" Font-Size="18pt" />
                <br />
                <asp:Label runat="server" ID="lblSearchByIMDBID_Error" Font-Bold="false" ForeColor="Red" />
            </div>
        </asp:Panel>
        <br /><br />
        <asp:Panel runat="server" ID="pnlResults">
            <div id="divResults" class="MarginContainer">
                <asp:Label runat="server" ID="lblRecordsReturned" Font-Bold="false" />
                 <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="false" OnRowCommand="gvResults_RowCommand" Width="100%">
                     <Columns>
                        <asp:TemplateField HeaderText = ""  ControlStyle-Width="200px">
                            <ItemTemplate>
                                <asp:LinkButton ID = "lblView" runat = "server" Text = "View" CommandName = "View" CommandArgument = '<% #Eval("PersonID") %>' OnClientClick="aspnetForm.target ='_blank';"></asp:LinkButton >
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="IMDBID" HeaderText="IMDB ID" ControlStyle-Width="20%" />
                         <asp:BoundField DataField="FullName" HeaderText="Full Name" ControlStyle-Width="60%" />
                         <asp:BoundField DataField="Sex" HeaderText="Sex" ControlStyle-Width="20%" />
                     </Columns>
                 </asp:GridView>
            </div>
        </asp:Panel>
        <br /><br /><br /><br />
    </div>
</asp:Content>
