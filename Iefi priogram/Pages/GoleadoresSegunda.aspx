<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="GoleadoresSegunda.aspx.cs" Inherits="Iefi_priogram.Pages.GoleadoresSegunda"  enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="bg-image" style="background-image: url('https://www.presidencia.go.cr/bicentenario/wp-content/uploads/2020/04/F%C3%BAtbol.jpeg'); height: 100vh; background-size: cover; position: relative;">

    <form id="form1" runat="server">
    <div class="centered">
        <div class="table-title">
        <h2 style="color:white">Goleadores de segunda division</h2>
        </div>
        <asp:Button runat="server" ID="BtnCreate" Text="Crear" CssClass="btn btn-primary mr-2" OnClick="BtnCreate_click" />
<asp:GridView ID="gvGolSeg" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" style="background-color: rgba(0, 0, 0, 0.3); color: white;">    

    <Columns>
        <asp:BoundField DataField="Id_goleadoresM" HeaderText="ID" />
        <asp:BoundField DataField="Equipo" HeaderText="Equipo" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
        <asp:BoundField DataField="Posicion" HeaderText="Posicion" />
        <asp:BoundField DataField="Goles" HeaderText="Goles" />
        <asp:TemplateField HeaderText="Opciones">
            <ItemTemplate>
                <asp:Button runat="server" ID="BtnUpdate" Text="Editar" CssClass="btn btn-primary" OnClick="BtnUpdate_click" style="background-color: rgba(0, 0, 0, 0.3); color: white;"/>                                
                <asp:Button runat="server" Text="Borrar" CssClass="btn form-control-sm btn-danger" ID="BtnDelete" OnClick="BtnDelete_Click" style="background-color: rgba(0, 0, 0, 0.3); color: white;"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        
</asp:GridView>
    </div>
        </form>
    </div>
</asp:Content>