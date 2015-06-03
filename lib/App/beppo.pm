use v6;

class App::beppo {
    has $.start-date;
    has $.end-date;
    has $.base-search-dir;

    submethod BUILD(:$start-date, :$end-date, :$base-search-dir) {
        $!start-date = $start-date ?? Date.new($start-date)
                                   !! Date.today.earlier(years => 1);
        $!end-date = $end-date ?? Date.new($end-date)
                               !! Date.today;
        $!base-search-dir = $base-search-dir ?? $base-search-dir.IO
                                             !! $*HOME;
    }

    method run {
        True;
    }
}

# vim: expandtab shiftwidth=4 ft=perl6
