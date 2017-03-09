using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Importar_fichero : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_confirmar_Click(object sender, EventArgs e)
    {
        
        //Subir el fichero
        filup_fichero.SaveAs(Server.MapPath(".") + "/ficheros/" +
            filup_fichero.FileName);

        //Abrir fichero
        StreamReader arch = new StreamReader(Server.MapPath(".") + "/" +
            "ficheros/" + filup_fichero.FileName);

        Char separador = '\t';
        string cadena;
        String[] datos;

        //Abrimos la conexión con la base de datos
        string s = System.Configuration.ConfigurationManager.
            ConnectionStrings["cadena_conexion"].ConnectionString;
        SqlConnection _conexion = new SqlConnection(s);
        _conexion.Open();

        //SQL
        SqlCommand comando;
        SqlDataReader registro;
        string sql;

        /*Listas donde guardaremos los participantes a actualizar*/
        List<Participante> lista_participantes = new List<Participante>();

        //Leer el fichero
        while (arch.Peek() >= 0)
        {

            //Obtener la línea completa
            cadena = arch.ReadLine();

            //Separamos el código de la hora
            datos = cadena.Split(separador);
            string codigo = datos[0];
            string hora = datos[1];

            /*SQL donde obtendremos la hora y código de cada corredor 
             * con el dorsal que corresponda al código*/
           sql = "SELECT car.hora_inicio, p.id_participante " +
               "FROM Participantes p, carreras car, codigo_chips cod"
               + " WHERE cod.codigo = '" + codigo + "' AND " +
               "cod.dorsal = p.dorsal AND " +
               "p.num_carrera = car.num_carrera";

            //Creamos el comando
            comando = new SqlCommand(sql, _conexion);

            //Ejecutamos la query
            registro = comando.ExecuteReader();

            while (registro.HasRows)
            {

                while (registro.Read())
                {
                    /*Obtenemos el codigo del participante y tiempo de la carrera para
                     calcular el tiempo que ha tardado en finalizar la carrera*/
                    Participante p = 
                        new Participante(Int32.Parse(registro["id_participante"].ToString()), 
                        registro["hora_inicio"].ToString(), hora);
                    lista_participantes.Add(p);
                }

                registro.NextResult();
            }
            registro.Close();
        }

        //Cerrar el fichero, ya que no lo necesitaremos más
        arch.Close();

        /*Una vez reunidos todos los participantes junto sus tiempos, procederemos
         a actualizarlo en la base de datos*/

        //Recorremos la lista de participantes y actualizamos su tiempo
        foreach (Participante par in lista_participantes)
        {

            sql = "UPDATE Participantes SET tiempo_oficial = '" + par.getTiempo_tardado() + "' " +
                "WHERE id_participante = " + par.getID();

            comando = new SqlCommand(sql, _conexion);

            comando.ExecuteNonQuery();

        }

        //Cerrar la conexión con la base de datos
        _conexion.Close();

        lbl_resultado.Text = "Las horas se han actualizado correctamente.";

    }

    public class Participante
    {
        private int id;
        private string hora_carrera;
        private string hora_jugador;
        private TimeSpan tiempo_tardado;

        public Participante(int id, string hora_carrera, string hora_jugador)
        {
            this.id = id;
            this.hora_carrera = hora_carrera;
            this.hora_jugador = hora_jugador;
            this.tiempo_tardado = calcular_tiempo_tardado(hora_carrera, hora_jugador);
        }

        public int getID()
        {
            return this.id;
        }

        public TimeSpan getTiempo_tardado()
        {
            return this.tiempo_tardado;
        }

        public TimeSpan calcular_tiempo_tardado(string s_hora_carrera, string s_hora_jugador)
        {

            //Obtenemos la hora, minutos y segundos por separado
            int hora_carrera = Int32.Parse(s_hora_carrera.Substring(0, 2));
            int minutos_carrera = Int32.Parse(s_hora_carrera.Substring(3, 2));
            int segundos_carrera = Int32.Parse(s_hora_carrera.Substring(6, 2));

            int hora_jugador = Int32.Parse(s_hora_jugador.Substring(0, 2));
            int minutos_jugador = Int32.Parse(s_hora_jugador.Substring(2, 2));
            int segundos_jugador = Int32.Parse(s_hora_jugador.Substring(4, 2));

            TimeSpan tiempo_carrera = new TimeSpan(hora_carrera, minutos_carrera, segundos_carrera);
            TimeSpan tiempo_jugador = new TimeSpan(hora_jugador, minutos_jugador, segundos_jugador);

            return (tiempo_jugador - tiempo_carrera);
        }

    }

}