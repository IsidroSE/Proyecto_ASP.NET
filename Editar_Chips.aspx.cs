using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Editar_Chips : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btn_editar_Click(object sender, EventArgs e)
    {
        int cant;
        cant = SqlDataSource2.Update();
        if (cant == 1)
        {
            lbl_resultado.Text = "El chip se ha editado correctamente.";
        }
        else
        {
            lbl_resultado.Text = "Se ha producido un error al editar" +
                " el chip.";
        }
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
        SqlDataReader datos;
        datos = (SqlDataReader)
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);

        if (datos.Read())
        {
            txt_codigo.Text = datos["codigo"] + "";
            txt_dorsal.Text = datos["dorsal"] + "";
        }
        else
        {
            lbl_resultado.Text = "Este chip no existe " +
                "en la base de datos.";
        }
    }
}