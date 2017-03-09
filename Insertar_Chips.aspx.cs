using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Insertar_Chips : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_insertar_Click(object sender, EventArgs e)
    {
        int cant;
        cant = SqlDataSource1.Insert();
        if (cant == 1)
        {
            lbl_resultado.Text = "El chip se ha insertado correctamente.";
        }
        else
        {
            lbl_resultado.Text = "Se ha producido un error al insertar" +
                "el chip.";
        }
    }
}