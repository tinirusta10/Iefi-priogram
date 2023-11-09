<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="FormTabla.aspx.cs" Inherits="Iefi_priogram.Pages.FormTabla" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="form-container">
        <div class="mx-auto" style="width:250px">
            <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
        </div>
<form id="formTablas" runat="server" class="container mt-5">
    <div class="form-group">
        <asp:Label ID="lblequipo" CssClass="form-label" runat="server" Text="Producto:"></asp:Label>
        <asp:TextBox ID="txtEquipo" CssClass="form-control" runat="server"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lblpts" CssClass="form-label" runat="server" Text="Puntos:"></asp:Label>
        <asp:TextBox ID="txtpuntos" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:Label ID="lbljugados" CssClass="form-label" runat="server" Text="Partidos Jugados:"></asp:Label>
        <asp:TextBox ID="txtjugados" CssClass="form-control" runat="server" ></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Label ID="lblgol" CssClass="form-label" runat="server" Text="Goles:"></asp:Label>
        <asp:TextBox ID="txtgolesfavor" CssClass="form-control" runat="server"></asp:TextBox>
    </div>

    <div class="button-container mt-4">
            <asp:Button runat="server" ID="BtnCreate" Text="Crear" CssClass="btn btn-primary mr-2" OnClick="BtnCreate_click" />
            <asp:Button runat="server" ID="BtnUpdate" Text="Editar" CssClass="btn btn-primary mr-2" OnClick="BtnUpdate_click" Visible="false" />
                 <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Borrar" Visible="false" OnClick="BtnDelete_Click" />
    </div>
</form>
    </div>
</asp:Content>