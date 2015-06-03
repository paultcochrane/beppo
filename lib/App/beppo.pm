use v6;

class App::beppo {
    has $.start-date = Date.today.earlier(years => 1);
    has $.end-date = Date.today;
}

# vim: expandtab shiftwidth=4 ft=perl6
