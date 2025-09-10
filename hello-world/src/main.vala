class App : Adw.Application {
    private Gtk.Label   label;
    private Gtk.Button  button;

    private bool label_upper_case = false;

    public App(){
        Object(application_id: "com.vagovod.App");
    }

    public override void activate() {
        var window = new Adw.ApplicationWindow(this);
        var header = new Adw.HeaderBar ();

        header.title_widget = new Adw.WindowTitle ("Basic Vagovod App", null);

        var vbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 25);
        vbox.homogeneous = true;

        vbox.append(header);

        label = new Gtk.Label("текст");
        label.justify = Gtk.Justification.CENTER;

        button = new Gtk.Button.with_label("НАЖАТЬ!");

        button.clicked.connect (
            () => {
                if(label_upper_case == true){
                    label.label = label.label.down();
                }
                else{
                    label.label = label.label.up();
                }

                label_upper_case = !label_upper_case;
            }
        );

        vbox.append(label);
        vbox.append(button);

        window.set_content(vbox);
        window.present ();
    }

    public static int main(string[] args) {
        Adw.init();
        var app = new App();
        return app.run (args);
    }
}
