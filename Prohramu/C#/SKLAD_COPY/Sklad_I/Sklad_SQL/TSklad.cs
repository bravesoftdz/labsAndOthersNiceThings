using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace Sklad_SQL
{
    class TSklad
    {
        public DataTable TabSklad = new DataTable();        //��������� public-���� � ������ TabSklad ���� DataTable

        public TSklad()         // ����������� ����� TSklad; 
        {
            // ��������� ������� ������� 
            // ��� cNpp, cNameGroup, cNameProduct, cProduser, cCount, cPrise, cVartist - ����� ��'����
            // ���� DataColumn, � �������� ����� � ������ - �������� ���� ���������� ColumName.
            // ����� ������� ColumName ���� ���� � ���������
            DataColumn cNpp = new DataColumn("�_��");
            DataColumn cNameGroup = new DataColumn("�����");
            DataColumn cNameProduct = new DataColumn("�����");
            DataColumn cProduser = new DataColumn("��������");
            DataColumn cCount = new DataColumn("ʳ������");
            DataColumn cPrise = new DataColumn("ֳ��");
            DataColumn cVartist = new DataColumn("�������");
            //��������� ���� �����, �� ������ ���������� � ��������
            cNpp.DataType = System.Type.GetType("System.Int32");
            cNameGroup.DataType = System.Type.GetType("System.String");
            cNameProduct.DataType=System.Type.GetType("System.String");
            cProduser.DataType = System.Type.GetType("System.String");
            cCount.DataType = System.Type.GetType("System.Int32");
            cPrise.DataType = System.Type.GetType("System.Decimal");
            cVartist.DataType = System.Type.GetType("System.Decimal");
            // ����� ������� �� �������
            TabSklad.Columns.Add(cNpp);
            TabSklad.Columns.Add(cNameGroup);
            TabSklad.Columns.Add(cNameProduct);
            TabSklad.Columns.Add(cProduser);
            TabSklad.Columns.Add(cPrise);
            TabSklad.Columns.Add(cCount);
            TabSklad.Columns.Add(cVartist);
        }

        // ����� TSkladAddRow ��� ��������� ����� �� �������
        public void TSkladAddRow(string pNameGroup, string pNameProduct, string pProduser, int pCount, decimal pPrise)
        {
            int nn;
            nn = TabSklad.Rows.Count;
            // ��������� ����� rowSklad �� ����� ������� TabSklad
            // ����� ����� ���� ������ ���� � ���� � �������, �� � ������� �������
            DataRow rowSklad = TabSklad.NewRow();
            rowSklad["�_��"] = nn++;        // ���������� ��������� ���� ��������, ������� ����� ���������
            rowSklad["�����"] = pNameGroup;
            rowSklad["�����"] = pNameProduct;
            rowSklad["��������"] = pProduser;
            rowSklad["ֳ��"] = pPrise;
            rowSklad["ʳ������"] = pCount;
            rowSklad["�������"] = pCount * pPrise;
            TabSklad.Rows.Add(rowSklad);    // ������ ����������� ����� �� �������
        }

        // ColumnPropSet - �� ����� ��� ������������ ������ ������������ �������� DataGridView 
        public void ColumnPropSet(DataGridView DGV)
        {
            DGV.Columns["�_��"].HeaderText = "� �/�";
            DGV.Columns["�����"].HeaderText = "�����";
            DGV.Columns["�����"].HeaderText = "�����";
            DGV.Columns["��������"].HeaderText = "��������";
            DGV.Columns["ֳ��"].HeaderText = "ֳ��";
            DGV.Columns["ʳ������"].HeaderText = "ʳ������";
            DGV.Columns["�������"].HeaderText = "�������";
            DGV.Columns["�_��"].ReadOnly = true;    // ������� ����� � ������� ���������� ���������, �� ���������� ����������� ������� � ��� ��� 
            DGV.Columns["�������"].ReadOnly = true;
            DGV.Columns["�_��"].Width = 40;
            DGV.Columns["�����"].Width = 100;
            DGV.Columns["�����"].Width = 160;
            DGV.Columns["��������"].Width = 160;
            DGV.Columns["ֳ��"].Width = 70;
            DGV.Columns["ʳ������"].Width = 70;
            DGV.Columns["�������"].Width = 70;
            DGV.Columns["�_��"].DefaultCellStyle.BackColor = Color.Green;
        }

    }
}
