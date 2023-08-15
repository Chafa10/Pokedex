<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListadoPokemon.aspx.cs" Inherits="Pokemon_Pokedex_App.ListadoPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>Lista Pokemon</h1>
    <asp:Label ID="lblFiltrar" runat="server" Text="Filtrar"></asp:Label>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <asp:TextBox ID="txtFiltrar" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtFiltrar_TextChanged"></asp:TextBox>
            </div>
        </div>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" ID="chbFiltroAvanzado" runat="server" OnCheckedChanged="chbFiltroAvanzado_CheckedChanged" AutoPostBack="true" />

            </div>
        </div>
    </div>
    <%if (chbFiltroAvanzado.Checked)
        {  %>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label ID="lblCampo" runat="server" Text="Campo"></asp:Label>
                <asp:DropDownList ID="ddlCampo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" runat="server">
                    <asp:ListItem Text="Nombre"></asp:ListItem>
                    <asp:ListItem Text="Tipo"></asp:ListItem>
                    <asp:ListItem Text="Número"></asp:ListItem>
                </asp:DropDownList>

            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label ID="lblCriterio" runat="server" Text="Criterio"></asp:Label>
                <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label ID="lblFiltro" runat="server" Text="Filtro"></asp:Label>
                <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label ID="lblEstado" runat="server" Text="Estado"></asp:Label>
                <asp:DropDownList ID="ddlEstado" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Todos"></asp:ListItem>
                    <asp:ListItem Text="Inactivos"></asp:ListItem>
                    <asp:ListItem Text="Activos"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-success" Text="Filtrar" OnClick="btnFiltrar_Click" />
            </div>
        </div>
    </div>
    <%} %>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="dgvPokemons" CssClass="table" AutoGenerateColumns="false"
                runat="server" DataKeyNames="Id" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
                OnPageIndexChanging="dgvPokemons_PageIndexChanging"
                AllowPaging="true" PageSize="5">
                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                    <asp:BoundField HeaderText="Numero" DataField="Numero" />
                    <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                    <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="Seleccionar" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>





    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
    <a href="Default.aspx" class="btn btn-secondary">Cancelar</a>

</asp:Content>
