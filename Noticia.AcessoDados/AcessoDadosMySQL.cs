﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;

namespace Noticia.AcessoDados
{

    /// <summary>
    /// Classe de acesso a dados para MySQL
    /// </summary>
    public static class MySQLDados
    {
        #region Cria a conexão

        private static MySqlConnection Conexao;

        private static MySqlConnection CriarConexao()
        {
            Conexao = new MySqlConnection(@"Minha String de Conexão");
            Conexao.Open();
            return Conexao;
        }

        public static void FecharConexao()
        {
            if (Conexao != null)
            {
                Conexao.Close();
                Conexao = null;
            }
        }

        #endregion

        #region Parâmetros que vão para banco

        private static MySqlParameterCollection objParametros = new MySqlCommand().Parameters;

        public static void LimparParametros()
        {
            objParametros.Clear();
        }

        public static void AdicionarParametros(string strNomeParametro, object objValor)
        {
            objParametros.Add(new MySqlParameter(strNomeParametro, objValor));
        }

        #endregion

        #region Persistência - Inserir, Alterar, Excluir e Consultar

        //Inserir, Alterar e Excluir
        public static object ExecutarManipulacao(CommandType objTipo, string strSql)
        {
            try
            {
                //SP = Stored Procedure (Procedimento Armazenado no MySQL)
                //strSql => é o comando SQL ou o nome da SP
                if (Conexao == null)
                    Conexao = CriarConexao();

                MySqlConnection objConexao = Conexao;

                MySqlCommand objComando = objConexao.CreateCommand();
                //Informa se será executada uma SP ou um texto SQL
                objComando.CommandType = objTipo;
                objComando.CommandText = strSql;
                objComando.CommandTimeout = 999999999; //Segundos

                //Adicionar os parâmetros para ir para o banco Sql Server
                foreach (MySqlParameter objParametro in objParametros)
                    objComando.Parameters.Add(new MySqlParameter(objParametro.ParameterName, objParametro.Value));

                return objComando.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        //Consultar registros do banco de dados
        public static DataTable ExecutaConsultar(CommandType objTipo, string strSql)
        {
            try
            {
                if (Conexao == null)
                    Conexao = CriarConexao();

                MySqlConnection objConexao = Conexao;
                MySqlCommand objComando = objConexao.CreateCommand();
                objComando.CommandType = objTipo;
                objComando.CommandText = strSql;
                objComando.CommandTimeout = 999999999;

                foreach (MySqlParameter objParametro in objParametros)
                    objComando.Parameters.Add(new MySqlParameter(objParametro.ParameterName, objParametro.Value));

                MySqlDataAdapter objAdaptador = new MySqlDataAdapter(objComando);
                DataTable objTabelaRecebeDados = new DataTable();

                objAdaptador.Fill(objTabelaRecebeDados);

                return objTabelaRecebeDados;
            }
            catch (Exception objErro)
            {
                throw new Exception(objErro.Message);
            }

        }

        #endregion
    }
}
