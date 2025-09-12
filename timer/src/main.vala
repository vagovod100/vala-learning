public class App : Adw.Application {
    public App () {
        Object (application_id: "com.vagovod.Timer");
    }

    public override void activate () {
        var win = this.active_window as MainWindow;
        if (win == null) {
            win = new MainWindow (this);
        }
        win.present ();
    }

    public static int main (string[] args) {
        Adw.init ();
        var app = new App ();
        return app.run (args);
    }
}
