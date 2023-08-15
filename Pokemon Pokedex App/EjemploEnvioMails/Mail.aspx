<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="Pokemon_Pokedex_App.EjemploEnvioMails.Mail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-3"></div>
        <div class="col">
            <div class="mb-3">
                <label class="form-label">Direccion Email</label>
                <asp:TextBox ID="txtEmail" runat="server" cssclass="form-control"></asp:TextBox>                
            </div>
            <div class="mb-3">
                <label class="form-label">Asunto</label>
                <asp:TextBox ID="txtAsunto" runat="server" cssclass="form-control"></asp:TextBox>               
            </div>
            <div class="mb-3">
                <label class="form-label">Mensaje</label>
                <asp:TextBox ID="txtMensaje" runat="server" cssclass="form-control" TextMode="MultiLine"></asp:TextBox>                
            </div>
            <asp:Button ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" Text="Aceptar" />
        </div>
        <div class="col-3"></div>

    </div>


</asp:Content>
