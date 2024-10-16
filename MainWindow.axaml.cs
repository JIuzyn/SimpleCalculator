using Avalonia.Controls;
using Avalonia.Interactivity;
using System;
using System.Data;

namespace SimpleCalculator
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button)
            {
                InputTextBox.Text += button.Content.ToString();
            }
        }

        private void Clear_Click(object sender, RoutedEventArgs e)
        {
            InputTextBox.Text = string.Empty;
        }

        private void Calculate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = new DataTable().Compute(InputTextBox.Text, null);
                InputTextBox.Text = result.ToString();
            }
            catch (Exception)
            {
                InputTextBox.Text = "Ошибка";
            }
        }
    }
}
