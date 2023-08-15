<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Pokemon_Pokedex_App.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <h2>Te logeaste correctamente</h2>
        <hr />
        <div class="col-4">
            <asp:Button runat="server" CssClass="btn btn-primary" Text="Usuario" id="btnUsuario" OnClick="btnUsuario_Click" />
        </div>
        <%if (Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
            { %>
        <div class="col-4">
            <asp:Button runat="server" CssClass="btn btn-primary" Text="Admin" ID="btnAdmin" OnClick="btnAdmin_Click" />
        </div>
        <%} %>
    </div>
</asp:Content>
