using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Sklad_SQL
{
    public partial class FServ : Form
    {
        public FServ()
        {
            InitializeComponent();
            FservTB.Text = Form1.GlStringParameter;     // ���� ������ ��� ���, �� ������� ���� ������ � ���� �����
        }

        private void FservBOk_Click(object sender, EventArgs e)
        {
            Form1.GlStringParameter = FservTB.Text;     // �������� �������� ������� � ������� �����
            Close();    //������� ����� FServ ��� ��� �������������� ��������� ��������
        }
    }
}