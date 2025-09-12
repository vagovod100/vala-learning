[GtkTemplate (ui = "/com/vagovod/Timer/MainWindow.ui")]
public class MainWindow : Adw.ApplicationWindow {
    public MainWindow (App app) {
        Object (application: app);
    }
}
