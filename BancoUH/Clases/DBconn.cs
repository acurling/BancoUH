using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BancoUH.Clases
{
    public class DBconn
    {
        int conexion;
        public static SqlConnection conexionBanco()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["BancoUHConnectionString1"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }
        
    }
}