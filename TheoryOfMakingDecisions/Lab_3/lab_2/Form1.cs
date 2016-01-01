﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace lab_2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            inputPDataGridView.RowCount = 4;
            inputPDataGridView.ColumnCount = 4;

            resultDataGridView.RowCount = 4;
            resultDataGridView.ColumnCount = 4;

            initializeGridView(inputPDataGridView);

            inputPDataGridView[0, 0].Value = "0";
            inputPDataGridView[0, 1].Value = "1";
            inputPDataGridView[0, 2].Value = "0";
            inputPDataGridView[0, 3].Value = "1";

            inputPDataGridView[1, 0].Value = "0";
            inputPDataGridView[1, 1].Value = "1";
            inputPDataGridView[1, 2].Value = "1";
            inputPDataGridView[1, 3].Value = "0";

            inputPDataGridView[2, 0].Value = "0";
            inputPDataGridView[2, 1].Value = "1";
            inputPDataGridView[2, 2].Value = "0";
            inputPDataGridView[2, 3].Value = "1";

            inputPDataGridView[3, 0].Value = "0";
            inputPDataGridView[3, 1].Value = "0";
            inputPDataGridView[3, 2].Value = "0";
            inputPDataGridView[3, 3].Value = "1";

        }

        private void testButton_Click(object sender, EventArgs e)
        {
            bool[][] p = readData(inputPDataGridView);
            bool[][] result = LogicFunctions.initCustomArray(4);

            result = LogicFunctions.transitionRelationship(p, 4);

            printDataToDataGrid(resultDataGridView, result);
        }

        #region Helper methods
        private void initializeGridView(DataGridView gridView)
        {
            for (int i = 0; i < gridView.RowCount; i++) 
            {
                for (int j = 0; j < gridView.ColumnCount; j++)
                {
                    gridView[j, i].Value = "0";
                }
            }
        }

        private void printDataToDataGrid(DataGridView gridView, bool[][] data)
        {
            for (int i = 0; i < gridView.RowCount; i++)
            {
                for (int j = 0; j < gridView.ColumnCount; j++)
                {
                    gridView[j, i].Value = Convert.ToString(Convert.ToInt32(data[i][j]));
                }
            }
        }

        private bool[][] readData(DataGridView gridView)
        {
            bool[][] result = LogicFunctions.initCustomArray(gridView.RowCount);

            try
            {
                for (int i = 0; i < gridView.RowCount; i++)
                {
                    for (int j = 0; j < gridView.ColumnCount; j++)
                    {
                        int value = Convert.ToInt32((gridView[j, i].Value));
                        if (value == 1)
                        {
                            result[i][j] = true;
                        }
                        else
                        {
                            result[i][j] = false;
                        }
                    }
                }
            }
            catch (FormatException)
            {
                MessageBox.Show("Wrong input values");
            }

            return result;
        }
        #endregion
    }

    // клас, що обчислює бінарні операції
    class LogicFunctions 
    {
        public LogicFunctions()
        {
        }

        public static bool[][] join(bool[][] p, bool[][] q, int size) 
        {
            bool[][] result = initCustomArray(size);

            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    result[i][j] = p[i][j] || q[i][j];
                }
            }

            return result;
        }

        public static bool[][] junction(bool[][] p, bool[][] q, int size)
        {
            bool[][] result = initCustomArray(size);
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    result[i][j] = p[i][j] && q[i][j];
                }
            }
            return result;
        }

        public static bool[][] difference(bool[][] p, bool[][] q, int size)
        {
            bool[][] result = initCustomArray(size);
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    if ((p[i][j] == false && q[i][j] == true) ||
                        (p[i][j] == true && q[i][j] == false))
                    {
                        result[i][j] = p[i][j];
                    }
                    else
                    {
                        result[i][j] = false;
                    }
                }
            }
            return result;
        }

        public static bool[][] symetricDifference(bool[][] p, bool[][] q, int size)
        {
            bool[][] result = initCustomArray(size);

            bool[][] a = difference(p, q, size);
            bool[][] b = difference(q, p, size);

            result = join(a, b, size);

            return result;
        }

        public static bool[][] addition(bool[][] p, int size)
        {
            bool[][] result = initCustomArray(size);
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    result[i][j] = p[i][j] == true ? false : true;
                }
            }
            return result;
        }

        public static bool[][] inverse(bool[][] p, int size)
        {
            bool[][] result = initCustomArray(size);
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    result[i][j] = p[j][i];
                }
            }
            return result;
        }

        public static bool[][] composition(bool[][] p, bool[][] q, int size)
        {
            bool[][] result = initCustomArray(size);
            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    bool val = false;
                    for (int k = 0; k < size; k++)
                    {
                        if (p[i][k] && q[k][j])
                        {
                            val = true;
                            break;
                        } else {
                            val = false;
                        }
                    }

                    result[i][j] = val;
                }
            }
            return result;
        }

        public static bool[][] transitionRelationship(bool[][]p, int size)
        {
            List<bool[][]> compositions = new List<bool[][]>();

            // step 1 - Пошук першого збігу матриці
            bool[][] result = initCustomArray(size);
            bool shouldProceed = true;
            while (shouldProceed)
            {
                bool[][] previousRelation = compositions.Count == 0 ? p : compositions[compositions.Count - 1];
                bool[][] resComp = composition(p, previousRelation, size);

                compositions.Add(resComp);

                bool isEqualFinded = true;
                for (int k = 0; k < compositions.Count; k++)
                {
                    bool[][] currentRelation = compositions[k];
                    for (int i = 0; i < size; i++)
                    {
                        for (int j = 0; j < size; j++)
                        {
                            if (currentRelation[i][j] != resComp[i][j])
                            {
                                isEqualFinded = false;
                                break;
                            }
                        }
                        if (!isEqualFinded)
                            break;
                    }
                }

                if (isEqualFinded)
                {
                    break;
                }
            }

            // step 2 Пошук транзитивного замикання
            bool[][] initialRelation = p;
            for (int i = 0; i < compositions.Count; i++)
            {
                initialRelation = join(initialRelation, compositions[i], size);
            }

            // step 3 Пошук відношення досяжності
            bool[][] ordinary = initCustomArray(size);
            for (int i = 0; i < size; i++)
                ordinary[i][i] = true;

            result = join(initialRelation, ordinary, size);

            // step 4 Пошук взаємної досяжності
            result = junction(result, inverse(result, size), size);

            return result;
        }

        public static bool[][] initCustomArray(int size)
        {
            bool[][] result = new bool[size][];
            for (int i = 0; i < size; i++)
                result[i] = new bool[size];
            return result;
        }

    } 
}
