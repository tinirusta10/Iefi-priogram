<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="FormGoleadoresSeg.aspx.cs" Inherits="Iefi_priogram.Pages.FormGoleadoresSeg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="mx-auto" style="width: 250px">
            <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
        </div>
        <form id="formGoleadoresSeg" runat="server" class="container mt-5">
            <div class="form-group">
                <asp:Label ID="lblequipo" CssClass="form-label" runat="server" Text="Equipo:"></asp:Label>
                <asp:DropDownList ID="ddlEquipo" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Agropecuario" Value="Agropecuario" />
                    <asp:ListItem Text="Temperley" Value="Temperley" />
                    <asp:ListItem Text="Patronato" Value="Patronato" />
                    <asp:ListItem Text="All Boys" Value="All Boys" />
                    <asp:ListItem Text="Almagro" Value="Almagro" />
                    <asp:ListItem Text="San Telmo" Value="San Telmo" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblnombre" CssClass="form-label" runat="server" Text="Nombre:"></asp:Label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblapellido" CssClass="form-label" runat="server" Text="Apellido:"></asp:Label>
                <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="LabelPos" CssClass="form-label" runat="server" Text="Posicion:"></asp:Label>
                <asp:DropDownList ID="ddlPos" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Delantero" Value="Delantero" />
                    <asp:ListItem Text="MedioCampista" Value="MedioCampista" />
                    <asp:ListItem Text="Defensor" Value="Defensor" />
                    <asp:ListItem Text="Lateral" Value="Lateral" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblgoles" CssClass="form-label" runat="server" Text="Goles:"></asp:Label>
                <asp:TextBox ID="txtGoles" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
            </div>

            <div class="button-container mt-4">
                <asp:Button runat="server" ID="BtnCreate" Text="Crear" CssClass="btn btn-primary mr-2" OnClick="BtnCreate_click" />
                <asp:Button runat="server" ID="BtnUpdate" Text="Editar" CssClass="btn btn-primary mr-2" OnClick="BtnUpdate_click" Visible="false" />
                 <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Borrar" Visible="false" OnClick="BtnDelete_Click" />

            </div>
        </form>
    </div>
</asp:Content>