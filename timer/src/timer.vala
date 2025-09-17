public class Timer{
    private uint16  duration = 0; // durations in seconds
    private uint    timer_id = 0;

    
    public Timer(uint8 hours, uint8 minutes, uint8 seconds){
        this.duration = hours * 3600 + minutes * 60 + seconds;
    }

    public void start(){
        timer_id = GLib.Timeout.add_seconds(1, ()=> {
            if (duration <= 0){ return false; }
            duration--;
            return true;
        })
    }
}