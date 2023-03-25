using BancoUH.Clases;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BancoUH.Vistas
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }


        protected void LlenarGrid()
        {
            string s = ConfigurationManager.ConnectionStrings["BancoUHConnectionString1"].ConnectionString;
            string query = " SELECT * from Cliente ";
            using (SqlConnection conexion = new SqlConnection(s))
            {
                using (SqlCommand comando = new SqlCommand(query))
                {
                    using (SqlDataAdapter adaptador = new SqlDataAdapter())
                    {
                        comando.Connection = conexion;
                        adaptador.SelectCommand = comando;
                        using (DataSet ds = new DataSet())
                        {
                            adaptador.Fill(ds);
                            GridView1.DataSource = ds.Tables[0];
                            GridView1.DataBind();// refrescar el gridview
                        }
                        conexion.Close();
                    }

                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ClsClientes.AgregarClientes(tnombre.Text)>=0)
            {
                LlenarGrid();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (ClsClientes.BorrarClientes(int.Parse(tid.Text))>=0)
            {
                LlenarGrid();
            }

        }
    }
}