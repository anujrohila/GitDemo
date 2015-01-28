using System;
using System.Web.Mvc;
using DevExpress.Web.Mvc;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace platform.ltsyazilim.com.Controllers
{
    public class FormElementSettingsHelper
    {
        static Action<TextBoxSettings> textBoxSettingsMethod;

        public static Action<TextBoxSettings> TextBoxSettingsMethod
        {
            get
            {
                if (textBoxSettingsMethod == null)
                    textBoxSettingsMethod = CreateTextBoxSettingsMethod();
                return textBoxSettingsMethod;
            }
        }
        static Action<TextBoxSettings> CreateTextBoxSettingsMethod()
        {
            return settings =>
            {
                settings.ControlStyle.CssClass = "DevExInput";
                settings.Width = System.Web.UI.WebControls.Unit.Percentage(100);
                settings.ControlStyle.Font.Name = "Arial";
                settings.ControlStyle.Font.Size = 10;
                settings.Properties.ValidationSettings.ErrorTextPosition = ErrorTextPosition.Bottom;
                settings.Properties.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.ImageWithText;
                settings.Properties.ValidationSettings.Display = Display.Dynamic;
                settings.ShowModelErrors = true;
            };
        }

    }
}