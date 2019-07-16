<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonDetail.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.PersonDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="divMainContainer" class="MainContainer">
        <h2>Person Detail</h2>
        <div id="divPhotoAndNameBlock" class="PhotoAndNameBlock">
            <div id="divPersonPhoto" class="PersonPhoto">
                <asp:HyperLink runat="server" ID="linkPersonPhoto"><asp:Image runat="server" ID="imgPersonPhoto" Height="200px" /></asp:HyperLink>
            </div>
            <div id="divFullName" class="FullNameBlock">
                <asp:Label runat="server" ID="lblFullName" Font-Bold="true" Font-Size="36pt" />
            </div>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divPersonBaseDataBlock" class="MarginContianer">
            <div id="divIMDBID" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblIMDBID_Label" Font-Bold="true" Text="IMDBID:" />
                &nbsp;
                <asp:Label runat="server" ID="lblIMDBID" Font-Bold="false" />
            </div>
            <div id="divFirstName" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblFirstName_Label" Font-Bold="true" Text="First Name:" />
                &nbsp;
                <asp:Label runat="server" ID="lblFirstName" Font-Bold="false" />
            </div>
            <div id="divMiddleName" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblMiddleName_Label" Font-Bold="true" Text="Middle Name:" />
                &nbsp;
                <asp:Label runat="server" ID="lblMiddleName" Font-Bold="false" />
            </div>
            <div id="divLastName" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblLastName_Label" Font-Bold="true" Text="Last Name:" />
                &nbsp;
                <asp:Label runat="server" ID="lblLastName" Font-Bold="false" />
            </div>
            <div id="divSuffix" class="ContentLine" style="width: 20%;">
                <asp:Label runat="server" ID="lblSuffix_Label" Font-Bold="true" Text="Suffix:" />
                &nbsp;
                <asp:Label runat="server" ID="lblSuffix" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divBirthName" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblBirthName_Label" Font-Bold="true" Text="Birth Name:" />
                &nbsp;
                <asp:Label runat="server" ID="lblBirthName" Font-Bold="false" />
            </div>
            <div id="divDateOfBirth" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblDateOfBirth_Label" Font-Bold="true" Text="Date Of Birth:" />
                &nbsp;
                <asp:Label runat="server" ID="lblDateOfBirth" Font-Bold="false" />
            </div>
            <div id="divDateOfDeath" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblDateOfDeath_Label" Font-Bold="true" Text="Date Of Death:" />
                &nbsp;
                <asp:Label runat="server" ID="lblDateOfDeath" Font-Bold="false" />
            </div>
            <div id="divPlaceOfBirth" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblPlaceOfBirth_Label" Font-Bold="true" Text="Place Of Birth:" />
                &nbsp;
                <asp:Label runat="server" ID="lblPlaceOfBirth" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divActorActress" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblActorActress_Label" Font-Bold="true" Text="ActorActress:" />
                &nbsp;
                <asp:Label runat="server" ID="lblActorActress" Font-Bold="false" />
            </div>
            <div id="divSex" class="ContentLine" style="width: 25%;">
                <asp:Label runat="server" ID="lblSex_Label" Font-Bold="true" Text="Sex:" />
                &nbsp;
                <asp:Label runat="server" ID="lblSex" Font-Bold="false" />
            </div>
            <div style="clear: both;"></div>
            <div id="divHeight" class="ContentLine" style="width: 33%;">
                <asp:Label runat="server" ID="lblHeight_Label" Font-Bold="true" Text="Height:" />
                &nbsp;
                <asp:Label runat="server" ID="lblHeight" Font-Bold="false" />
            </div>
            <div id="divHeightFeet" class="ContentLine" style="width: 33%;">
                <asp:Label runat="server" ID="lblHeightFeet_Label" Font-Bold="true" Text="Height Feet:" />
                &nbsp;
                <asp:Label runat="server" ID="lblHeightFeet" Font-Bold="false" />
            </div>
            <div id="divHeightInches" class="ContentLine" style="width: 34%;">
                <asp:Label runat="server" ID="lblHeightInches_Label" Font-Bold="true" Text="Height Inches:" />
                &nbsp;
                <asp:Label runat="server" ID="lblHeightInches" Font-Bold="false" />
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
        <div id="divBio" class="FullContentBlock">
            <asp:Label runat="server" ID="lblBio_Label" Font-Bold="true" Text="Bio:" />
            <br />
            <asp:Label runat="server" ID="lblBio" style="width: 100%;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divBorn" class="FullContentBlock">
            <asp:Label runat="server" ID="lblBorn_Label" Font-Bold="true" Text="Born:" />
            <br />
            <asp:Label runat="server" ID="lblBorn" style="width: 100%;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divDied" class="FullContentBlock">
            <asp:Label runat="server" ID="lblDied_Label" Font-Bold="true" Text="Died:" />
            <br />
            <asp:Label runat="server" ID="lblDied" style="width: 100%;" />
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divNicknames" class="FullContentBlock">
            <asp:Label runat="server" ID="lblNicknames_Label" Font-Bold="true" Text="Nicknames:" />
            <br />
             <asp:GridView ID="gvNicknames" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Name" HeaderText="Nickname" ControlStyle-Width="100%" />
                 </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divTrivia" class="FullContentBlock">
            <asp:Label runat="server" ID="lblTrivia_Label" Font-Bold="true" Text="Trivia:" />
            <br />
             <asp:GridView ID="gvTrivia" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Trivia" HeaderText="Trivia" ControlStyle-Width="100%" />
                 </Columns>
             </asp:GridView>
        </div>
        <div style="clear: both;"></div>
        <br />
        <div id="divQuotes" class="FullContentBlock">
            <asp:Label runat="server" ID="lblQuotes_Label" Font-Bold="true" Text="Quotes:" />
            <br />
             <asp:GridView ID="gvQuotes" runat="server" AutoGenerateColumns="false" Width="100%">
                 <Columns>
                     <asp:BoundField DataField="Quote" HeaderText="Quote" ControlStyle-Width="100%" />
                 </Columns>
             </asp:GridView>
        </div>
    </div>
    <br /><br /><br /><br />
    <asp:Label runat="server" ID="lblPlaceholder" Font-Bold="false" Width="1400px" Text="" />
</asp:Content>
