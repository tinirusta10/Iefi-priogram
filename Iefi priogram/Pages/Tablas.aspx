<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Tablas.aspx.cs" Inherits="Iefi_priogram.Pages.Tablas"  enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                      <div class="bg-image" style="background-image: url('https://mundoentrenamiento.com/wp-content/uploads/2015/04/causas-de-la-fatiga-en-el-futbol.jpg'); height: 100vh; background-size: cover; position: relative;">

    
    <form id="form1" runat="server">
    <div class="centered">
        <div class="table-title">
        <h2 style="color:white">Tabla de posiciones</h2>
        </div>
        <asp:Button runat="server" ID="BtnCreate" Text="Crear" CssClass="btn btn-primary mr-2" OnClick="BtnCreate_click" />
<asp:GridView ID="gvTablas" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" style="background-color: rgba(0, 0, 0, 0.3); color: white;">    
    <Columns>
        <asp:BoundField DataField="Id_tabla" HeaderText="ID" ItemStyle-CssClass="table-cell" />
        <asp:BoundField DataField="Equipo" HeaderText="Equipo" ItemStyle-CssClass="table-cell" />
        <asp:BoundField DataField="Puntos" HeaderText="Puntos" ItemStyle-CssClass="table-cell" />
        <asp:BoundField DataField="Partidos_Jugados" HeaderText="Partidos Jugados" ItemStyle-CssClass="table-cell" />
        <asp:BoundField DataField="Goles_Favor" HeaderText="Goles a Favor" ItemStyle-CssClass="table-cell" />
        <asp:TemplateField HeaderText="Opciones">
            <ItemTemplate>
                <asp:Button runat="server" ID="BtnUpdate" Text="Editar" CssClass="btn btn-primary" OnClick="BtnUpdate_click" style="background-color: rgba(0, 0, 0, 0.3); color: white;" />
                <asp:Button runat="server" CssClass="btn btn-primary" ID="BtnDelete" Text="Borrar" OnClick="BtnDelete_Click" style="background-color: rgba(0, 0, 0, 0.3); color: white;"/>

            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    </div>
        </form>
                          </div>
</asp:Content>