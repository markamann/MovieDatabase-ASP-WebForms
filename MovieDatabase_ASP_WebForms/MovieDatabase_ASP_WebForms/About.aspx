<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MovieDatabase_ASP_WebForms.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div style="float: left; width: 90%; margin: 20px;">
        <h2>About This Site</h2>
    
        <h3><u>Purpose:</u></h3>
        This site was developed by Mark Amann.  I am a software developer looking to expand my skill set and learn new things.  The purpose of this web site is to provide a medium in which I can experiment, explore and learn new web-based technologies.  It is also intended to be a code sample and demonstration of my proficiency with these various technologies.
        <br /><br />
        This web site was developed using ASP.NET Web Forms.  The code for this web site can be viewed on my GitHub profile at <a href="https://github.com/markamann" target="_blank">https://github.com/markamann</a>.
        <br /><br />

        <h3><u>Background:</u></h3>
        I was looking for a project to use as a learning tool.  I am a movie fan.  So, I decided to develop an application that uses the <a href="https://www.myapifilms.com" target="_blank">MyAPIFilms</a> Internet Movie Database (IMDB) API  to automatically populate my database with data from the <a href="http://www.imdb.com" target="_blank">Internet Movie Database</a>.
        <br /><br />
        This application, MovieDatabaseWorker, is a Windows console application that can run continuously.  Once I seeded it with a movie, it used the API to download and store the movie data including a cast list.  It then uses the movie's cast list to look up the filmographies of the cast and adds those movies to a queue for future processing.
        <br /><br />
        In this way, the application is self-populating.  I have included various functionality that will enable the application to continue if interrupted or if an error occurs.

        <h3><u>My Goals:</u></h3>
        My goal is to reproduce the functionality of this site using new technologies that I want to learn and master.
        <br />
        <ul>
            <li>Microsoft MVC with Entity Framework</li>
            <li>HTML5/CSS/JavaScript (Possibly with a .NET Core back end?)</li>
            <li>React.js and Node.js</li>
            <li>And maybe more</li>
        </ul>
        

        <h3><u>Notice:</u></h3>
        Please note, the code published in the above mentioned public repositories on my GitHub account is intended for code sample purposes only.  You may download the solutions for review purposes. However, the solutions will not compile or run due to the absence of several dependencies.
        Key among those dependencies is a library containing connection information.  This library contains private information such as database connection strings, usernames and passwords, private API tokens, and other sensitive information.  For security reasons, I cannot make this library or its code available to the public.


    </div>


    <br /><br /><br /><br />
</asp:Content>
