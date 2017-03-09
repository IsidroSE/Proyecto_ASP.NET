using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Editar_Carreras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
        SqlDataReader datos;
        datos = (SqlDataReader)
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);

        if (datos.Read())
        {
            txt_id_carrera.Text = datos["id_carrera"] + "";
            txt_num_carreraE.Text = datos["num_carrera"] + "";
            txt_descripcionE.Text = datos["descripcion"] + "";
            txt_fechaE.Text = datos["fecha"] + "";
            txt_distanciaE.Text = datos["distancia"] + "";
            txt_hora_inicioE.Text = datos["hora_inicio"] + "";
        }
        else
        {
            lbl_resultado.Text = "Este número de carrera no existe " +
                "en la base de datos.";
        }
    }

    protected void btn_editar_Click(object sender, EventArgs e)
    {
        int cant;
        cant = SqlDataSource2.Update();
        if (cant == 1)
        {
            lbl_resultado.Text = "La carrera se ha editado correctamente.";
        }
        else
        {
            lbl_resultado.Text = "Se ha producido un error al editar" +
                "la carrera.";
        }

    }
}