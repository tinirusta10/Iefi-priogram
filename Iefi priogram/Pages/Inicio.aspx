<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Iefi_priogram.Pages.Inicio" %>

        
        <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/styles.css") %>" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

            
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
        <body>
            <div class="bg-image" style="background-image: url('https://as01.epimg.net/futbol/imagenes/2021/02/11/reportajes/1613002271_264040_1613002427_noticiareportajes_grande.jpg'); height: 100vh; background-size: cover; position: relative;">
                <div class="background-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.3);"></div>
                <div class="centered-text">
                    <h1 style="text-align: center; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                        <span style="color: yellow; font-size: 80px;">Info</span>
                        <br />
                        <span style="color: white; font-size: 100px;">Futbol</span>
                    </h1>
                </div>
            </div>
        </body>
    </html>
</asp:Content>





