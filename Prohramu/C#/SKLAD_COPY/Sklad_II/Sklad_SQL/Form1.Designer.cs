﻿namespace Sklad_SQL
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.DGSklad = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.BAddRowToTable = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.TBKilkist = new System.Windows.Forms.TextBox();
            this.TBCina = new System.Windows.Forms.TextBox();
            this.TBVyrobnyk = new System.Windows.Forms.TextBox();
            this.TBNazva = new System.Windows.Forms.TextBox();
            this.TBGrupa = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.файлToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.записатиТаблицюToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.зчитатиТаблицюToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.фільтруватиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.встановитиФільтрToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.знятиФільтрToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.сортуватиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.встановитиКритерійСортуванняToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.сортуватиПоГрупіToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.пошукToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.пошукПоНазвіToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.DGSkladSum = new System.Windows.Forms.DataGridView();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGSklad)).BeginInit();
            this.panel1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGSkladSum)).BeginInit();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.DGSklad);
            this.splitContainer1.Panel1.Controls.Add(this.panel1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.DGSkladSum);
            this.splitContainer1.Size = new System.Drawing.Size(927, 826);
            this.splitContainer1.SplitterDistance = 367;
            this.splitContainer1.TabIndex = 0;
            // 
            // DGSklad
            // 
            this.DGSklad.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGSklad.Dock = System.Windows.Forms.DockStyle.Fill;
            this.DGSklad.Location = new System.Drawing.Point(0, 144);
            this.DGSklad.Name = "DGSklad";
            this.DGSklad.Size = new System.Drawing.Size(927, 223);
            this.DGSklad.TabIndex = 1;
            this.DGSklad.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.DGSklad_CellValueChanged);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.GradientInactiveCaption;
            this.panel1.Controls.Add(this.BAddRowToTable);
            this.panel1.Controls.Add(this.label6);
            this.panel1.Controls.Add(this.TBKilkist);
            this.panel1.Controls.Add(this.TBCina);
            this.panel1.Controls.Add(this.TBVyrobnyk);
            this.panel1.Controls.Add(this.TBNazva);
            this.panel1.Controls.Add(this.TBGrupa);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.menuStrip1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(927, 144);
            this.panel1.TabIndex = 0;
            // 
            // BAddRowToTable
            // 
            this.BAddRowToTable.Location = new System.Drawing.Point(785, 54);
            this.BAddRowToTable.Name = "BAddRowToTable";
            this.BAddRowToTable.Size = new System.Drawing.Size(96, 61);
            this.BAddRowToTable.TabIndex = 11;
            this.BAddRowToTable.Text = "Додати рядок\r\n до таблиці \r\n\"Склад\"";
            this.BAddRowToTable.UseVisualStyleBackColor = true;
            this.BAddRowToTable.Click += new System.EventHandler(this.BAddRowToTable_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label6.Location = new System.Drawing.Point(235, 36);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(235, 18);
            this.label6.TabIndex = 10;
            this.label6.Text = "Ведіть нові дані у таблицю \"Склад\":";
            // 
            // TBKilkist
            // 
            this.TBKilkist.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.TBKilkist.Location = new System.Drawing.Point(681, 89);
            this.TBKilkist.Name = "TBKilkist";
            this.TBKilkist.Size = new System.Drawing.Size(57, 26);
            this.TBKilkist.TabIndex = 9;
            // 
            // TBCina
            // 
            this.TBCina.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.TBCina.Location = new System.Drawing.Point(589, 89);
            this.TBCina.Name = "TBCina";
            this.TBCina.Size = new System.Drawing.Size(61, 26);
            this.TBCina.TabIndex = 8;
            // 
            // TBVyrobnyk
            // 
            this.TBVyrobnyk.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.TBVyrobnyk.Location = new System.Drawing.Point(407, 89);
            this.TBVyrobnyk.Name = "TBVyrobnyk";
            this.TBVyrobnyk.Size = new System.Drawing.Size(151, 26);
            this.TBVyrobnyk.TabIndex = 7;
            // 
            // TBNazva
            // 
            this.TBNazva.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.TBNazva.Location = new System.Drawing.Point(179, 89);
            this.TBNazva.Name = "TBNazva";
            this.TBNazva.Size = new System.Drawing.Size(198, 26);
            this.TBNazva.TabIndex = 6;
            // 
            // TBGrupa
            // 
            this.TBGrupa.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.TBGrupa.Location = new System.Drawing.Point(12, 89);
            this.TBGrupa.Name = "TBGrupa";
            this.TBGrupa.Size = new System.Drawing.Size(133, 26);
            this.TBGrupa.TabIndex = 5;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label5.Location = new System.Drawing.Point(678, 64);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(63, 18);
            this.label5.TabIndex = 4;
            this.label5.Text = "Кількість";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label4.Location = new System.Drawing.Point(596, 64);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(36, 18);
            this.label4.TabIndex = 3;
            this.label4.Text = "Ціна";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label3.Location = new System.Drawing.Point(446, 64);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(67, 18);
            this.label3.TabIndex = 2;
            this.label3.Text = "Виробник";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(235, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(45, 18);
            this.label2.TabIndex = 1;
            this.label2.Text = "Назва";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(35, 64);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "Група";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.файлToolStripMenuItem,
            this.фільтруватиToolStripMenuItem,
            this.сортуватиToolStripMenuItem,
            this.пошукToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(927, 24);
            this.menuStrip1.TabIndex = 12;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // файлToolStripMenuItem
            // 
            this.файлToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.записатиТаблицюToolStripMenuItem,
            this.зчитатиТаблицюToolStripMenuItem});
            this.файлToolStripMenuItem.Name = "файлToolStripMenuItem";
            this.файлToolStripMenuItem.Size = new System.Drawing.Size(45, 20);
            this.файлToolStripMenuItem.Text = "Файл";
            // 
            // записатиТаблицюToolStripMenuItem
            // 
            this.записатиТаблицюToolStripMenuItem.Name = "записатиТаблицюToolStripMenuItem";
            this.записатиТаблицюToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.записатиТаблицюToolStripMenuItem.Text = "Записати таблицю";
            this.записатиТаблицюToolStripMenuItem.Click += new System.EventHandler(this.записатиТаблицюToolStripMenuItem_Click);
            // 
            // зчитатиТаблицюToolStripMenuItem
            // 
            this.зчитатиТаблицюToolStripMenuItem.Name = "зчитатиТаблицюToolStripMenuItem";
            this.зчитатиТаблицюToolStripMenuItem.Size = new System.Drawing.Size(180, 22);
            this.зчитатиТаблицюToolStripMenuItem.Text = "Зчитати таблицю";
            this.зчитатиТаблицюToolStripMenuItem.Click += new System.EventHandler(this.зчитатиТаблицюToolStripMenuItem_Click);
            // 
            // фільтруватиToolStripMenuItem
            // 
            this.фільтруватиToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.встановитиФільтрToolStripMenuItem,
            this.знятиФільтрToolStripMenuItem});
            this.фільтруватиToolStripMenuItem.Name = "фільтруватиToolStripMenuItem";
            this.фільтруватиToolStripMenuItem.Size = new System.Drawing.Size(83, 20);
            this.фільтруватиToolStripMenuItem.Text = "Фільтрувати";
            // 
            // встановитиФільтрToolStripMenuItem
            // 
            this.встановитиФільтрToolStripMenuItem.Name = "встановитиФільтрToolStripMenuItem";
            this.встановитиФільтрToolStripMenuItem.Size = new System.Drawing.Size(181, 22);
            this.встановитиФільтрToolStripMenuItem.Text = "Встановити фільтр";
            this.встановитиФільтрToolStripMenuItem.Click += new System.EventHandler(this.встановитиФільтрToolStripMenuItem_Click);
            // 
            // знятиФільтрToolStripMenuItem
            // 
            this.знятиФільтрToolStripMenuItem.Name = "знятиФільтрToolStripMenuItem";
            this.знятиФільтрToolStripMenuItem.Size = new System.Drawing.Size(181, 22);
            this.знятиФільтрToolStripMenuItem.Text = "Зняти фільтр";
            this.знятиФільтрToolStripMenuItem.Click += new System.EventHandler(this.знятиФільтрToolStripMenuItem_Click);
            // 
            // сортуватиToolStripMenuItem
            // 
            this.сортуватиToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.встановитиКритерійСортуванняToolStripMenuItem,
            this.сортуватиПоГрупіToolStripMenuItem});
            this.сортуватиToolStripMenuItem.Name = "сортуватиToolStripMenuItem";
            this.сортуватиToolStripMenuItem.Size = new System.Drawing.Size(74, 20);
            this.сортуватиToolStripMenuItem.Text = "Сортувати";
            // 
            // встановитиКритерійСортуванняToolStripMenuItem
            // 
            this.встановитиКритерійСортуванняToolStripMenuItem.Name = "встановитиКритерійСортуванняToolStripMenuItem";
            this.встановитиКритерійСортуванняToolStripMenuItem.Size = new System.Drawing.Size(253, 22);
            this.встановитиКритерійСортуванняToolStripMenuItem.Text = "Встановити критерій сортування";
            this.встановитиКритерійСортуванняToolStripMenuItem.Click += new System.EventHandler(this.встановитиКритерійСортуванняToolStripMenuItem_Click);
            // 
            // сортуватиПоГрупіToolStripMenuItem
            // 
            this.сортуватиПоГрупіToolStripMenuItem.Name = "сортуватиПоГрупіToolStripMenuItem";
            this.сортуватиПоГрупіToolStripMenuItem.Size = new System.Drawing.Size(253, 22);
            this.сортуватиПоГрупіToolStripMenuItem.Text = "Сортувати по групі";
            this.сортуватиПоГрупіToolStripMenuItem.Click += new System.EventHandler(this.сортуватиПоГрупіToolStripMenuItem_Click);
            // 
            // пошукToolStripMenuItem
            // 
            this.пошукToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.пошукПоНазвіToolStripMenuItem});
            this.пошукToolStripMenuItem.Name = "пошукToolStripMenuItem";
            this.пошукToolStripMenuItem.Size = new System.Drawing.Size(52, 20);
            this.пошукToolStripMenuItem.Text = "Пошук";
            // 
            // пошукПоНазвіToolStripMenuItem
            // 
            this.пошукПоНазвіToolStripMenuItem.Name = "пошукПоНазвіToolStripMenuItem";
            this.пошукПоНазвіToolStripMenuItem.Size = new System.Drawing.Size(161, 22);
            this.пошукПоНазвіToolStripMenuItem.Text = "Пошук по назві";
            this.пошукПоНазвіToolStripMenuItem.Click += new System.EventHandler(this.пошукПоНазвіToolStripMenuItem_Click);
            // 
            // DGSkladSum
            // 
            this.DGSkladSum.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGSkladSum.Dock = System.Windows.Forms.DockStyle.Fill;
            this.DGSkladSum.Location = new System.Drawing.Point(0, 0);
            this.DGSkladSum.Name = "DGSkladSum";
            this.DGSkladSum.Size = new System.Drawing.Size(927, 455);
            this.DGSkladSum.TabIndex = 0;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(927, 826);
            this.Controls.Add(this.splitContainer1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Дослідження класів DataTable, DataGridView, splitContainer";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.DGSklad)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGSkladSum)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox TBKilkist;
        private System.Windows.Forms.TextBox TBCina;
        private System.Windows.Forms.TextBox TBVyrobnyk;
        private System.Windows.Forms.TextBox TBNazva;
        private System.Windows.Forms.TextBox TBGrupa;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button BAddRowToTable;
        private System.Windows.Forms.DataGridView DGSklad;
        private System.Windows.Forms.DataGridView DGSkladSum;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem файлToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem записатиТаблицюToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem зчитатиТаблицюToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem фільтруватиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem встановитиФільтрToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem знятиФільтрToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem сортуватиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem встановитиКритерійСортуванняToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem сортуватиПоГрупіToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem пошукToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem пошукПоНазвіToolStripMenuItem;
    }
}

