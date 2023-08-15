<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="Pokemon_Pokedex_App.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">

        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox ID="txtId" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNumero" class="form-label">Numero</label>
                <asp:TextBox ID="txtNumero" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="ddlTipo" class="form-label">Tipo</label>
                <asp:DropDownList ID="ddlTipo" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="ddlDebilidad" class="form-label">Debilidad</label>
                <asp:DropDownList ID="ddlDebilidad" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnAceptar" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAceptar_Click" />
                <a href="ListadoPokemon.aspx">Cancelar</a>
                <asp:Button Text="Inactivar" ID="btnActivo" CssClass="btn btn-warning" OnClick="btnActivo_Click" runat="server" />
            </div>

        </div>

        <div class="col-6">
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripcion</label>
                <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtUrlImagen" class="form-label">UrlImagen</label>
                        <asp:TextBox ID="txtUrlImagen" CssClass="form-control" runat="server"
                            AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged">
                        </asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Image ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
                            ID="imgPokemon" Width="50%" runat="server" />
                    </div>

                </ContentTemplate>

            </asp:UpdatePanel>

        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel ID="UpdatePanelEliminar" runat="server">
                <ContentTemplate>

                    <div>
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />

                    </div>

                    <%if (ConfirmarEliminacion)

                        { %>
                    <div>
                        <asp:CheckBox Text="Confirmar Eliminacion" ID="chbConfirmarEliminacion" runat="server" />
                        <asp:Button ID="btnEliminarFinal" CssClass="btn btn-outline-danger" runat="server" Text="Eliminar" OnClick="btnEliminarFinal_Click" />

                    </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
