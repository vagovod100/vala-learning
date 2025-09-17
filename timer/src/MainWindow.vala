[GtkTemplate (ui = "/com/vagovod/Timer/MainWindow.ui")]
public class MainWindow : Adw.ApplicationWindow {
    [GtkChild]
    private unowned Gtk.SpinButton hours_spin;
    [GtkChild]
    private unowned Gtk.SpinButton minutes_spin;
    [GtkChild]
    private unowned Gtk.SpinButton seconds_spin;

    [GtkChild]
    private unowned Gtk.Button start_button;

    public MainWindow (App app) {
        Object (application: app);

        start_button.clicked.connect(
            () => {
                stdout.printf("%s : %s : %s\n", hours_spin.text, minutes_spin.text, seconds_spin.text);
            }
        );
    }
}
