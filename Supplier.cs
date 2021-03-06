﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;
using ProjectCS;

namespace Project
{
    public partial class Supplier : ChildForm
    {
        SqlConnection con;
        SqlCommand cmd;
       // SqlDataReader dr;
       // SqlDataAdapter da;
       // SqlCommandBuilder cb;
       // DataSet ds;
       // DataTable dt;
        public Supplier(SqlConnection sql, ToolStripMenuItem menu)
            : base(sql, menu)
        {
            try
            {
                con = conn;
                InitializeComponent();
                initialADOObject();
                this.cbSearchOpt.SelectedIndex = 0;
                this.cbSearchOpt.DropDownStyle = ComboBoxStyle.DropDownList;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected override void load()
        {
            loadSupplierInfo();
        }

        void initialADOObject()
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        void loadSupplierInfo() {
            SqlCommand c = cmd.Clone();
            c.CommandText = "getSupplier";
            SqlDataReader dr = c.ExecuteReader();
            dataGridView1.Rows.Clear();
            while (dr.Read())
            {

                dataGridView1.Rows.Add(dr[0].ToString(), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[6].ToString(), dr[7].ToString(), dr[8].ToString(), dr[9].ToString(), dr[10].ToString());
            }
            dr.Close();
        }

        void addSupplier() {
            SqlCommand c = cmd.Clone();
            c.CommandText = "insertSupplier";


            SqlParameter param = new SqlParameter("@companyname", SqlDbType.NVarChar, 40);
            param.Value = txtCompanyName.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@contactname", SqlDbType.NVarChar, 30);
            param.Value = txtContactName.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@contacttitle", SqlDbType.NVarChar, 30);
            param.Value = txtContactTitle.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@address", SqlDbType.NVarChar, 60);
            param.Value = txtAddress.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@city", SqlDbType.NVarChar, 15);
            param.Value = txtCity.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@region", SqlDbType.NVarChar, 15);
            param.Value = txtRegion.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@postalcode", SqlDbType.NVarChar, 10);
            param.Value = txtPostalCode.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@country", SqlDbType.NVarChar, 15);
            param.Value = txtCountry.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@phone", SqlDbType.NVarChar, 24);
            param.Value = mtbPhone.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@fax", SqlDbType.NVarChar, 24);
            param.Value = txtFax.Text;
            c.Parameters.Add(param);

            c.ExecuteNonQuery();

            loadSupplierInfo();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            //MessageBox.Show(validateInput().ToString());
            if (validateInput() == false) return;
            else
                addSupplier();



           
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            loadSupplierInfo();
        }

        void updateSupplier() {
            SqlCommand c = cmd.Clone();
            c.CommandText = "updateSupplier";

            SqlParameter param = new SqlParameter("@supplierid", SqlDbType.Int);
            param.Value = txtID.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@companyname", SqlDbType.NVarChar, 40);
            param.Value = txtCompanyName.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@contactname", SqlDbType.NVarChar, 30);
            param.Value = txtContactName.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@contacttitle", SqlDbType.NVarChar, 30);
            param.Value = txtContactTitle.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@address", SqlDbType.NVarChar, 60);
            param.Value = txtAddress.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@city", SqlDbType.NVarChar, 15);
            param.Value = txtCity.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@region", SqlDbType.NVarChar, 15);
            param.Value = txtRegion.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@postalcode", SqlDbType.NVarChar, 10);
            param.Value = txtPostalCode.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@country", SqlDbType.NVarChar, 15);
            param.Value = txtCountry.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@phone", SqlDbType.NVarChar, 24);
            param.Value = mtbPhone.Text;
            c.Parameters.Add(param);

            param = new SqlParameter("@fax", SqlDbType.NVarChar, 24);
            param.Value = txtFax.Text;
            c.Parameters.Add(param);

            c.ExecuteNonQuery();

            loadSupplierInfo();
        }


        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (validateInput() == false) return;
            else
            updateSupplier();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                btnAdd.Enabled = false;
                btnDelete.Enabled = true;
                btnUpdate.Enabled = true;
                DataGridViewRow r = dataGridView1.SelectedRows[0];
                txtID.Text = r.Cells[0].Value.ToString();
                txtCompanyName.Text = r.Cells[1].Value.ToString() ;
                txtContactName.Text = r.Cells[2].Value.ToString();
                txtContactTitle.Text = r.Cells[3].Value.ToString();
                txtAddress.Text = r.Cells[4].Value.ToString();
                txtCity.Text = r.Cells[5].Value.ToString();
                txtRegion.Text = r.Cells[6].Value.ToString();
                txtPostalCode.Text = r.Cells[7].Value.ToString();
                txtCountry.Text = r.Cells[8].Value.ToString();
                mtbPhone.Text = r.Cells[9].Value.ToString();
                txtFax.Text = r.Cells[10].Value.ToString();

             }
            else
            {
                btnAdd.Enabled = true;
                btnDelete.Enabled = false;
                btnUpdate.Enabled = false;
            }
        }

        void searchByID() {
            SqlCommand c = cmd.Clone();
            c.CommandText = "searchBySupID";

            SqlParameter param = new SqlParameter("@supplierid", SqlDbType.Int);
            param.Value = txtSearch.Text;
            c.Parameters.Add(param);

            SqlDataReader dr = c.ExecuteReader();
            dataGridView1.Rows.Clear();
            while (dr.Read())
            {
                dataGridView1.Rows.Add(dr[0].ToString(), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[6].ToString(), dr[7].ToString(), dr[8].ToString(), dr[9].ToString(), dr[10].ToString());
            }
            dr.Close();
            
         }

        void searchByCompanyName()
        {
            SqlCommand c = cmd.Clone();
            c.CommandText = "searchByCompanyName";

            SqlParameter param = new SqlParameter("@companyname", SqlDbType.NVarChar, 40);
            param.Value = txtSearch.Text;
            c.Parameters.Add(param);

            SqlDataReader dr = c.ExecuteReader();
            dataGridView1.Rows.Clear();
            while (dr.Read())
            {
                dataGridView1.Rows.Add(dr[0].ToString(), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[6].ToString(), dr[7].ToString(), dr[8].ToString(), dr[9].ToString(), dr[10].ToString());
            }
            dr.Close();

        }

        void searchByContactName()
        {
            SqlCommand c = cmd.Clone();
            c.CommandText = "searchByContactName";

            SqlParameter param = new SqlParameter("@contactname", SqlDbType.NVarChar, 30);
            param.Value = txtSearch.Text;
            c.Parameters.Add(param);

            SqlDataReader dr = c.ExecuteReader();
            dataGridView1.Rows.Clear();
            while (dr.Read())
            {
                dataGridView1.Rows.Add(dr[0].ToString(), dr[1].ToString(), dr[2].ToString(), dr[3].ToString(), dr[4].ToString(), dr[5].ToString(), dr[6].ToString(), dr[7].ToString(), dr[8].ToString(), dr[9].ToString(), dr[10].ToString());
            }
            dr.Close();

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (cbSearchOpt.Text.Equals("By ID")) searchByID();
            else if (cbSearchOpt.Text.Equals("By Company Name")) searchByCompanyName();
            else if (cbSearchOpt.Text.Equals("By Contact Name")) searchByContactName();
            else loadSupplierInfo();
        }

        void deleteSupplier() {
            SqlCommand c = cmd.Clone();
            c.CommandText = "deleteSupplier";

            SqlParameter param = new SqlParameter("@supplierid", SqlDbType.Int);
            param.Value = txtID.Text;
            c.Parameters.Add(param);

            c.ExecuteNonQuery();
      
            loadSupplierInfo();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {   
                        DialogResult dr = MessageBox.Show("Are you sure???", "Confirm", MessageBoxButtons.YesNo,
                                                MessageBoxIcon.Question);
                        if (dr == DialogResult.Yes)
                        {
                            deleteSupplier();
                            
                        }
        }

        private void maskedTextBox1_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {

        }

        bool validateInput()
        {
            bool error = false;

            if (txtCompanyName.Text.Length > 40)
            {
                errorProvider1.SetError(txtCompanyName, "Input out of range!");
                error = true;
            }

            if (txtCompanyName.Text.Length <= 0)
            {
                errorProvider1.SetError(txtCompanyName, "Please input!");
                error = true;
            }


            if (txtContactName.Text.Length > 30)
            {
                errorProvider1.SetError(txtContactName, "Input out of range!");
                error = true;
            }

            if (txtContactName.Text.Length <= 0)
            {
                errorProvider1.SetError(txtContactName, "Please input!");
                error = true;
            }

            if (txtContactTitle.Text.Length > 30)
            {
                errorProvider1.SetError(txtContactTitle, "Input out of range!");
                error = true;
            }


            if (txtAddress.Text.Length > 60)
            {
                errorProvider1.SetError(txtAddress, "Input out of range!");
                error = true;
            }


            if (txtCity.Text.Length > 15)
            {
                errorProvider1.SetError(txtCity, "Input out of range!");
                error = true;
            }


            if (txtRegion.Text.Length > 15)
            {
                errorProvider1.SetError(txtRegion, "Input out of range!");
                error = true;
            }


            if (txtPostalCode.Text.Length > 10)
            {
                errorProvider1.SetError(txtPostalCode, "Input out of range!");
                error = true;
            }


            if (txtCountry.Text.Length > 15)
            {
                errorProvider1.SetError(txtCountry, "Input out of range!");
                error = true;
            }


            if (mtbPhone.Text.Length > 24)
            {
                errorProvider1.SetError(mtbPhone, "Input out of range!");
                error = true;
            }


            if (txtFax.Text.Length > 24)
            {
                errorProvider1.SetError(txtFax, "Input out of range!");
                error = true;
            }
            if (mtbPhone.MaskCompleted == false)
            {
                error = true;
                errorProvider1.SetError(mtbPhone, "This is not a phone number!");

            }


            if (error == true)
                return false;
            else
            {
                errorProvider1.Clear();
                return true;
            }
            




        }

        private void mtbPhone_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyValue < 48 || e.KeyValue > 57) return;
        }   
       


            
            
        





    }
}
