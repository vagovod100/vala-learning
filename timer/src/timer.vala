public class Timer : GLib.Object{
    private int     duration = 0; // durations in seconds
    private uint    timer_id = 0;

    public signal void time_decreased(); // sends when duration decreased

    
    public void init(int hours, int minutes, int seconds){
        this.duration = hours * 3600 + minutes * 60 + seconds;
    }

    public void start(){
        stop();

        timer_id = GLib.Timeout.add_seconds(1, ()=> {
            if (duration <= 0){ return false; }
            duration--;
            time_decreased();
            return true;
        });
    }

    private void stop(){
        if(timer_id != 0){
            GLib.Source.remove(timer_id);
            timer_id = 0;
        }
    }
}