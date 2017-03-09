using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Editar_Participantes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_insertar_Click(object sender, EventArgs e)
    {
        int cant;
        cant = SqlDataSource4.Update();
        if (cant == 1)
        {
            lbl_resultado.Text = "El participante se ha editado correctamente.";
        }
        else
        {
            lbl_resultado.Text = "Se ha producido un error al editar" +
                "el participante.";
        }
    }

    protected void btn_buscar_carrera_Click(object sender, EventArgs e)
    {
        SqlDataSource4.DataSourceMode = SqlDataSourceMode.DataReader;
        SqlDataReader datos;
        datos = (SqlDataReader)
        SqlDataSource4.Select(DataSourceSelectArguments.Empty);

        if (datos.Read())
        {
            txt_id.Text = datos["id_participante"] + "";
            txt_carrera.Text = datos["num_carrera"] + "";
            txt_dorsal.Text = datos["dorsal"] + "";
            txt_nombre.Text = datos["nombre"] + "";
            txt_apellidos.Text = datos["apellidos"] + "";
            txt_club.Text = datos["club"] + "";
        }
        else
        {
            lbl_resultado.Text = "Este número de carrera no existe " +
                "en la base de datos.";
        }
    }
}