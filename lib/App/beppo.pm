use v6;

class App::beppo {
    has $.start-date;
    has $.end-date;

    submethod BUILD(:$start-date, :$end-date) {
        $!start-date = $start-date ?? Date.new($start-date)
                                   !! Date.today.earlier(years => 1);
        $!end-date = $end-date ?? Date.new($end-date)
                               !! Date.today;
    }

    method run {
        True;
    }
}

# vim: expandtab shiftwidth=4 ft=perl6
