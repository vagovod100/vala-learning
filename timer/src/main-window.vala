[GtkTemplate (ui = "/com/vagovod/Timer/main-window.ui")]
public class MainWindow : Adw.ApplicationWindow {
    [GtkChild]
    private unowned Gtk.SpinButton hours_spin;
    [GtkChild]
    private unowned Gtk.SpinButton minutes_spin;
    [GtkChild]
    private unowned Gtk.SpinButton seconds_spin;

    [GtkChild]
    private unowned Gtk.Button start_button;

    private GLib.Time time = GLib.Time();
    private string? string_time;

    private Timer timer = new Timer();

    public MainWindow (App app) {
        Object (application: app);

        start_button.clicked.connect( () => {
            time.hour   = int.parse(hours_spin.text);
            time.minute = int.parse(minutes_spin.text);
            time.second = int.parse(seconds_spin.text);

            timer.init(time.hour, time.minute, time.second);

            timer.start();
        });
        
        
        timer.time_decreased.connect( () => {
            time.second--;

            if(time.second == -1){
                time.second = 59;
                time.minute--;
            }

            if(time.minute == -1){
                time.minute = 59;
                time.hour--;
            }

            string_time = time.to_string();
            stdout.printf("%s\n", string_time);
        });
        
    }
}
